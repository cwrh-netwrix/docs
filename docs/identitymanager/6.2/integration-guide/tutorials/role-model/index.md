---
title: "Role Model"
description: "Role Model"
sidebar_position: 70
---

# Role Model

This section focuses on the mechanisms provided by  to manage entitlements using roles.

We are going to learn how to:

* Enable  to list all assignments for every identity.
* Enable knowledgeable users to add/remove assignments to/from identities using  (without having to go deep into the technical complexity of, for example, an Active Directory).
* Enable  to automatically react to identity changes and fulfill assignments accordingly.

## The Role Model

The first step into managing entitlements and their assignments is to model the available entitlements from the managed systems. In the previous sections, we only wrote a model of the managed system data but we didn't model entitlements. It means that  is still unable to read or write entitlements.

From 's perspective, an entitlement is a piece of data used by the managed system's security system to authorize an identity to access, read, or write a resource. For example, an Active Directory authorization mechanism is based on users, groups and the [Access Control List](https://en.wikipedia.org/wiki/Access-control_list) paradigm.

This is what we need to model in . To do so,  uses the [Role-Based Access Control](https://en.wikipedia.org/wiki/Role-based_access_control) paradigm. The Active Directory entitlement landscape is modeled by writing a  Role for every AD *group*. This first step already enables:

* Users to manually request entitlement assignments.
* Users to consult a catalog of available entitlements.
* to list every existing entitlement for every single identity based on the synchronized data.

Then, assignment rules are written. These rules link entitlements to identities based on the identity key criteria called *dimensions*.  can now:

* Automatically assign an entitlement to an identity, based on identity properties.
* React to changes in the managed systems by assigning or removing entitlements based on identity property changes.

Resource types mentioned earlier are also a part of the role model. One of their goals is to link an identity to its accounts and hence help listing entitlements for a given identity.

## Manage the Department's SharePoint Websites

Our target organization has organized its SharePoint data into five organizational units (`OU`s), one for each department. In each `OU`, three groups have been added: `Reader`, `Admin` and `Contributor`.

Every member of a department has access to his/her own SharePoint, with access limited to his/her needs (Reader, Admin or Contributor) but cannot go through other departments' SharePoint platforms.

The aim of this group structure is twofold:

* To prevent employees from stumbling upon private information of other employees. For example, R&D members are not supposed to go through the *Accounting* SharePoint and see other people's salaries.
* To avoid data modification by less knowledgeable users. For example, interns would much more likely be member of the `Reader` group that have neither update nor delete privileges.

This structure is materialized in the Active Directory by five organizational units, each one with three groups.

The five OUs are:

* SharePointR&D
* SharePointIT
* SharePointFactory
* SharePointAccounting
* SharePointManagement

The three groups are:

* Reader
* Contributor
* Admin

For example, the SharePointR&D OU's groups are:

* `CN=Reader,OU=SharePointR&D,OU=Applications,DC=acme,DC=internal`
* `CN=Contributor,OU=SharePointR&D,OU=Applications,DC=acme,DC=internal`
* `CN=Admin,OU=SharePointR&D,OU=Applications,DC=acme,DC=internal`

The SharePointAccounting OU's groups are:

* `CN=Reader,OU=SharePointAccounting,OU=Applications,DC=acme,DC=internal`
* `CN=Contributor,OU=SharePointAccounting,OU=Applications,DC=acme,DC=internal`
* `CN=Admin,OU=SharePointAccounting,OU=Applications,DC=acme,DC=internal`

This structure is going to be represented in  after creating a
Single Role
 per AD group.

## The Single Roles

### Create the category

Before creating roles, it is good practice to create categories to organize the roles.

* Go to the homepage.
* Select the **Access Role** button.

This action opens the list of existing roles and resource types for your project. For now, it doesn't contain any roles.

* Click on the **+** button next to **Categories**.

* Create a new category with the identifier set to `SharePoint` and the name set to `SharePoint`. Everything else can be the default values. Confirm the category creation with the **Create** button. This takes you back to the roles list.

### Create the SharePoint R&D admin role

Let's create the first role, mapped to the `CN=Admin,OU=SharePointR&D,OU=Applications,DC=acme,DC=internal` group.

* Click on the **+ New** button in the top right corner.

We are going to create a role of the Single Role type.  handles two role levels: Single Role and Composite Role. We are going to focus on Single Roles for now. Composite Roles are not mandatory.

* Select the **Single Role** radio button.
* Input the identifier `SharePoint R&D Admin`.
* Input the name `SharePoint R&D Admin`.
* Confirm with the **Create** button.

The new role is now displayed in the roles list.

### Map the role to the SharePoint R&D admin group

The link between a Single Role and the matching AD group is materialized by a Navigation Rule.

A navigation rule sets the value of the navigation property on a specific resource, if a given condition is met. It is linked to a parent resource type that sets the target entity type.

To link our `SharePointR&D` role to the `SharePointR&D` group, we are going to create a Navigation Rule linked to the `AD account (nominative)` resource type. If you recall, the resource type links a `Directory_User` resource to an `AD_Entry` resource.

The navigation rule should state that the target Active Directory account's `memberOf` property contains a reference to the `SharePointR&D` group (which is an AD resource), if and only if the source `Directory_User` resource has been assigned the `SharePointR&D` role.

Let's create the navigation rule:

* Go to the homepage.
* Click on the **Access Rules** button, under the **Configuration** section.
* Select the `Directory_User` entity type from the dropdown menu. This entity type sets the source resource to which the future Navigation Rule will be applied.
* Switch to the **Navigation** tab.
* Click **+ New Navigation Rule**.

Input the following values:

* Resource Type: `AD User (nominative)`

  This is the rule's parent resource type.
* Join: `memberOf`

  This is the target property whose value is impacted by the rule.
* Resource: `CN=Admin,OU=SharePointR&D,OU=Applications,DC=acme,DC=internal`

  This is the value to be set on the `memberOf` property of the target resource.
* Criteria > SingleRole: `SharePointR&D`

  This is the condition which, if met, triggers the rule application.

Once this rule is created,  users can obtain the`SharePointR&D` membership by requesting a `SharePointR&D` role assignment from the UI. We'll discuss later how to manually request role assignments from the UI.

We are now going to see how we can automate the assignment process.

First, let's complete the Role Model.

Following the same steps, you should be able to create the following Single Roles and their matching navigation rule:

* SharePoint R&D Reader
* SharePoint R&D Contributor
* SharePoint Accounting Admin
* SharePoint Accounting Reader
* SharePoint Accounting Contributor

We now have a catalog of the available entitlements that can be requested through  for the Active Directory, in the roles list.

Writing these six roles might appear a slightly tedious and repetitive exercise. There are some techniques to do all this more quickly when dealing with larger amounts of data but they are outside of the scope of this tutorial.

### Assignment rules

By automating the role assignments, lots of time and effort is saved. After all, it seems obvious that every employee or contractor in a specific department should be assigned the matching SharePoint Reader role automatically. Admin and contributor roles might be a little more sensitive though, so we won't design any automatic rules for them yet. They will have to be assigned manually.

These rules can be materialized by writing Single Role Rule. They assign a role to an identity based on the identity's dimension values.

Let's write the rule that assigns a SharePoint R&D Reader role (and subsequently the `CN=Reader,OU=SharePointR&D,OU=Applications,DC=acme,DC=internal` group membership) to users who are members of the R&D department.

* Go to the homepage.
* Click on the **Access Rules** button, under the **Configuration** section.
* Select the `Directory_User` entity type.
* Switch to the **Single Role** tab.
* Click on **+ New**.
* Input the following values:

  + Single Role: `SharePoint R&D Reader`
  + Department: `005 - R&D`

  This sets a rule that assigns the SharePoint R&D Reader single role to any user belonging to the R&D department.

Do the same for Accounting.

These rules are going to be applied whenever a change is detected by : a new employee, the departure of a colleague, or any change in any identity throughout their lifecycle in the organization.

Let's simulate the onboarding of a new employee, and see the application of the single role rules to their assigned roles.

* Using the onboarding workflow, add a new employee, *Anne Smith*, member of the `R&D` department. See the AD Provisioning topic for additional information.
* On the second screen, you should see that the `SharePointR&D` role has been automatically assigned. The rule has been applied to the identity that is being created.
* Go through the whole approval process, following the steps from the previous provisioning section. See the AD Provisioning topic for additional information.
* Execute the `AD_Synchronization_Complete` job that contains both the synchronization and provisioning tasks.

  The group membership has been provisioned.

  You can see that in the AD LDS and in , by going to **Users > *Anne Smith* > View Permissions** and clicking on the AD account resource.

When synchronizing the Active Directory data, the same assignment rules are applied "in reverse" to the retrieved AD accounts and groups. AD accounts are correlated with `Directory_User` resources, and group memberships are translated into roles. That's how  lists, for every identity, all the entitlement assignments.

## Manually Request an Assignment

One entitlement in the Active Directory is particularly sensitive: the *Domain Administrator* group.

This entitlement is too sensitive to be assigned automatically. Security officers will certainly want to keep an eye on the accounts that are members of this group.

Let's make sure that the target organization's security officers will be able to assign the role manually by:

* Creating the Single Role for the `AD - administrator` group.
* Creating the matching Navigation Rule.

There is no Single Role Rule here, because there is no automated assignment. We have only indicated that anyone who has the role `AD - administrator`, will be placed in the administrator group. We haven't indicated who should receive this role automatically.

Let's manually assign this role to *Jerome Barbier*:

* Go to the **Users** list.
* Select *Jerome Barbier*.
* In the top panel, click on **Modify Permissions**.
* Click **Next** to get to the second screen.
* Click on the **Add Permissions** button.
* **Select Permissions**.
* Find the `AD - administrator` single role.
* Click on **Select**.
* Click on **Add**.
* Execute the workflow until you reach the end of the process.

The role assignment process is not yet fully completed: it still needs to be approved by an authorized  user. By default, Single Roles have a two-step approval.

Being an administrator of , you can perform the second step:

* Go the homepage.
* Click on **Role Review**.

This screen lists the role assignments waiting to be approved. You should be able to find the `AD - Administrator` for *Jerome Barbier*.

* Click on the green **Check** icon and on the **Approve** button to approve the role.

The role is now ready to be provisioned. Its provisioning state has been set to `Pending`. You can see that in the **View Permissions** screen for *Jerome Barbier*.

* To finalize the process, execute the `AD_Synchronization_Complete` job. If you recall, this job contains tasks that perform both the synchronization and the provisioning of AD resources.

You can now see the updated group membership for *Jerome Barbier*.

* Execute the `AD_Synchronization_Complete` job one more time to re-synchronize the Active Directory data.

The new group membership for *Jerome Barbier*'s Active Directory account has been synchronized. It is now visible in *Jerome Barbier*'s account display.

* From the homepage, on the left navigation menu, go to **Connectors > AD > *Jerome Barbier***.

The role's provisioning state has also been set to `Verified`.

* From the homepage, go to **Users > *Jerome Barbier* > See Permissions**.

This last step completes 's feedback loop which guarantees that provisioning orders have been correctly executed and that all subsequent  computation is based upon the real state of the managed system and not on a theoretical one.

was able to check that the AD - Administrator role was actually provisioned to the Active Directory account for *Jerome Barbier* because it detected the AD - Administrator group membership for this account and applied the navigation rule "in reverse".

## React to Change

The good news is that now that all of this is wired together,  can detect and react to any change that occurs in a managed system.

Let's simulate a change in the managed system:

* Open the `ADSI Edit` application to explore the `AD LDS`.
* Find *Frank Smith*'s account.
* Modify the given name to "*FrankSmithModified*".
* Launch the `AD_Synchronization_Complete` job from .
* Go to **Users > *Frank Smith* > View Permissions**.
* Click on the AD account resource.
* The given name property `workflowState` is non-conforming.

It means that  has found a new value for this property. It is said to be non-conforming because, according to the scalar rule that was written to provision the AD account from `Directory_User`, it should read `FrankSmith` and not `FrankSmithModified`.

This difference can be either fixed or kept as-is. The decision is made by a knowledgeable user in the **Resource Reconciliation** screen.

This is another side-effect of the feedback loop. The value that was originally provisioned is `Frank Smith`, but the actual value is now `FrankSmithModified`.

We could foresee the same type of change happening on the AD account group membership. This would have an effect on Frank Smith's assignments and would, with the same mechanisms, be detected by .

## Conclusion

The role model now enables non-technical users to requests roles. It also automates a lot of assignments and makes the onboarding/offboarding process much easier.

We can now go further and add more connectors to additional managed systems in order to really leverage . For any given managed system connected to , every entitlement is going to be a role in . It means that non-technical users only have to learn one thing: how to assign roles. Everything else is handled by 's provisioning and synchronizing mechanisms.