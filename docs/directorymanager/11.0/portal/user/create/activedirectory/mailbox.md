---
title: "Create an AD Mailbox"
description: "Create an AD Mailbox"
sidebar_position: 30
---

# Create an AD Mailbox

You can create a mailbox using GroupID portal when a messaging provider has been configured for the
identity store.

A mailbox is a user with a mailbox, such as an Exchange mailbox.

NOTE: Pages and fields on the Create Mailbox wizard may vary from those discussed here, since the
administrator can customize the wizard by adding or removing pages and fields.

What do you want to do?

- [Create a mailbox in Active Directory](#create-a-mailbox-in-active-directory)

## Create a mailbox in Active Directory

1. In the GroupID portal, click the Create New button in the left pane and select **Mailbox**.

    The **Create Mailbox** wizard opens to the Account page.

2. On the
   [Account page](/docs/directorymanager/11.0/portal/user/create/activedirectory/account.md),
   specify basic account info, such as the object's first name, last name, login ID and the UPN
   suffix.
3. On the
   [Password page](/docs/directorymanager/11.0/portal/user/create/activedirectory/password.md),
   provide a password for the mailbox account and set other password-specific options.
4. On the
   [Exchange page](/docs/directorymanager/11.0/portal/user/create/activedirectory/exchange.md),
   set the alias and Office 365 subscriptions.
5. On the
   [Summary Page](/docs/directorymanager/11.0/portal/user/create/activedirectory/summary.md),
   review the settings and then click Finish to complete the wizard.

NOTE: If the GroupID administrator has specified the mailbox creation action for review, your
changes will not take effect until verified by an approver. See the
[Requests](/docs/directorymanager/11.0/portal/request/overview.md) topic.

**See Also**

- [Directory Search](/docs/directorymanager/11.0/portal/generalfeatures/search.md)
- [User Properties](/docs/directorymanager/11.0/portal/user/properties/overview.md)
