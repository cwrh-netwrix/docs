---
description: >-
  This article provides step-by-step instructions on how to stop Change Tracker from blocking an IP address after multiple failed login attempts.
keywords:
  - Change Tracker
  - IP address blocking
  - login attempts
sidebar_label: Stop Change Tracker from Blocking IP Address
tags: []
title: How to Stop Change Tracker from Blocking IP Address
knowledge_article_id: kA04u0000000JYKCA2
products:
  - change-tracker
---

# How to Stop Change Tracker from Blocking IP Address

## Overview

This problem occurs when a user fails a login three times or more from a remote device. Change Tracker will block the IP address of that device for some time.

## Resolution

This problem can be resolved, and it can be modified to instead lock out the account that the user is trying to log into after three unsuccessful logon attempts.

## Step-by-Step Instructions

1. Open **Command Prompt** (Admin Privileges).
2. Type `iisreset /stop` (This will stop IIS). Do not close Command Prompt; please minimize it for now.
3. Open **Notepad** (Admin Privileges).
4. Click **File** > **Open** > Navigate to **C:\inetpub\wwwroot\Change Tracker Generation 7 Hub**.
5. Select **"appSettings.config"** and press the **Open** button.
6. Upon opening the file, you should see something similar to below:

   ```
   [Configuration Content]
   ```

7. In the configuration, notice the **"Value"**. This value is responsible for the behavior of failed authentications. Below are the explanations of what changing this value will result in:
   - `false` = This will block the IP after three failed attempts for an unspecified amount of time (This is the default setting).
   - `true` = This will lock the account out for 10 minutes after three failed attempts.

8. Replace `value="false"` with `value="true"` if you prefer that Change Tracker lock the account out for 10 minutes after three failed attempts rather than blocking the IP address.
9. Once done, click on **File** > **Save** and close out the document. Re-open to make sure the settings are retained.
10. Back to the Command Prompt, type `iisreset /start` (This will start IIS).

That's it! Your Change Tracker server should no longer be blocking IP addresses.