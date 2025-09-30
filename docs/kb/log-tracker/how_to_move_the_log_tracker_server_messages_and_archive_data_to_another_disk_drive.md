---
description: >-
  This article provides a step-by-step guide on how to move the Log Tracker Server messages and archive data to another disk drive to increase log space.
keywords:
  - Log Tracker Server
  - archive data
  - message log data
sidebar_label: Move Log Tracker Data
tags: []
title: How to Move The Log Tracker Server Messages and Archive Data to Another Disk Drive
knowledge_article_id: kA04u0000000JcqCAE
products:
  - log-tracker
---

# How to Move The Log Tracker Server Messages and Archive Data to Another Disk Drive

## Overview

The Log Tracker Server allows you to change the location where the system stores message log data and archives. This may be necessary to increase the amount of log space available for the system. The location where Log Tracker saves its log and archive data is set on the **Messages > Config > Parms** screen.

For best results, you should use a relatively high-speed drive that is physically connected to the computer. Best results typically occur by using a reasonably good IDE drive. A network mapped drive should not be used.

## Instructions

To relocate the Messages and Archive data to another location or another disk, run the following procedure:

1. Create a new location for your log data and archive data. Just copy the `C:\Program Files (x86)\NNT Log Tracker Suite\logs` and `C:\Program Files (x86)\NNT Log Tracker Suite\archive` folders (including all subfolders) to a new location such as `D:\Log Tracker\logs` and `D:\Log Tracker\archives`. (Note that this operation may take a while if you are copying hundreds of gigabytes of data or more.)
2. Log in to the Log Tracker web interface, navigate to the **Messages > Config > Parms** screen, and click the **Edit** button.
3. Modify the values for **Syslog Directory Path** and/or **Archive Data Path** and click **Save**. Note that the specified paths must exist, or Log Tracker Server will display an error and not save the change.
4. After modifying the values, stop and restart the **CorreLog Framework Service** to apply the changes.

After running the above procedure, verify that you still have access to all your log data. One way to do this is to go to the **Messages > Search** screen and click the **Search: Today** drop-down menu to view all the online data on the system.

After you have verified your log data still exists, you may remove the old folders (by default `C:\Program Files (x86)\NNT Log Tracker Suite\logs` and `C:\Program Files (x86)\NNT Log Tracker Suite\archive`) to free up disk space on the Log Tracker Server.

## Related Articles

- [How to Backup / Restore / Move your MongoDB Database](#)
- [How to move your Linux Server MongoDB Database to a Windows server?](#)
- [Supporting Documents for Hub Server Problems](#)
- [Rolling-Log Fix: "Hub Offline, connection retries exhausted (The remote server returned an error: (403) Forbidden.)"]( #)
- [Support for TLS 1.2 in the .NET Framework 3.5.1](#)

**Attachments:**
- [Screenshot.PNG](#)