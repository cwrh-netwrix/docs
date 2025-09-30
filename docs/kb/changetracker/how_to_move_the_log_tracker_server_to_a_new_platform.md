---
description: >-
  This article provides a step-by-step guide on how to move your Log Tracker Server installation to a new platform without losing any log or configuration data.
keywords:
  - Log Tracker Server
  - server migration
  - data preservation
sidebar_label: Move Log Tracker Server
tags: []
title: How to Move The Log Tracker Server To A New Platform
knowledge_article_id: kA04u0000000Jc7CAE
products:
  - activity-monitor
---

# How to Move The Log Tracker Server To A New Platform

## Overview

You can move your **Log Tracker Server** installation to a new platform without losing any log data or configuration data. The entire **Log Tracker Server** software is contained in the root Log Tracker folder (by default `C:\Program Files (x86)\NNT Log Tracker Suite`, but it may often be located elsewhere). This makes it easy to copy all files associated with the server to a new location, either a new disk or a completely new computer system.

## Instructions

To relocate the **Log Tracker Server** to a new platform, perform the following steps:

1. Stop the **CorreLog Framework Service** with the Windows Service Manager, and verify with the Task Manager that all **CO** processes are stopped.
2. Copy all the files in the Log Tracker root folder to a new location, such as with a file system share. Note that this can be a large amount of data that may take several minutes or even hours to complete.
3. If the log files and archive files reside in a location different from the default location (as configured on the **Messages > Config > Parms** screen), copy these files to the new platform as well, to a folder that matches the old folder (such as `D:\Logs` and `D:\Archives`). This is only necessary if you have configured a non-default location for these files on the **Messages > Config > Parms** screen.
4. After all files are copied, on the new **Log Tracker Server** platform, run the `C:\Program Files (x86)\NNT Log Tracker Suite\system\CO-install.exe` program as administrator. This reinstalls and configures program services at the new location and restarts the **CorreLog Framework Service**.
5. If the **Apache-TLS** server is installed, also run the `C:\Program Files (x86)\NNT Log Tracker Suite\apache-tls\bin\CO-Secure.exe` program. This step reconfigures the **Apache-TLS** process to use the new location as its document root directory. (This step also creates a new self-signed certificate for the **Apache TLS** server.)
6. Rename or delete the old installation after successfully moving the directory to avoid future confusion.

It is possible (but not likely) that you have some paths in custom alerts, custom actions, or the local Windows agent that need to be adjusted. This is not common but should be mentioned.

> **IMPORTANT:** Be aware that the IP address of the **Log Tracker Server** is configured as the message destination on all your managed network devices. Hence, it may require substantial reconfiguration of your network devices if you want to change the IP address of the **Log Tracker Server**. For best results, assign the old IP address of the **Log Tracker Server** to the new platform and decommission the old platform completely.

## Related Articles

- [How to Backup / Restore / Move your MongoDB Database](#)
- [How to move your Linux Server MongoDB Database to a Windows server?](#)
- [Supporting Documents for Hub Server Problems](#)
- [Rolling-Log Fix: "Hub Offline, connection retries exhausted (The remote server returned an error: (403) Forbidden.)"]( #)
- [Support for TLS 1.2 in the .NET Framework 3.5.1](#)