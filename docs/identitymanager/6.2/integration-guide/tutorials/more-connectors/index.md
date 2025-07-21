---
title: "More Connectors"
description: "More Connectors"
sidebar_position: 20
---

# More Connectors

In this section, we are going to implement a new connector from scratch, using everything we've learned so far.

The target managed system is SAB, a popular banking solution, for which we would like to manage entitlements with .

## Configure the Synchronization

### Entity model generation

SAB handles access authorization using Users and Roles.

This is a conceptual model of SAB resources:

The first step is to write this model using **Entity Types** and **Entity Associations** with the trusty configuration generator tool.

Try to write the connector description file using the Active Directory as an example.

```
<Connector xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" Name="SAB" DefaultEncoding="UTF-8" DefaultSeparator=";" ExcludedColumnsRegex="^Command$">  <File Path="C:/UsercubeTraining/Sources/sab_roles.csv" />  <File Path="C:/UsercubeTraining/Sources/sab_users.csv" />  <File Path="C:/UsercubeTraining/Sources/sab_usersroles.csv" />  <PrimaryKey Path="C:/UsercubeTraining/Sources/sab_roles.csv" Header="Code" EntityTypeName="Role" />  <PrimaryKey Path="C:/UsercubeTraining/Sources/sab_users.csv" Header="Login" EntityTypeName="User" /></Connector>

```

Generate the SAB connector using the configuration generator tool.

The generated XML file should contain the following entity types:

* SAB\_User
* SAB\_Role

Rename the generated XML file as `SAB Connector.xml` and move the file to `C:/UsercubeTraining/SAB/`.

### Manual fulfillment

In our scenario,  isn't allowed by the target organization to connect directly to the SAB server. That's why we are going to use a manual fulfillment procedure. Instead of  automatically provisioning changes, specific users are going to be notified of changes and will have to apply them to the SAB solution by hand.

```
<Connector Identifier="SAB" DisplayName_L1="SAB" Agent="Local" /><Connection Connector="SAB" DisplayName_L1="SAB User" Identifier="SABManual" Package="Usercube.Manual@0000001" /><Connection Connector="SAB" DisplayName_L1="SAB User" Identifier="SABUsers" Package="Usercube.CSV.Complete@0000001" /><Connection Connector="SAB" DisplayName_L1="SAB Role" Identifier="SABRoles" Package="Usercube.CSV.Complete@0000001" /><Connection Connector="SAB" DisplayName_L1="SAB Link User Role" Identifier="SABUsersRoles" Package="Usercube.CSV.Complete@0000001" />

```

### Associations

Materializing the association between SAB\_User and SAB\_Role involves:

* Identifying the right properties, and setting their `Type` to `ForeignKey`.
* Writing the relevant **EntityAssociations**.
* Writing the relevant **EntityAssociationMapping**.

```
<EntityType Identifier="SAB_Role" DisplayName_L1="SAB - Role">    <Property Identifier="Code" DisplayName_L1="Code" IsKey="true" TargetColumnIndex="0" Type="String" />    <Property Identifier="Identifier" DisplayName_L1="Identifier" TargetColumnIndex="1" Type="String" />    <Property Identifier="Users" DisplayName_L1="Users" Type="ForeignKey" />  </EntityType>  <EntityType Identifier="SAB_User" DisplayName_L1="SAB - User">    <Property Identifier="Login" DisplayName_L1="Login" IsKey="true" TargetColumnIndex="0" Type="String" />    <Property Identifier="State" DisplayName_L1="State" TargetColumnIndex="1" Type="String" />    <Property Identifier="Expiration" DisplayName_L1="Expiration" TargetColumnIndex="2" Type="String" />    <Property Identifier="Roles" DisplayName_L1="Roles" Type="ForeignKey" /></EntityType>  <EntityAssociation Identifier="SAB_User_Role" DisplayName_L1="SAB User Role" Property1="SAB_Role:Users" Property2="SAB_User:Roles" IsProperty1Collection="1" IsProperty2Collection="1"/>  <EntityTypeMapping Identifier="SAB_Role" Connector="SAB" ConnectionTable="SABRoles">    <Property Identifier="Code" ConnectionColumn="Code" IsPrimaryKey="true" />    <Property Identifier="Identifier" ConnectionColumn="Identifier" />  </EntityTypeMapping>  <EntityTypeMapping Identifier="SAB_User" Connector="SAB" ConnectionTable="SABUsers">    <Property Identifier="Login" ConnectionColumn="Login" IsPrimaryKey="true" />    <Property Identifier="State" ConnectionColumn="State" />    <Property Identifier="Expiration" ConnectionColumn="Expiration" />  </EntityTypeMapping>  <EntityAssociationMapping Connector="SAB" ConnectionTable="SABUsersRoles" Column1="Login" Column2="Role" EntityPropertyMapping1="SAB_User:Login" EntityPropertyMapping2="SAB_Role:Code"/>
```

### Internal display name

Remember to add the `InternalDisplayName` property to both `SAB_User` and `SAB_Role` .

```

 <EntityPropertyExpression Identifier="SAB_Roles_InternalDisplayName" Expression="C#:person:return person.Code + &quot; &quot; + person.Identifier;" EntityType="SAB_Role" Property="InternalDisplayName" /> <EntityPropertyExpression Identifier="SAB_Users_InternalDisplayName" Expression="C#:person:return person.Login + &quot; &quot; + person.State;" EntityType="SAB_User" Property="InternalDisplayName" />

```

## Find SAB Account Owners

Now, we are going to link our `Directory_User` identities to their respective SAB account.

* Create a file named `Directory User Role Model SAB.xml` in `C:/UsercubeTraining/Conf/Directory/`.
* Create a new category for the SAB resource types:

  ```
  <Category Policy="Default" Identifier="SAB" DisplayName_L1="Syst�me SAB" />
  ```
* Write the resource type, linking `Directory_User` to `SAB_User`:

```

    <ResourceType Identifier="Compte_SAB" DisplayName_L1="SAB Account"
        Category="SAB" Policy="Default" TargetEntityType="SAB_User" SourceEntityType="Directory_User">    </ResourceType>    <ResourceTypeMapping Identifier="Compte_SAB" Connection="SABManual" />

```

* Add the relevant scalar rules to fulfill a SAB\_User from a Directory\_User:

```

    <ResourceType Identifier="Compte_SAB" DisplayName_L1="liaison Personne vers SAB"
        Category="SAB" Policy="Default" TargetEntityType="SAB_User" SourceEntityType="Directory_User">      <ScalarRule Property="Login" Expression="C#:person:return &quot;U&quot; + person.EmployeeId;"/>      <ScalarRule Property="State" Expression="C#:return &quot;Actif&quot;;"/>    </ResourceType>    <ResourceTypeMapping Identifier="Compte_SAB" Connection="SABManual" />

```

* Add the correlation rule for matching a SAB account to its owner, given that a SAB account's login is followed by its owner's `employeeId`.

```

    <ResourceCorrelationRule ResourceType="Compte_SAB" TargetBinding="Login"
        Policy="Default" SourceMatchedConfidenceLevel="100"
        SourceExpression="C#:person:return &quot;U&quot; + person.EmployeeId;" />

```

## Add Menu Items

To add the SAB connector to the left navigation menu, write the menu items to the `SAB Navigation.xml` file in the directory `C:/UsercubeTraining/Conf/SAB/`.

```
<MenuItem Identifier="Nav_Connectors_SAB" DisplayName_L1="SAB" DisplayName_L2="SAB" ParentMenuItem="Nav_Connectors">    <MenuItem Identifier="Nav_Connectors_SAB_Role" DisplayName_L1="SAB Roles" DisplayName_L2="R�les SAB" EntityType="SAB_Role" />    <MenuItem Identifier="Nav_Connectors_SAB_User" DisplayName_L1="SAB Users" DisplayName_L2="Utilisateurs SAB" EntityType="SAB_User" />  </MenuItem>
```

## Configure the Job

The following scaffolding creates the synchronization and provisioning job tasks.

The `SAB Jobs.xml` file should be written to the directory `C:/UsercubeTraining/Conf/SAB/`.

```
<ConfigurationFile xmlns="urn:schemas-usercube-com:configuration">  <CreateConnectorSynchroComplete Connector="SAB" JobIdentifier="SABSynchronization">    <OpenIdIdentifier Identifier="Job"/>  </CreateConnectorSynchroComplete></ConfigurationFile>
```

## Test the Configuration

Import the configuration before going further.

### SAB resources synchronization

From the UI, execute the `SAB_Synchronization_Complete` job.

SAB users and roles should now be available from the UI menu items.

### Onboarding process

#### Create a new user

* Use the new employee workflow to create a new user.

  A new SAB account should be awaiting for approval in the provisioning review screen.
* Approve the creation.
* Execute the `SAB_Synchronization_Complete` job.

  A new SAB account should be listed under the Manual Provisioning screen, available from the homepage.

#### Simulate the manual provisioning

* Open the `sab_users.csv` file from the `Sources` folder.
* Add a new line representing the new SAB User account, using the information from the Manual Provisioning screen:

  `U99845;actif`

#### Check the feedback loop

To detect the change:

* Execute the `SAB_Synchronization_Complete` job.
* Go to the **New Employee** screen, click on **View Permissions**.

  The linked SAB account's Provisioning State should be set to `Verified`.