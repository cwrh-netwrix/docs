---
description: >-
  This article provides instructions on how to send emails to multiple users using the Log Tracker's SENDMAIL.bat and SENDGROUP.bat files.
keywords:
  - Log Tracker
  - SENDMAIL.bat
  - SENDGROUP.bat
sidebar_label: Send Emails to Multiple Users
tags: []
title: How to Send E-Mails to Multiple Users on Log Tracker
knowledge_article_id: kA04u0000000JcWCAU
products:
  - change-tracker
---

# How to Send E-Mails to Multiple Users on Log Tracker

## Overview

The **SENDMAIL.bat** ticket action (added via the **Tickets > Actions** screen) accepts only one argument, which is the email address to send data to. You cannot send email to multiple users with this batch file. You cannot add multiple users as arguments.

However, to send email to multiple users, there are two simple techniques you can use:

## Instructions

1. If you want to send email to a few arbitrary users, you can add the **SENDMAIL.bat** file as another ticket action, and just have both of these executed when a ticket is opened. For example, see the screenshot below:

   **Screenshot**

   ![Screenshot of ticket actions](Screenshot1.PNG)

2. If you want to send email to a group of users, it may be simpler to just create another ticket action, called **SENDGROUP.bat**, and have this call the **SENDMAIL.bat** for each user in the group.

   The actual **SENDGROUP.bat** file is simple and consists of something like this:

   ```plaintext
   REM: Send email to each user below using SENDMAIL.bat:
   CALL SENDMAIL.bat user1@mydom.com
   CALL SENDMAIL.bat user2@mydom.com
   CALL SENDMAIL.bat user3@mydom.com
   ```

   File: [SENDGROUP_A_bat.txt](SENDGROUP_A_bat.txt)

## Related Articles

- [How to delete a device in Log Tracker](https://example.com)
- [How To Turn Off Bulk Email Notifications (Force Change Tracker to send one email for each change instead of compiling into one email with multiple changes)](https://example.com)
- [Log Tracker - Types of Authentication](https://example.com)
- [Log Tracker Tags Facility](https://example.com)
- [How to use CloseTicket.exe to Immediately Close Log Tracker Tickets](https://example.com)

**Attachments:**
- [SENDGROUP_A_bat.txt](SENDGROUP_A_bat.txt)
- [Screenshot1.PNG](Screenshot1.PNG)