---
title: "Create an AD Contact"
description: "Create an AD Contact"
sidebar_position: 20
---

# Create an AD Contact

The GroupID portal enables you to create the 'contact' object in the directory.

:::note
The contact object type is not supported in a Microsoft Entra ID based identity store.
:::


:::note
Pages and fields on the Create Contact wizard may vary from those discussed here, since the
administrator can customize the wizard by adding or removing pages and fields.
:::


**What do you want to do?**

- [Create a contact](#create-a-contact)

## Create a contact

1. In the GroupID portal, click the **Create New** button in the left pane and select **Contact**.

    The **Create Contact** wizard opens to the Account page.

2. On the **Account** page:

    1. Click **Browse** next to **Container** to select a container to create the contact in.

        This field would be read-only if the administrator has pre-defined a container for creating
        new contacts.

    2. Enter the contact's **First Name**, **Initials**, and **Last Name** in the respective boxes.

        The wizard uses this information to populate the **Full Name** and **Display Name** boxes.

    3. Click **Next**.

3. Use the **Exchange** page to mail-enable the contact.
4. On the **Summary** page, review the settings and then click Finish to complete the wizard.

:::note
If the GroupID administrator has specified the contact creation action for review, your
changes will not take effect until verified by an approver. See the
[Requests](/docs/directorymanager/11.0/portal/request/overview.md) topic.
:::
