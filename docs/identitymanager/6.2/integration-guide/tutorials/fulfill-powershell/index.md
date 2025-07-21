---
title: "Fulfill PowerShell"
description: "Fulfill PowerShell"
sidebar_position: 10
---

# Fulfill PowerShell

A vast number of popular enterprise software solutions can be natively connected to . However, there are still some cases where you have no choice but to use scripting to achieve the connection. For this,  provides a PowerShell connector.

This sections shows how to use this connector.

This scenario is not the most realistic from an IGA perspective, it is only designed to show the mechanics of the PowerShell connector.

We are going to work with a Microsoft Exchange mail server and see how we can synchronize its data and fulfill resources to the server.

This will cover all the steps that we have already discussed in the main tutorial:

1. Build a connector.
2. Build a role model.
3. Build synchronization and provisioning jobs.

## Data Model

The resources relevant for this tutorial in Microsoft Exchange are the MailBox resources. They represent e-mail accounts, used to send and receive emails.

## Connector

The connector can be generated with the configuration generator tool from the `Exchange_Mailbox.csv` file provided in the `Source` folder. The CSV file contains a list of MailBox resources from the target Exchange server.

```

<?xml version="1.0" encoding="utf-8"?><Connector xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" Name="Exchange" DefaultEncoding="UTF-8" DefaultSeparator=";" ExcludedColumnsRegex="^Command$">  <File Path="C:/UsercubeTraining/Sources/Exchange_MailBox.csv" />  <PrimaryKey Path="C:/UsercubeTraining/Sources/Exchange_MailBox.csv" Header="UserPrincipalName" EntityTypeName="MailBox" /></Connector>

```

The generated XML file should be renamed `Exchange Connector.xml` and moved to `C:/UsercubeTraining/Conf/Exchange`.

The following should be updated in the `Exchange Connector.xml` file:

* Add an `InternalDisplayName` property.
* Add the matching `<EntityPropertyExpression>`.
* Add the connection `ExchangeFulfillment`

```

<Connection Connector="Exchange" DisplayName_L1="Exchange" Identifier="ExchangeFulfillment" Package="Usercube.Powershell@0000001"/>

```

* Write the expression that sets the internal display name to the `UserPrincipalName` value of the MailBox:

  ```

  <EntityPropertyExpression Identifier="MailBoxDisplayName" DisplayName_L1="MailBox displayname" EntityType="Exchange_MailBox" Property="InternalDisplayName" Expression="C#:mailbox:return mailbox.UserPrincipalName;"/>

  ```
* Create a file named `Exchange Navigation.xml` in the directory `C:/UsercubeTraining/Conf/Exchange` with the following menu items:

```

<?xml version="1.0" encoding="utf-8"?><ConfigurationFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="urn:schemas-usercube-com:configuration">  <MenuItem Identifier="Nav_Connectors_Exchange" DisplayName_L1="Exchange" DisplayName_L2="Exchange" ParentMenuItem="Nav_Connectors">    <MenuItem Identifier="Nav_Connectors_Exchange_MailBox" DisplayName_L1="Mail box" DisplayName_L2="boite mail" EntityType="Exchange_MailBox" />  </MenuItem></ConfigurationFile>

```

## Role Model

The Exchange role model is designed to:

1. Link existing `Directory_User` identities to their respective MailBox accounts.
2. Fulfill new MailBox accounts for chosen users.

The next steps will be completed in `C:/UsercubeTraining/Conf/Directory`.

### Resource type and correlation

* Create a new `Directory User Role Model Exchange.xml` file.
* Write a new `Exchange` category:

  ```

  <Category Policy="Default" Identifier="Exchange" DisplayName_L1="Exchange" DisplayName_L2="Exchange" />

  ```
* Write the resource type that describes a MailBox account's fulfilment from `Directory_User` resources, with scalar rules:

  ```

  <ResourceType Identifier="Exchange_UserMail" DisplayName_L1="Exchange MailBox (User)" DisplayName_L2="Boite Mail Exchange (utilisateur)" Policy="Default" TargetEntityType="Exchange_MailBox" Category="Exchange" SourceEntityType="Directory_User" ApprovalWorkflowType="One">    <ScalarRule Property="EmailAdresse" Expression="C#:person:return person.LastName + "." + person.FirstName + "@Exchange.com";" />    <ScalarRule Property="UserPrincipalName" Expression="C#:person:return "U" + person.EmployeeId;" />    <ScalarRule Property="DistinguishedName" Expression="C#:person:return person.LastName + "." + person.FirstName;" /></ResourceType><ResourceTypeMapping Identifier="Exchange_UserMail" Connection="ExchangeFulfillment" />

  ```

  It's worth mentioning that there's no `TypeRule` defined yet. We're going to write it later on.
* Write the correlation rule, based on the MailBox's `sAMAccountName` and the user's `employeeId`.

  ```

  <ResourceCorrelationRule ResourceType="Exchange_UserMail" TargetBinding="sAMAccountName" Policy="Default" SourceMatchedConfidenceLevel="100" SourceExpression="C#:person:return "U" + person.EmployeeId;" />

  ```

### Single role

We're going to configure the role model to allow a security officer to manually select which users are entitled to a MailBox account, and to allow  to fulfill the account.

* From the **Access Roles** screen, create a new Single Role `MailExchange`, in the newly created `Exchange` Category.

  Then, we're going to link this role to the creation of a `MailBox` account by using a `TypeRule`.
* From the **Access Rules** screen, create a new `TypeRule` for `Directory_User`. As resource type, select `Exchange MailBox (user)`. As criteria, select `SingleRole > MailExchange`. This means that a directory user with the role `Mail Exchange` is entitled to an `Exchange MailBox (user)` account.

In the Active Directory (nominative) resource type, we used a Type Rule too. It was designed to provide every user with an AD account. Hence no criteria was used. Here, we want to manually select who will be assigned a MailBox account. We achieve that by assigning the Mail Exchange role which triggers the `TypeRule` thanks to the **Single Role** criterion. We don't assign a Resource Type directly, we go through roles.

## Provisioning

The provisioning is handled by a PowerShell script. Download the Scripts folder and make sure the FulfillExchange.ps1 file is in C:/UsercubeTraining/Scripts.

This script executes a set of provisioning orders generated by  in the form of a json file.

To plug this script into , open the `Runtime > appsettings.agent.json` file.

* Create a new `Connections > ExchangeFulfillment` section.
* In this section, add the `PowerShellScriptPath` key with the `C:/UsercubeTraining/Scripts/FulfillExchange.ps1` value.

```

"Connections": {
    "ADExportFulfillment": {
      ....
    },
    "LDAPFulfillment": {
      ...
    },
    "ExchangeFulfillment":{
        "PowerShellScriptPath":"C:/UsercubeTraining/Scripts/FulfillExchange.ps1"
      }
  }

```

To execute the provisioning, create the `Exchange Jobs.xml` file with the following content:

```

<ConfigurationFile xmlns="urn:schemas-usercube-com:configuration">  <CreateConnectorSynchroIncremental Connector="Exchange" JobIdentifier="Exchange_Synchronization">    <OpenIdIdentifier Identifier="Job"/>  </CreateConnectorSynchroIncremental></ConfigurationFile>

```

This scaffolding generates tasks for both synchronization and provisioning.

The script is now going to be triggered by the provisioning task of the `Exchange_Synchronization` job.

## Testing

* Go to **Users > *Jerome Barbier***.
* **Modify Permissions**.
* Add the `Mail Exchange` role.
* Execute the workflow.
* In the **Provisioning Review** screen, find the MailBox account creation line.
* Authorize the creation by clicking **Confirm creation**.

A new provisioning order for the new MailBox account is now ready to be executed.

* Run the `Exchange_Synchronization_Dirty` job a first time.

The `Exchange_Mailbox.csv` resources are now synchronized and correlated with their matching identity.  has detected the missing MailBox account for *Jerome Barbier* and is ready to perform its provisioning.

* Run the `Exchange_Synchronization_Dirty` job a second time.

This time, the provisioning tasks have found a provisioning order to execute. The resource has now been created and correlated with the identity.