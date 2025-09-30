---
description: >-
  This article provides guidance on the special characters that can be used in a Change Tracker user or agent password to ensure secure password creation.
keywords:
  - Change Tracker
  - password security
  - special characters
sidebar_label: Special Characters in Change Tracker Passwords
tags: []
title: What Special Characters Can Be Used in a Change Tracker User or Agent Password?
knowledge_article_id: kA04u0000000JZNCA2
products:
  - change-tracker
---

# What Special Characters Can Be Used in a Change Tracker User or Agent Password?

## Overview

Administrators responsible for Change Tracker and its user accounts should change the default passwords to secure and strong passwords immediately. This is an area that may be overlooked by IT staff, but weak and/or default credentials could be exploited by attackers to propagate an attack if a system is compromised.

The PCI-DSS specifically states in requirement 2 that an organization cannot use vendor-supplied defaults for system passwords and other security parameters.

With that being the case, an organization may choose to include mixed case, numbers, and even special characters when creating unique and secure passwords. When it comes to using special characters and ensuring that remote agents and users will still be able to connect and log in successfully, please ensure that you use characters from the list below:

**Allowed Special Characters:**

- `!`
- `?`
- `.`
- `,`
- `£`
- `$`
- `#`
- `*`
- `'`
- `;`
- `/`
- `:`
- `@`
- `~`
- `(`
- `)`
- `_`
- `+`

If you are unable to integrate Change Tracker with your Active Directory server, you can set your local user password requirements through the **Settings** > **System Settings** page, under the **User Password Settings** heading:

![User Password Settings](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKSA&d=%2Fa%2F4u000000LzpD%2FruHjxAtZwJhedHBjQh9ZkjPyZzFzwMxv3w8e3GQEn8E&asPdf=false)