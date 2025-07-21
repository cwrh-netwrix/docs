---
title: "Reference Data & Identities Loading"
description: "Reference Data & Identities Loading"
sidebar_position: 50
---

# Reference Data & Identities Loading

## Data Loading Methods

To load/create actual reference data, several methods are available:

* We can input data in the UI. This is the most straightforward way for a reasonable amount of data.
* We can declare resources in the xml files. This is useful for a very limited amount of data, and avoids having to configure a UI to do it.
* We can mass load data from the CSV files if the files are available or easy to produce using the same tools as for the synchronization.
* We can load the data from the existing resources of a managed system already synchronized such as HR (via the same tools, performing some kind of internal provisioning from a set of resources to another set of resources).

Here, we are going to use the XML files and internal provisioning methods for the users, records and organization data. We are going to employ HR data to kick-start the reference data.

Later in the tutorial, we are going to add more reference data from the UI, for example *contractors* who are not in the HR solution.

## Employee Category

Employee category entity types represent the type of employee. This entity type is going to be assigned to only two resources:

* Internal (full time employees)
* External (contractors)

For such a small number of resources, we can use the XML files to create them.

In the `Directory Connector.xml` file, add the following snippet:

```

<Resource Id="-200" DisplayName_L1="Internal" DisplayName_L2="Interne" C4="Internal" Type="Directory_EmployeeCategory" /><Resource Id="-201" DisplayName_L1="External" DisplayName_L2="Externe" C4="External" Type="Directory_EmployeeCategory" />

```

## Users and Records

We are going to use the internal provisioning method in order to create reference data from existing HR data.

To create the reference data from the HR data, we have to describe how resources of entity type `Directory_User`, `Directory_UserRecord` and `Directory_Department` are going to be built from `HR_Person` and `HR_Department` resources.

We are going to use tools from the provisioning feature of :

* Resource Types
* Scalar and Query rules
* Correlation rules

First, create a new `HR Role Model Directory.xml` file in the `C:/UsercubeTraining/Conf/HR` folder.

### Resource types

From the provisioning perspective, a Resource Type creates a link between a target resource and a source resource. The target resource is to be created or updated from the source data.

Resource Types are also used to classify a connector's resources (managed system entries) according to some specific security concerns. Their names should reflect this concern.

This all takes place in the `C:/UsercubeTraining/Conf/HR/HR Role Model Directory.xml` file.

First, let's create a Category to classify the **Resource Types** that we are going to create here:

```

  <Category Policy="Default" Identifier="HR" DisplayName_L1="HR System" DisplayName_L2="Systeme RH" />

```

Then, write the first Resource Type that links resources of entity type `HR_Person` to a resource of entity type `Directory_User`:

```

<ResourceType
    BlockProvisioning="0"
    Identifier="HR_Person_To_Directory_User"
    DisplayName_L1="User (from HR)"
    DisplayName_L2="Collaborateur (source RH)"
    Category="HR"
    Policy="Default"
    TargetEntityType="Directory_User"
    SourceEntityType="HR_Person"></ResourceType>

```

This `ResourceType` element declares that `Directory_User` resources are going to be created (or updated if they already exist) from `HR_Person` resources.

Then, we need a Resource Correlation Rule to help  find the target resource matching a source resource (if it already exists).

```

  <ResourceCorrelationRule
      ResourceType="HR_Person_To_Directory_User"
      TargetBinding="EmployeeID "
      Policy="Default"
      SourceMatchedConfidenceLevel="100"
      SourceBinding="EmployeeID "
  />

```

This `ResourceCorrelationRule` tag stipulates that the target `Directory_User` resource for a source `HR_Person` is the `Directory_User` with the same `EmployeeID` . If 's engine cannot find a target resource using this correlation rule, a new one is created instead.

Finally, scalar rules and query rules explain the actual computation of target `Directory_User` from source `HR_Person` properties. They should be written as follows:

```

  <ResourceType BlockProvisioning="0" Identifier="HR_Person_To_Directory_User" DisplayName_L1="User (from HR)" DisplayName_L2="Collaborateur (source RH)" Category="HR" Policy="Default" TargetEntityType="Directory_User" SourceEntityType="HR_Person">    <TypeRule Policy="Default" />    <ScalarRule Property="EmployeeId" Binding="EmployeeId" />  </ResourceType>

```

The scalar rules compute a scalar property value. The target `EmployeeId` will be an exact copy of the source `EmployeeId`.

You'll notice here the `TypeRule` tag. Its role will be expanded upon further in the
Role Model
 section. For now, let's say it's here to make sure that *all* the `HR_Person` resources trigger the creation of a `Directory_User`.

Applying the same techniques, we will link `Directory_UserRecords` to `HR_Person`.

```

  <ResourceType Identifier="HR_Person_To_Directory_UserRecord" DisplayName_L1="User Record (from HR)" DisplayName_L2="Fiche de collaborateur (source RH)" Category="HR" Policy="Default" TargetEntityType="Directory_UserRecord" BlockProvisioning="0" SourceEntityType="HR_Person" CorrelateMultipleResources="true" >    <TypeRule Policy="Default" />    <ScalarRule Property="Matricule" Binding="Matricule" />    <ScalarRule Property="FirstName" Binding="FirstName" />    <ScalarRule Property="LastName" Binding="LastName" />    <ScalarRule Property="ContractStartDate" Binding="ContractStartDate" Expression="ParseLocalDate:Europe/Paris|dd/MM/yyyy" />    <ScalarRule Property="ContractEndDate" Binding="ContractEndDate" Expression="ParseLocalDateThenAddMinutes:Europe/Paris|dd/MM/yyyy|1440" />    <ScalarRule Property="Login" Expression="C#:resource:return 'U' + resource.Matricule;" />    <QueryRule Property="User" TargetBinding="Matricule" SourceBinding="Matricule" TargetMatchedConfidenceLevel="100" />    <QueryRule Property="Department" TargetBinding="Label" SourceBinding="Departments.Label" TargetMatchedConfidenceLevel="100" />  </ResourceType>

```

Here, we also used query rules to compute an association property value.

The following rule will have the engine link the target `Directory_User` resource to `Directory_Department` resources whose labels are those found in the `HR_Person` resource's `Departments` property value.

```

<QueryRule Property="Department" TargetBinding="Label" SourceBinding="Departments.Label" TargetMatchedConfidenceLevel="100" />

```

You'll notice that `HR_Person` intervenes twice: first to create `Directory_Users` resources, and second to create `Directory_UserRecords`. Both Resource Types do not involve the same `HR_Person`'s properties. This is caused by the difference of model between the `HR` and `Directory` connectors: HR do not use records.

Finally, we link `HR_Department` to `Directory_Department` .

```

  <ResourceType Identifier="HR_Department_To_Directory_Department" DisplayName_L1="Department (from HR)" DisplayName_L2="D�partement (source RH)" BlockProvisioning="0" Policy="Default" Category="HR" TargetEntityType="Directory_Department" SourceEntityType="HR_Department">    <TypeRule Policy="Default" />    <ScalarRule Property="Label" Binding="Label" />    <ScalarRule Property="Code" Binding="Code" />    <QueryRule Property="ParentDepartment" TargetBinding="Label" SourceBinding="ParentDepartment.Label" TargetMatchedConfidenceLevel="100" />    <QueryRule Property="Supervisor" TargetBinding="EmployeeId" SourceBinding="Supervisor.EmployeeId" TargetMatchedConfidenceLevel="100" />  </ResourceType>

```

Resource types are part of a bigger set of objects in : the Role Model.

We have successfully described how to load reference data from HR.

Let's execute the loading process.

Import the configuration before going further.

### Execution

Make sure that  Server is running.

1. Compute the correlation keys, using the following command in the `runtime` directory:

```

./Usercube-Compute-CorrelationKeys.exe --database-connection-string 'data source=.;Database=Usercube;Integrated Security=SSPI;Min Pool Size=10;encrypt=false;' -a

```

This computes a few things beforehand. It helps performance significantly.

2. Execute the Compute Role Model Task in the `runtime` directory:

```

./Usercube-Compute-RoleModel.exe --database-connection-string 'data source=.;Database=Usercube;Integrated Security=SSPI;Min Pool Size=10;encrypt=false;' --entitytype-list 'HR_Person' 'HR_Department'

```

This executes the core algorithm of the engine. See the Evaluate Policy topic for additional information.

* For every `HR_person` and `HR_Department` resource, find a matching `Directory_User` and `Directory_Department`, according to correlation rules. If no target is found for a source, the target will be created in the next step.
* Target property values are computed according to scalar rules and query rules.

The creation/update of target resources is prepared but not effective until the next step is complete.

3. Generate provisioning orders:

```

 ./Usercube-Generate-ProvisioningOrders.exe --database-connection-string 'data source=.;Database=Usercube;Integrated Security=SSPI;Min Pool Size=10;encrypt=false;' --connector 'Directory' -f --mail-from 'no-reply@acme.com' --mail-use-pickup-directory --mail-pickup-directory 'C:/UsercubeTraining/Temp/Mails' --server 'http:/localhost:5000' --output-path 'C:/UsercubeTraining/Temp/ProvisioningOrders'

```

From the result of the previous step, this command creates a set of json files called *provisioning orders*. These files contain the application of the resource types, scalar and query rules that concretely translate into create/update/delete instructions that should be followed in order to generate the reference data.

4. Execute provisioning orders to fulfill internal resources:

```

./Usercube-Fulfill-InternalResources.exe --database-connection-string 'data source=.;Database=Usercube;Integrated Security=SSPI;Min Pool Size=10;encrypt=false;' --connector 'Directory' --input-path 'C:/UsercubeTraining/Temp/ProvisioningOrders'

```

This command executes the provisioning orders that will finally create/update/delete `Directory_User`, `Directory_UserRecords` and `Directory_Department` resources in the `UR_Resources` table.

5. Reiterate steps 1 to 4 twice.

The internal provisioning mechanism of  requires steps 1 to 4 to be performed a total of 3 times to complete the process:

* First time: resources are created, but associations are not yet created (since they require all target resources to already exist).
* Second time: links are created, based on the resources created the first time.
* Third time: links are checked and marked as executed.

You should now be able to see resources in the **Directory** connector in the UI.

This process for creating resources *internally* in  may seem tedious, but it has the immense advantage of using the exact same principles as are used to fulfill resources *externally* to managed systems. Therefore, you currently have all the tools you are going to need in the AD Provisioning section of the tutorial.

Generally speaking, this tediousness can be greatly reduced by using **Jobs**, a mechanism provided by  to automate and schedule such tasks. Let's configure the jobs that perform the steps listed above.

## Jobs

Jobs are mechanisms provided by  that automate the execution of the processes and make them less tedious.

Here's how to configure a job for creating reference data:

* Create the `C:/UsercubeTraining/Conf/Directory/Directory Job.xml` file.
* Write the following snippet:

```

<CreateConnectorSynchroComplete Connector="Directory" JobIdentifier="DirectorySynchronization">    <OpenIdIdentifier Identifier="Job"/>    <NoSynchronization/></CreateConnectorSynchroComplete>

```

This is a scaffolding that configures a job which performs the steps 1 to 5 that were manually executed in the Execution section. Now,

* Import the configuration.
* Go to 's UI.
* Go to **Job Execution** under the **Administration** section on the homepage:

* Select the `DirectorySynchronization` job on the left navigation menu.
* Execute the job by clicking the **Start this job** button.

## Transition

So far, we have performed the following tasks:

1. Synchronize (copy) HR data into .
2. Build a reference data model.
3. Load the reference data.

We're almost ready to talk about entitlements.

However, before we do that, we can't forget the last step. We need to synchronize the Active Directory data so we can handle entitlements from and within the Active Directory.