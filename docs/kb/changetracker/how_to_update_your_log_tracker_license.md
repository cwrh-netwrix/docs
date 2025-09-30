---
description: >-
  This article provides step-by-step instructions on how to update your Log Tracker license using the Auth.txt file received via email.
keywords:
  - Log Tracker
  - license update
  - Auth.txt
sidebar_label: Update Log Tracker License
tags: []
title: How to Update Your Log Tracker License
knowledge_article_id: kA04u0000000JVkCAM
products:
  - change-tracker
---

# How to Update Your Log Tracker License

## Overview

You will receive your Log Tracker license via an attachment named `Auth.txt` in an email. Below are the steps to implement this license into Log Tracker.

## Instructions

To update your license:

1. Stop your **Correlog Framework Service** on the server.
2. Navigate to `C:\Program Files (x86)\NNT Log Tracker Suite\config` (Note: this may differ on your system if it is installed in a different location).
3. Copy and paste the `Auth.txt` file in this directory.
4. Start your **Correlog Framework Service** on the server.

Once the `Auth.txt` file is in place and the **Correlog Framework Service** has been restarted on the server, access to the application should be restored with your new license key in effect.

## Related Articles

- [How to move your Linux Server MongoDB Database to a Windows server?](https://kb.netwrix.com/8283)
- [Supporting Documents for Hub Server Problems](https://kb.netwrix.com/8273)
- [How to fix the "Check Log for Details" message in the event details](https://kb.netwrix.com/8133)
- [Change Tracker Gen 7 Change Log / Update Log / ReadMe.txt Documents for Agent/Hub](https://kb.netwrix.com/8368)