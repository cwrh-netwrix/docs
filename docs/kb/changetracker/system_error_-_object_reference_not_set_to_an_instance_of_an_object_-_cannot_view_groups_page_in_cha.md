---
description: >-
  This article addresses the "Object Reference not set to an instance of an object" error encountered when accessing the Groups page in Change Tracker, providing steps to resolve the issue.
keywords:
  - Change Tracker
  - Object Reference Error
  - User Rights
sidebar_label: Cannot View Groups Page
tags: []
title: System Error - Object Reference not set to an instance of an object - Cannot View Groups Page in Change Tracker
knowledge_article_id: kA04u0000000JbxCAE
products:
  - activity-monitor
---

# System Error - Object Reference not set to an instance of an object - Cannot View Groups Page in Change Tracker

## Overview

Change Tracker allows you to log in; however, when navigating to **Settings** > **Groups**, you may encounter the following error:

![Error Screenshot](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKLC&d=%2Fa%2F4u000000M01B%2F_IBaVW8AqfXtfkvFVaKIgOdsNa_7tzhQdssxsmOQMCY&asPdf=false)

This error occurs due to your account not having the correct user rights to view the Groups page. We have resolved this in previous scenarios by following these steps:

## Instructions

1. Log out of the Change Tracker user account that you are currently logged in as.
2. Log in as the default **admin** account in Change Tracker.
3. Navigate to the **Groups** tab in the **Settings** tile.
4. Do you see the groups? You should be able to. This means that the account you previously logged in as did not have the user rights to view the device groups.
5. Go to **Settings** > **Users**.
6. Do you have Active Directory integration enabled? If so, does your AD integration require you to supply the FQDN in order to log in? Example below:

   ![AD Integration Example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJtL&d=%2Fa%2F4u000000M01G%2FhdgOqITXJucv3pYYWgcKhFOU5Trti_DjuAErbu_lKuA&asPdf=false)

7. If the above is true, please view the username in **Settings** > **Users** of Change Tracker. This needs to be the same as the exact username you provide during login. The below in **RED** is INCORRECT, and in **GREEN** is CORRECT.

   ![Username Example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKVT&d=%2Fa%2F4u000000Lzts%2Fa2.nvIASWH9TZIv9PHpYU0PT1vwHYoMRBvrfjHhUT5Y&asPdf=false)

## Related Articles

- [How to move your Linux Server MongoDB Database to a Windows server?](https://kb.netwrix.com/8283)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://kb.netwrix.com/8164)
- [How to Change the Admin Password of your Mongo Database](https://kb.netwrix.com/8310)
- [Supporting Documents for Hub Server Problems](https://kb.netwrix.com/8273)

## Attachments

- [USERNAME_2.JPG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKIJ&d=%2Fa%2F4u000000Lzvx%2FizTBklcIBnZE9Zfks4jIHPbbUTipY9YKM_8hYY1BTFM&asPdf=false)
- [username_1.JPG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKVY&d=%2Fa%2F4u000000LzZO%2F6pGAj6Ihy9XWqrqONwM7P5qrj8_K6pKLATPKWYIL60U&asPdf=false)
- [image2018-6-21_17-29-28.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKMN&d=%2Fa%2F4u000000Lzhv%2FeOU57UTSDap3ttONMMl.mE7YjCdYZ44OzbJFAt9Fq.k&asPdf=false)