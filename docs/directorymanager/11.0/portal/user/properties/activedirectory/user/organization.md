---
title: "Organization tab"
description: "Object properties - Organization tab"
sidebar_position: 70
---

# Object properties - Organization tab

Use this tab to add or change the primary manager for this user or contact. You can also remove the
manager.

You can also specify additional manager(s) for the user or contact. Additional managers have the
same privileges as the primary manager.

Furthermore, this tab shows the direct reports of this user or contact. Direct reports are groups,
users or contacts that report directly to the user or contact. You can add direct reports as well as
transfer or terminate a direct report.

:::note
A user can also manage his/her direct reports and change his/her primary manager while
validating his/her profile in the portal. See the
[Validate your profile](/docs/directorymanager/11.0/portal/user/manage/validateprofile.md)
topic.
:::


## Dotted line management

Each user can be assigned one primary manager and one or more dotted-line managers (also called
additional managers). However, users can add, change, or remove their primary and dotted-line
managers.

When a user changes his or her primary or additional manager, the primary manager is notified
through email to accept or reject the request. If the primary manager accepts, the user’s manager is
changed. If the primary manager rejects the request, the user remains with the manager.

:::note
This is the default flow for the ‘Workflow to Change Manager’ workflow, with the primary
manager set as the approver. If the administrator disables the workflow or changes the workflow
approver, the flow changes accordingly. See the
[Requests](/docs/directorymanager/11.0/portal/request/overview.md) topic.
:::


**Manager**

Displays the contact/user's primary manager, if specified. The user/contact can change his or her
primary manager.

Click the ellipsis button to launch the
[Find Dialog Box](/docs/directorymanager/11.0/portal/generalfeatures/find.md), where you can search
and select a user to set as the manager.

**Reports**

Displays a list of objects that report directly to this user or contact. These may include users,
groups and contacts.

- To add a direct report, click **Add**. Enter a search string to locate the object to add as a
  direct report, or click **Advance** to use the
  [Find Dialog Box](/docs/directorymanager/11.0/portal/generalfeatures/find.md) for performing a
  search.
- To transfer a direct report, select it and click **Transfer**.

    When you transfer a direct report, the direct report is notified through email to accept or
    reject the transfer. If the direct report accepts the transfer, he or she must select another
    primary manager and validate his or her profile. If the direct report rejects the transfer, he
    or she is transferred back to the old manager, i.e., you.

    :::note
    This is the default flow for the ‘Workflow to Transfer a User’ workflow, with the direct
    report set as the approver. If the administrator disables the workflow or changes the approver,
    the flow changes accordingly. See the
    [Requests](/docs/directorymanager/11.0/portal/request/overview.md) topic.
    :::


- To terminate a direct report, select it and click **Terminate**.

    When you terminate a direct report, it takes effect immediately if the ‘Workflow to Terminate a
    User’ workflow is disabled. If enabled, a request is sent to an approver. If the approver
    approves it, the direct report is terminated and if the approver denies it, the direct report
    remains with the manager, i.e., you.

**Additional Manager**

To add a manager, click **Add**. Enter a search string to locate the object to add as an additional
manager, or click **Advance** to use the
[Find Dialog Box](/docs/directorymanager/11.0/portal/generalfeatures/find.md) for performing a
search.

To remove an additional manager, select it and click **Remove**.

This section displays a list of the additional managers of the user or contact.

| Column Name  | Description |
| --- | --- |
| Type         | The object type of the addition manager, such as user or group. |
| Name         | The name of the additional manager. |
| Manager Type | Indicates whether the object is a temporary or permanent additional manager of this user/contact. The available manager types are: <ul><li>**Perpetual** - To make the object a permanent additional manager of the user/contact.</li><li>**Temporary Manager** - To make the object a temporary additional manager of the user/contact for the period you specify in the **Beginning** and **Ending** boxes. At the end of the period, the object is removed as manager.</li><li>**Addition Pending** - Indicates that the object will be a temporary additional manager of the user/contact for a period in the future. Use the **Beginning** and **Ending** boxes to set a period. Before the beginning date, the object’s manager type is displayed as ‘Addition Pending’. On the beginning date, the manager type changes to ‘Temporary Owner’. <br />Here is an example: <br />You add Smith as a temporary additional manager of User A on May 15, 2019 for future dates, May 20-30, 2019. Smith will be listed with User A’s additional managers with ‘Addition Pending’ as its manager type from May 15 to 19, 2019. <br />On May 20, Smith will become a temporary additional manager of User A and its manager type will change to ‘Temporary Manager’ from May 20 to 30, 2019. <br />After May 30, Smith will be removed as User A’s additional manager.</li><li>**Removal Pending** - Indicates that the object will be temporarily removed as an additional manager of the user/contact for a period in the future. Use the **Beginning** and **Ending** boxes to set a period. Before the beginning date, the object’s manager type is displayed as ‘Removal Pending’. On the beginning date, the manager type will change to ‘Temporary Removed’. <br />Here is an example: <br />You remove Smith as an additional manager of User A on May 15, 2019 for future dates, May 20-30, 2019. Smith will be displayed as User A’s additional manager with ‘Removal Pending’ as manager type from May 15 to 19, 2019. <br />On May 20, Smith’s manager type in GroupID will change to ‘Temporary Removed’; lasting till May 30, 2019. After May 30, Smith will be added back as a permanent additional manager of User A.</li><li>**Temporary Removed** - Indicates that the object is temporarily removed as the user/contact’s additional manager for the period specified in the **Beginning** and **Ending** boxes. At the end of the period, the object is added back as a permanent additional manager of the user/contact.</li></ul> When the object is a perpetual additional manager, the **Manager Type** column is blank. Click anywhere in the row to make it editable for changing the manager type of the additional manager. NOTE: You cannot change the manager type when the additional manager is a group. |
| Beginning    | Shows the beginning date of the temporary addition or removal. |
| Ending       | Shows the ending date of the temporary addition or removal. |

:::note
For each column, a filter is also available that lets you filter records based on a criterion.
For example; to show objects whose display names start with D, type D in the box under the **Name**
header and press Enter.
:::

The Managed By Life Cycle job updates the temporary managers of users/contacts by adding and
removing temporary additional managers on the specified dates.

Consider a scenario where the Managed By Life Cycle job is scheduled to run once a week, say
Mondays. If an object is to be added as a user’s temporary additional manager for three days -
Wednesday till Friday, it will not be added. This happens because the Managed By Life Cycle job did
not run on the particular days for temporary manager update.
