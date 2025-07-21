---
title: "Reference Data & Identities Model"
description: "Reference Data & Identities Model"
sidebar_position: 60
---

# Reference Data & Identities Model

In this section, we are going to load into  all the reference data and identities relevant to the problem at hand.

The relevant data represents the organization and its actors that will be needed in the entitlement management and identity lifecycle processes.

To complete this task, we are going to:

* Describe the shape of the reference data using an **Entity Model** like we did for the HR data.
* Load the actual identities and reference data from CSV files.

## The Model

The reference data and identities model is written in the configuration using the Entity Model language, just like the HR data.

### The organization

The organization we're working with is organized as follows:

* Users of the managed systems are internal employees (full-time employees) or external employees (contractors).
* The organization is split into five departments:
  + IT
  + Accounting
  + Factory
  + Management
  + R&D
* Users are members of a department.

In a nutshell, the situation is simple: the reference data shape is going to be very similar to the HR data shape. But we still don't use the HR data as-is because we want to be able to add contractors who are not in the HR solution.

### The multi-position problem

In almost every project, the reference data and identities model usually encounters the following problems:

* User data changes, and these changes can greatly influence the entitlement assignments.
* Sometimes, we need a user's data (and their resulting entitlement assignments) to be valid only for a certain period of time.
* A person can have multiple positions at the same time in the organization. In this case, a User can be member of several organizations at the same time.

These situations are handled in  by using the following model:

* The identity data is contained within a User Entity Type.
* The position data is contained in a Record Entity Type.
* A User is associated with one or several Records.

More on records:

* Each record represents a position for the associated user and its validity is a limited time period.
* Several records can be valid at the same time.
* For each User, we choose a Main Record that holds the most relevant information about that user at that date.

## Procedure

### Bootstrap the model with the connector generator

A good trick to generate the Entity Model is to leverage the configuration generator just as we did with the HR connector.

This time, we don't have full-fledged CSV files, but we can trick the configuration generator with CSV files containing only headers.

The `Source` folder contains the following files:

* `Directory_User.csv`
* `Directory_UserRecord.csv`
* `Directory_Department.csv`

They describe the organization's data.

These files only contain headers, which is good enough for the generator to start things up.

To organize the reference data entity types, we create a "dummy" connector that does not connect to any external system. We usually call it "Directory". Read about our philosophy in the introduction.

Here is how to configure the connector description to generate the Directory entity model:

```
<?xml version="1.0" encoding="utf-8"?><Connector xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" Name="Directory" DefaultEncoding="UTF-8" DefaultSeparator=";" ExcludedColumnsRegex="^Command$">  <File Path="C:/UsercubeTraining/Sources/Directory_Department.csv" />  <File Path="C:/UsercubeTraining/Sources/Directory_User.csv" />  <File Path="C:/UsercubeTraining/Sources/Directory_UserRecord.csv" />  <PrimaryKey Path="C:/UsercubeTraining/Sources/Directory_Department.csv" Header="Code" EntityTypeName="Department" />  <PrimaryKey Path="C:/UsercubeTraining/Sources/Directory_User.csv" Header="Matricule" EntityTypeName="User" />  <PrimaryKey Path="C:/UsercubeTraining/Sources/Directory_UserRecord.csv" Header="Matricule" EntityTypeName="User Record" /></Connector>

```

Run the generator to generate the basis of the model in the `Connector.xml` file.

```

./Usercube-Generate-Configuration.exe --connector-description 'Directory Generator.xml' -g Connector.xml --keep-all-columns -c 'Directory'

```

Copy the generated file into `C:/UsercubeTraining/Conf/Directory` and rename it `Directory Connector.xml`.

### Complete the model with associations

The resulting `Directory Connector.xml` file is still incomplete because the CSV files only contained headers. We're going to enhance it manually by writing directly in the xml file.

After you start editing the `Directory Connector.xml` XML file, you can't regenerate the directory connector from the configuration generator anymore. That would overwrite all your changes.

Most of what is missing are associations: the generator could not deduce the links between entities since there was no data *per se*.

Associations can be mono-valued or multi-valued.

* *Mono-valued* associations represent a [1-to-1 or many-to-1](https://en.wikipedia.org/wiki/One-to-one_%28data_model%29) association. They are defined by a property with a target column index between `128` and `138` included, and type `ForeignKey`.
* *Multi-valued* associations represent a [1-to-many or many-to-many](https://en.wikipedia.org/wiki/Many-to-many_%28data_model%29) association. They are defined by a property with no target column, and with type `ForeignKey`.

Relevant properties already exist but we have to make sure the target column index and type are correctly configured and we need to add an Entity Association property to finalize the process.

Two properties cannot have the same target column index. The target column index is the column in the *UR\_Resource* table that will hold the value of the property.

#### Directory\_Department

There is one association property to write in the `Directory_Department` entity type: `ParentDepartment`.

`ParentDepartment` is an association property. It holds the link between a department and its parent department. A department can only have ONE parent, but many children. It is a many-to-one association and therefore should be mono-valued.

* Make sure that for the `ParentDepartment`  property, `TargetColumnIndex=128` and `Type=ForeignKey`.

`<EntityType Identifier="Directory_Department" DisplayName_L1="Directory - Department">`
...
`<Property Identifier="ParentDepartment" DisplayName_L1="ParentDepartment" TargetColumnIndex="128" Type="ForeignKey" />`
...
`</EntityType>`

`Child` is, on the other hand, *multi-valued*.

* Make sure it has no target column index and `Type="ForeignKey"`.

```

<Property Identifier="Child" DisplayName_L1="Child" Type="ForeignKey" />

```

Using the same logic, `Supervisor` should be a mono-valued association and `Records` a multi-valued association.

The result should look like:

```

<EntityType Identifier="Directory_Department" DisplayName_L1="Directory - Department">    <Property Identifier="Code" DisplayName_L1="Code" IsKey="true" TargetColumnIndex="1" Type="String" />    <Property Identifier="Label" DisplayName_L1="Label" TargetColumnIndex="2" Type="String" />    <Property Identifier="Path" DisplayName_L1="Path" DisplayName_L2="Chemin" Type="String" TargetColumnIndex="6" />    <Property Identifier="ParentDepartment" DisplayName_L1="ParentDepartment" TargetColumnIndex="128" Type="ForeignKey" />    <Property Identifier="Child" DisplayName_L1="Child" Type="ForeignKey" />    <Property Identifier="Supervisor" DisplayName_L1="Supervisor" TargetColumnIndex="129" Type="ForeignKey" />    <Property Identifier="Records" DisplayName_L1="Users" Type="ForeignKey" />  </EntityType>

```

#### Directory\_User

* Change the target column index and `ManagedDepartments` to make it mono-valued.
* Add a `Record` property, multi-valued, that will point to records for this user.
* Add a `MainRecord` property, mono-valued, that will point to the main record for this user. It will be defined by the following expression:

```

<EntityPropertyExpression Identifier="Directory_User_MainRecord" Property="MainRecord" EntityType="Directory_User" Priority="-2"
                          Expression="C#:person:
                            if((person.Records == null) || (person.Records.Count == 0))
                            {
                               return default(long?);
                            }

                        if (person.Records.All(r => r.ContractStartDate.HasValue && (r.ContractStartDate > DateTime.UtcNow)))
                        {
                          return person.Records.OrderBy(r => r.ContractStartDate).Select(r => r.Id).FirstOrDefault();
                        }

                        /* at least of record in the past */
                        if (person.Records.All(r => r.ContractEndDate.HasValue && (r.ContractEndDate < DateTime.UtcNow)))
                        {
                          return person.Records.OrderByDescending(r => r.ContractEndDate).Select(r => r.Id).FirstOrDefault();
                        }

                        /* find CurrentRecord */
                        var record = person.Records.Where(r =>
                                ((r.ContractStartDate.HasValue
                                        && (r.ContractStartDate < DateTime.UtcNow))
                                    && ((!r.ContractEndDate.HasValue)
                                        || (r.ContractEndDate.HasValue
                                            &&                                            (r.ContractEndDate > DateTime.UtcNow))))
                                || (((r.StartDate.HasValue
                                            && (r.StartDate < DateTime.UtcNow))
                                        || !r.StartDate.HasValue)
                                    && ((r.EndDate.HasValue
                                            && (r.EndDate > DateTime.UtcNow)))))
                            .OrderBy(r => (r.ContractStartDate,r.StartDate))
                            .Select(r => r.Id).FirstOrDefault();

                        if (record == null)
                        {
                          /* current record not found : take the first */
                          record = person.Records.Select(r => r.Id).FirstOrDefault();
                        }

                        return record;
                        " />

```

The resulting entity type should look like:

```

  <EntityType Identifier="Directory_User" DisplayName_L1="Directory - User">    <Property Identifier="EmployeeId" DisplayName_L1="EmployeeId" IsKey="true" TargetColumnIndex="0" Type="String" />    <Property Identifier="Isdraft" DisplayName_L1="Isdraft" TargetColumnIndex="1" Type="Bool" />    <Property Identifier="Records" DisplayName_L1="Records" DisplayName_L2="Fiches" Type="ForeignKey"/>    <Property Identifier="MainRecord" DisplayName_L1="Main Record" DisplayName_L2="Fiche principale" Type="ForeignKey" TargetColumnIndex="129"/>    <Property Identifier="ManagedDepartments" DisplayName_L1="Managed Departments" DisplayName_L2="D�partements g�r�es" Type="ForeignKey" />    <Property Identifier="ManagedPeople" DisplayName_L1="Managed users" Type="ForeignKey" />  </EntityType>

```

#### Directory\_UserRecord

* `StartDate` and `EndDate` properties should have the `DateTime` type instead of `String`. This helps display them correctly in the UI and allows `C#` expressions based on these properties to use date-specific methods.
* `User`, `Category` and `Supervisor` should be mono-valued association properties.
* Add a `Department` (mono-valued) association property.
* Add a `MainUser` property (also mono-valued).

The resulting entity type should look like:

```

  <EntityType Identifier="Directory_UserRecord" DisplayName_L1="Directory - UserRecord">    <Property Identifier="LastName" DisplayName_L1="LastName" TargetColumnIndex="0" Type="String" />    <Property Identifier="FirstName" DisplayName_L1="FirstName" TargetColumnIndex="1" Type="String" />    <Property Identifier="EmployeeId" DisplayName_L1="EmployeeId" IsKey="true" TargetColumnIndex="2" Type="String" />    <Property Identifier="StartDate" DisplayName_L1="StartDate" TargetColumnIndex="3" Type="DateTime" />    <Property Identifier="EndDate" DisplayName_L1="EndDate" TargetColumnIndex="4" Type="DateTime" />    <Property Identifier="ContractStartDate" DisplayName_L1="ContractStartDate" TargetColumnIndex="5" Type="DateTime" />    <Property Identifier="ContractEndDate" DisplayName_L1="ContractEndDate" TargetColumnIndex="6" Type="DateTime" />    <Property Identifier="Login" DisplayName_L1="Login" TargetColumnIndex="7" Type="String"/>    <Property Identifier="Supervisor" DisplayName_L1="Supervisor" TargetColumnIndex="130" Type="ForeignKey" />    <Property Identifier="Category" DisplayName_L1="Category" TargetColumnIndex="129" Type="ForeignKey" />    <Property Identifier="User" DisplayName_L1="User" TargetColumnIndex="128" Type="ForeignKey" />    <Property Identifier="Department" DisplayName_L1="Department" TargetColumnIndex="132" Type="ForeignKey" />    <Property Identifier="MainUser" DisplayName_L1="User (main)" DisplayName_L2="Collaborateur (principal)" Type="ForeignKey" TargetColumnIndex="131" />    <Property Identifier="Mail" DisplayName_L1="Mail" TargetColumnIndex="10" Type="String" />  </EntityType>

```

### Fix the entity mappings

In the `Directory Connector.xml` file, property mappings were generated for properties that are now associations (with `Type=ForeignKey`). These property mappings should be deleted as they are no longer relevant.

Instead, we are going to write `EntityAssociations` and `EntityAssociationMapping`.

### Write entity associations

We have written properties in the Entity Types that are supposed to represent associations between Entity Types but we haven't actually linked entities together.

This is achieved by writing `EntityAssociations`. They bind together properties from two entity types to materialize the association.

#### Bind a department and its supervisor

```

<EntityAssociation Identifier="Directory_Department_Supervisor" DisplayName_L1="Directory department parent" IsProperty1Collection="1" Property1="Directory_User:ManagedDepartments" Property2="Directory_Department:Supervisor"/>

```

This piece of xml binds `Directory_User` to `Directory_Department`. `Property1` contains a link to a `Directory_Department` and `Property2` contains the backlink to a `Directory_User`.

Following the same logic, we are going to bind the elements mentioned below.

#### Bind a department to its parent department

This is a self-association: it binds two records that have the same entity type. The link still exists between two distinct resources.

```

<EntityAssociation Identifier="Directory_Department_Parent" DisplayName_L1="Directory department parent" IsProperty1Collection="1"  Property1="Directory_Department:Child" Property2="Directory_Department:ParentDepartment"/>

```

#### Bind a department to its members

Members are records.

```

<EntityAssociation Identifier="Directory_Department_Records" DisplayName_L1="Directory department record" IsProperty1Collection="1" Property1="Directory_Department:Records" Property2="Directory_UserRecord:Departments"/>

```

#### Bind a record to its employee category

```

<EntityAssociation Identifier="Directory_Category_Record" DisplayName_L1="Directory Category Records" Property1="Directory_EmployeeCategory:Users" Property2="Directory_UserRecord:Category" IsProperty1Collection="1" />

```

#### Bind a record to its supervisor

```

 <EntityAssociation Identifier="Directory_Record_Supervisor" DisplayName_L1="Directory Record Supervisor" Property1="Directory_User:ManagedPeople" Property2="Directory_UserRecord:Supervisor" IsProperty1Collection="1" />

```

### Write the internal display names

Just as before with the HR entity type, we're going to provide expressions for the internal display names.

Remember to add the `InternalDisplayName` property to the relevant entity type before writing the expression.

The internal display name expression for `Directory_User` is a little tricky:

```

<EntityPropertyExpression Identifier="Directory_User_InternalDisplayName"  EntityType="Directory_User" Property="InternalDisplayName"  Expression="C#:person:
  var ret = "";

  if(person.Matricule != null){
    ret += person.Matricule;
  }

  if(person.Matricule != null && person.Records != null  && person.Records.Count != 0)
  {
    ret += " - ";
  }

  if(person.Records != null && person.Records.Count !=0){
      ret += person.Records[0].LastName + " " + person.Records[0].FirstName;
  }

  return ret;"
 />

```

Others are pretty straightforward:

* Record
* Department
* Category

### Writing the UI and the navigation menu

We are going to add a few configuration files that set up the way a `Directory_User` is displayed in the UI.

* Download and copy the Profile Administrator.xml file in `C:/UsercubeTraining/Conf`.
* Download and copy the Directory Profil Administrator.xml file in `C:/UsercubeTraining/Conf/Directory`.
* Download and copy the Directory UI.xml file in `C:/UsercubeTraining/Conf/Directory`.
* Download and copy the Directory Navigation.xml file in `C:/UsercubeTraining/Conf/Directory`.
* Download and copy the Directory Workflow.xml file in `C:/UsercubeTraining/Conf/Directory`.

### Finalize the model with context, dimensions and record sections

To finalize the model, we are going to define specific key criteria for identities (`Directory_User` resources) which will be useful for writing role assignment rules later.

We'll return to this subject in the
Role Model
section. These criteria are called Dimension.

* Create a `Directory Dimension.xml` file in `C:/UsercubeTraining/Conf/Directory`.
* Add the dimensions into the XML file for this project.

  We choose to use `Department` and `EmployeeCategory` as key criteria which will provide a basis for role assignment rules.

  ```

   <Dimension Identifier="Department0" DisplayName_L1="Department" DisplayName_L2="Departement" EntityType="Directory_Department" ColumnMapping="0" IsHierarchical="true" ParentProperty="ParentDepartment" /> <Dimension Identifier="EmployeeCategory0" DisplayName_L1="Employee Category" DisplayName_L2="Cat�gorie de collaborateur" EntityType="Directory_EmployeeCategory" ColumnMapping="1" />

  ```
* Add the `DisplayEntityType` using our dimensions into the XML file for this project.

  This will allow you to use your dimensions as conditions in your rules.

  ```

    <DisplayEntityType PluralDisplayName_L1="Users" PluralDisplayName_L2="Collaborateurs" Identifier="Directory_User" D0IsActive="true" D1IsActive="true"/>

  ```

  Notice that in `DXIsActive`, `X` is referring to the dimension's `ColumnMapping`.

  We also have to define a `ContextRule`.
* A context rule contains several elements, we'll describe it more thoroughly later.

  For now, you can consider that a context rule identifies two important elements:

  1. Within the `SourceEntityType` parameter, the `Directory_User` entity which represents an identity to which entitlements are going to be assigned by .
  2. Within the `B0` and `B1` parameters, the properties of the `Directory_User` entity type that are used as dimensions for assignment computations. Here, `Directory_UserRecord:Department` is used to find the value for the `Department0` dimension of an identity.

```

<ContextRule
Identifier="ContextRuleUserToRecord"
DisplayName_L1="ContextRuleUserToRecord"
Policy="Default"
ResourcesBinding="Records"
ResourcesStartExpression="C#:person:return person.StartDate.HasValue ? person.StartDate : person.ContractStartDate;"
ResourcesEndExpression="C#:person:return person.EndDate.HasValue ? person.EndDate : person.ContractEndDate;"
B0="Directory_UserRecord:Department"
B1="Directory_UserRecord:Category"
SourceEntityType="Directory_User"
ExcludeExpression="C#:person:return person.Isdraft.GetValueOrDefault();" RiskFactorType="Max" />

```

* Finally, we have to write `RecordSections`.

  `RecordSections` instruct 's engine about the entity types that are modeled with Records (which are identities, nearly 99% of the time).

  Record sections come in pairs: the first record section sets up the immutable part of the record-modeled identities. They have Start and End dates which describe the identity's lifecycle Start and End dates in the organization.

  The second record section is about positions. The Start and End dates indicate the validity period of the positions themselves.

```

  <RecordSection Identifier="Directory_UserRecord_Default" DisplayName_L1="Contract Properties" SourceEntityType="Directory_User" ResourceEntityType="Directory_UserRecord" StartProperty="ContractStartDate" EndProperty="ContractEndDate">  </RecordSection>  <RecordSection Identifier="Directory_UserRecord_Position" DisplayName_L1="Position Properties" SourceEntityType="Directory_User" ResourceEntityType="Directory_UserRecord" StartProperty="StartDate" EndProperty="EndDate">    <Property Property="Department" ExtensionKind="None" />  </RecordSection>

```

Import the configuration to check that the written XML files are valid.

## Conclusion

The model for the reference data is now complete.

Let's see how to actually load the data.