---
description: >-
  This article provides step-by-step instructions for upgrading the Change Tracker hub from version 7.5.x.x to 7.6, including necessary prerequisites and actions to take.
keywords:
  - Change Tracker
  - upgrade
  - .Net Core
sidebar_label: Upgrade Change Tracker Hub
tags: []
title: How to Upgrade the Change Tracker Hub from v7.5.x.x to v7.6
knowledge_article_id: kA04u000000wnp4CAA
products:
  - change-tracker
---

# How to Upgrade the Change Tracker Hub from v7.5.x.x to v7.6

## Overview

If you want to upgrade the Change Tracker hub from v7.5.x.x to v7.6, you need **.Net Core 6 Hosting** to be installed and perform several upgrade steps described below.

## Instructions

To upgrade the Change Tracker hub from v7.5.x.x to v7.6, do the following:

> **IMPORTANT:** Please be sure to take a backup of the Change Tracker server/Mongo Database prior to performing these steps in case there are any issues.

1. Connect to your Change Tracker Server using RDP.
2. Run the v7.6.1 Change Tracker Hub Installer from the Netwrix Customer Portal.
3. Once the upgrade has completed, uninstall all .NET Core v3 from the Change Tracker Hub Server.
4. Download and install [dotnet-hosting-6.0.23-win ⸱ Microsoft 🡥](https://download.visualstudio.microsoft.com/download/pr/34343c71-eb52-4537-b2b9-f25bc8b6c894/c6a39b3b387ad3f9662cd77c220902f5/dotnet-hosting-6.0.23-win.exe).
5. Once the hosting bundle installation has completed, open Command Prompt as Administrator and run the following commands:

   ```plaintext
   iisreset /stop
   ```

   ```plaintext
   iisreset /start
   ```

The Change Tracker hub has been upgraded successfully.