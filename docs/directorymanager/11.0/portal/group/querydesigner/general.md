---
title: "General tab"
description: "Query Designer - General tab"
sidebar_position: 30
---

# Query Designer - General tab

Use this tab to specify the type of objects to include in your search. Options vary according to the
object type selected in the **Find** list.

Select the sub-types of the selected object type to include in your search.

The following table lists the options available on the **General** tab for each object type in the
**Find** list.

| Find list option            | Objects available for selection                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Messaging System Recipients | <ul><li>**Users with mailboxes**</li><li>Includes users with messaging system mailboxes</li><li>**Users with External Email Address**</li><li>Includes users with email addresses that are external to your organization</li><li>**Contacts with External Email Address**</li><li>Includes contacts with email addresses that are external to your organization</li><li>**Mail-Enabled Groups**</li><li>Includes mail-enabled groups</li><li>**Mail-Enabled Folders**</li><li>Includes mail-enabled folders</li></ul> |
| Computers                   | <ul><li>**Workstations and Servers**</li><li>Includes workstations and servers</li><li>**Domain Controllers**</li><li>Includes domain controllers</li></ul>                                                                                                                                                                                                                                                                                                                                                           |
| Custom                      | By default, it includes all object options for Messaging System Recipients, Computers, and Users, Contact, and Groups. For this reason, the General tab does not display any option for this object type.                                                                                                                                                                                                                                                                                                             |
| Users, Contacts and Groups  | <ul><li>**Users**</li><li>Includes users</li><li>**Contacts**</li><li>Includes contacts</li><li>**Groups**</li><li>Includes groups</li></ul>                                                                                                                                                                                                                                                                                                                                                                          |


:::note
The Computer and Contact object types are not supported in a Microsoft Entra ID identity
store.
:::


**Preview**

Enables you to preview the results returned with the criteria specified on all tabs of the Query
Designer dialog box. This is a check to ensure the accuracy of data before changes are committed to
the directory.

**OK**

Saves settings and closes the dialog box.

**Cancel**

Discards settings and closes the dialog box.

**LDAP Query**

View the provider query in the LDAP Query box.
