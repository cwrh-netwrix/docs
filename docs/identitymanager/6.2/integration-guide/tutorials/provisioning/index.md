---
title: "AD Provisioning"
description: "AD Provisioning"
sidebar_position: 40
---

# AD Provisioning

is able to fulfill account and find-grained properties to managed systems. This aspect is mostly aimed at technical users. Application administrators, for example, usually want to watch closely what  fulfills.

This section shows how to handle this type of entitlement.

This section focuses on finding, for every identity, an existing Active Directory account. We will also show how to add a new identity from the UI, such as a *contractor*, and how to create an Active Directory account for this identity.

## Create the Link from Identity to Active Directory Account

To perform these tasks, we need first to explicitly link `Directory_User` resources to `AD_Entry` resources.

* Create the `Conf/Directory/Directory User Role Model AD.xml` file.
* Write the following Resource Type, just as we did to link `HR_Person` to `Directory_User`.

```

  <ResourceType Identifier="AD_Entry_NominativeUser" DisplayName_L1="AD User (nominative)" DisplayName_L2="Compte AD (nominatif)" Policy="Default" TargetEntityType="AD_Entry" Category="AD" SourceEntityType="Directory_User" ApprovalWorkflowType="One">  </ResourceType>  <LdapResourceTypeMapping Identifier="AD_Entry_NominativeUser" Connection="ADExportFulfillment" />

```

* Complete the Resource Type with the following correlation rule:

```

<ResourceCorrelationRule ResourceType="AD_Entry_NominativeUser" TargetBinding="employeeID" Policy="Default" SourceMatchedConfidenceLevel="100" SourceBinding="EmployeeId"/>

```

Note that the `ResourceCorrelationRule` is valid for a given `ResourceType`, here an `AD_Entry_NominativeUser`. This means that the resource type, paired with this correlation rule, has also a classification role. Every resource that correlates with a `Directory_User` according to this rule will be classified as a *nominative Active Directory account*, as opposed, for example, to an *Administration Active Directory account* whose high privileges require a much closer surveillance from the security officer.

 is now able to find, for every identity, the matching Active Directory account using the `EmployeeId` attribute as a correlation key. If it succeeds, the matching identity for an Active Directory account is called the *owner*.

* Import the configuration.
* Compute the correlation keys, using the following command in the `runtime` directory:

```

./Usercube-Compute-CorrelationKeys.exe --database-connection-string 'data source=.;Database=Usercube;Integrated Security=SSPI;Min Pool Size=10;encrypt=false;' -a

```

* Execute the Compute Role Model Task on the `Directory_User` and `Directory_UserRecords` entity types, in the `runtime` directory.

```

./Usercube-Compute-RoleModel.exe --database-connection-string 'data source=.;Database=Usercube;Integrated Security=SSPI;Min Pool Size=10;encrypt=false;' --entitytype-list 'Directory_User' 'Directory_UseRecords'

```

* From the UI, go to the left navigation menu and display the list of Active Directory entries.
* The **Owner/Resource Type** column now displays the owner of each Active Directory account.

## Configure the Provisioning

The next step is to fulfill Active Directory account values in case an identity changes or in case a new identity is added to .

We're going to write scalar and query rules that explain how  is going to fulfill Active Directory account values from the identity value.

* In the `Directory User Role Model AD.xml` file, complete the Resource Type:

```

<ResourceType Identifier="AD_Entry_NominativeUser" DisplayName_L1="AD User (nominative)" DisplayName_L2="Compte AD (nominatif)" Policy="Default" TargetEntityType="AD_Entry" Category="AD" SourceEntityType="Directory_User" ApprovalWorkflowType="One">    <TypeRule TimeOffsetReference="Around" TimeOffsetBeforeReference="-10080" TimeOffsetAfterReference="43200" Policy="Default" />    <ScalarRule Property="givenName" Binding="FirstName" />    <ScalarRule Property="cn" Expression="C#:person:return person.LastName + " " + person.FirstName;" />    <ScalarRule Property="sn" Binding="LastName" />    <ScalarRule Property="sAMAccountName" Binding="Login" />    <ScalarRule Property="userPrincipalName" Binding="Mail" />    <ScalarRule Property="accountExpires" Expression="C#:person:return !person.EndDate.HasValue ? "9223372036854775807" : person.EndDate.Value.AddHours(-5).ToSince1601DateString();" />    <ScalarRule Property="employeeID" Binding="EmployeeId" />    <ScalarRule Property="mail" Binding="Mail" />    <ScalarRule Property="userAccountControl" Expression="C#:person:return "514";" TimeOffsetReference="Before" TimeOffsetBeforeReference="-10080" TimeOffsetAfterReference="0" />    <ScalarRule Property="userAccountControl" Expression="C#:person:return "512";" TimeOffsetReference="Around" TimeOffsetBeforeReference="0" TimeOffsetAfterReference="0" />    <ScalarRule Property="userAccountControl" Expression="C#:person:return "514";" TimeOffsetReference="After" TimeOffsetBeforeReference="0" TimeOffsetAfterReference="43200" />    <QueryRule Property="parentdn" Policy="Default" TargetBinding="AD_Entry:dn" SourceExpression="C#:person:
    return "OU=Users,OU=Ecoles,OU=Sites,DC=acme,DC=internal";" TargetMatchedConfidenceLevel="100" /></ResourceType><LdapResourceTypeMapping Identifier="AD_Entry_NominativeUser" Connection="ADExportFulfillment" />

```

* In the `Conf/AD/AD Jobs.xml` file, remove the `NoProvisioning` element:

```

  <CreateConnectorSynchroComplete Connector="AD" JobIdentifier="ADSynchronization">    <OpenIdIdentifier Identifier="Job"/>  </CreateConnectorSynchroComplete>

```

The `ADExportFulfillment` connection is the connection used to fulfill data in the Active Directory, using the information in the matching `appsettings.agents.json` section that contains credentials for  to authenticate to the Active Directory.
This connection has been declared in the configuration during the
AD Synchronization
tutorial.

## Onboarding Process

We now have everything in place to perform our first onboarding.

We are going to input a new identity using the UI, and fulfill the matching Active Directory account.

* From the homepage, click on **Users**.
* Click on the **New Employee** button.

This opens the **New employee** workflow. Workflows are a model of internal processes within the organization, such as onboarding, offboarding or requesting an assignment of entitlement. The new employee workflow has already been configured for you. We are going to use it to process the onboarding of a new employee.

* Fill in the identity form with the following values:

  + Last name: *Smith*
* First name: *Frank*

  + Category: *External*
* Contract Start Date: *01/03/2021*
* Department: *R&D*
* Click on `> Next step`.

  The second screen shows that *Frank Smith* has automatically been assigned an Active Directory account of type `AD User (nominative)`.
* Click on `> Next step` again.
* Click on `> Send`.

The first step in the workflow process has been executed. You will be shown a request summary. To finalize the creation of the new identity, a second validation step must be performed. As an administrator of , you can perform this second step yourself.

* Go back to the homepage.
* Click on `My Tasks`.
* Select the `99999 � Smith Frank � New Employee` task.
* Click on `Next step`, `Next step` and `Approve`.

You will be shown a request summary. The identity has now been created.

## Provisioning State

The request summary displays a small area at the bottom of the screen that contains a *Provisioning State* card. It shows information about the assignment (AD account) that has been applied to the new identity during the workflow.

The provisioning state indicates the state of the provisioning process relevant to this particular entitlement assignment. Here the value is *Awaiting approval*, meaning that the assignment still has to go through another workflow of approval to be fulfilled. The workflow that has just been executed was designed to approve the creation of an *identity*. Another workflow has been started to validate the provisioning of that new Active Directory account to the Active Directory.

As an administrator, you can also approve the provisioning:

* Go back to the homepage.
* Click on **Provisioning Review**.
* Select the **User** entity type.
* Select the relevant line where the owner is *Frank Smith*.
* Click on **Confirm Creation**.
* The provisioning state is now `Pending`. You can check this by going to **Users**, selecting *Frank Smith* and **View Permissions**. *Pending* means the account has been approved and is now waiting to be provisioned by the relevant task.
* From the **Job Execution** screen, execute the `AD_Synchronization_Complete` job. Thanks to the scaffolding system, it contains the tasks that are going to perform the provisioning.

  The provisioning state is now `Executed`. It means that  has performed the writing request but hasn't checked yet if it has been successful. You can already check it manually by going to your AD LDS and looking for *Frank Smith*'s account.
* Execute a new synchronization of the Active Directory content. The relevant tasks are in the same job: `AD_Synchronization_Complete`.

   performs a synchronization and finds *Frank Smith*'s account: the provisioning state is set to `Verified`.

This whole process (entitlement assignment request, provisioning, check by synchronization) is called IGA and Netwrix Identity Manager feedback loop. It is a guarantee of reliability. Provisioning order execution is always verified. All computations are based on the real state of the managed system, not on a theoretical one.

## Conclusion

In this example, focused on the feedback loop, we didn't use any specific assignment rule. With this state of things, everyone gets a nominative Active Directory account.

The rule also implies that  tries to find an owner for every Active Directory account. An account without owner is identified as an *orphan*, which is a relevant information for the security officer.

We didn't use a particular model of the Active Directory entitlement landscape either. We don't know what Active Directory groups *Frank Smith* is in for example, so we don't actually know anything about his assignments. To achieve this, we need a complete role model.

We'll see in the next section how to link assignments to key identity criteria with dimensions, assignment rules and roles.