---
description: >-
  This article provides step-by-step instructions for manually activating debugging logs on Windows for the Endpoint Protector Client.
keywords:
  - debugging logs
  - Endpoint Protector
  - Windows
sidebar_label: Activate Debugging Logs
tags: []
title: "How to Manually Activate Debugging Logs on Windows"
knowledge_article_id: kA0Qk0000002B7PKAU
products:
  - endpoint-protector
---

# How to Manually Activate Debugging Logs on Windows

## Overview

If you are experiencing issues with the **Endpoint Protector Client** and cannot use the [UI Debug option](/docs/endpointprotector/5.9.4.2/admin/devicecontrol/globalsettings) or the SupportTool, you can manually activate debugging logs on Windows. Follow the instructions below to enable logging for troubleshooting purposes.

## Instructions

1. Open the **Command Prompt** as an administrator.
2. Navigate to the root of your **C:** drive.
3. Create the following log files in the root of the **C:** drive:
   - `eppclient.log`
   - `eppsslsplit.log`
4. Restart the Endpoint Protector process as an admin using **Services.msc**.
5. After completing these steps, reproduce the issue while debugging logs are active. Log information will be captured in the created files.
6. Share the log files with Netwrix Technical Support for further investigation.