---
description: >-
  This article provides guidance on user administration settings in the Gen 7 Settings Page, including user roles, access restrictions, and password management.
keywords:
  - user administration
  - user roles
  - access control
sidebar_label: User Administration Settings
tags: []
title: Gen 7 Settings Page - User Administration
knowledge_article_id: kA04u0000000JSlCAM
products:
  - general
---

# Gen 7 Settings Page - User Administration

## Users: User Administration

Edit user attributes such as username, assigned system privileges, email address, and password.

Adding a new user requires a Time Zone to be selected so that the Dashboard screen correctly shows the relevant time periods for the user.

User roles that are pre-defined include:
- **Analyst/User**: Essentially Read Only access
- **User Administrator**: Read Only access plus basic Admin rights
- **Agent**: Agent Only access – Agent registration and polling access only
- **Administrator**: Full Admin rights

Other roles can be created; please contact Netwrix for more information.

By checking the **AD Login** box for any user, the user login authentication for CT will be provided by the network's AD or LDAP server – this will need to be defined separately under **Settings** → **System Settings**.

You can restrict a user's access to Device Groups by editing the **Restricted to Groups** field – by default, this is blank and provides the user with full visibility of all Groups.

The password is set/changed by clicking the **chain icon**.

![User Administration Settings](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJyI&d=%2Fa%2F4u000000Lzca%2FDHqKGIVXgtOX7ZaDcE.8W52D9OlbvMxMMh.B1adb1bM&asPdf=false)