---
description: >-
  This article explains the error message "couldn't locate file entry" in Change Tracker and provides steps to resolve it.
keywords:
  - Change Tracker
  - file tracking error
  - configuration template
sidebar_label: Rolling-Log Fix
tags: []
title: Rolling-Log Fix: "FileContentTrackerDataCollectorLocal - Couldn't Locate File Entry for /mydirectory/my.file"
knowledge_article_id: kA04u0000000JY6CAM
products:
  - activity-monitor
---

# Rolling-Log Fix: "FileContentTrackerDataCollectorLocal - Couldn't Locate File Entry for /mydirectory/my.file"

## What Does It Mean?

This error occurs when your configuration template in Change Tracker is set to track file contents on a specific file. In this case, it is looking to track `/etc/yum.conf`. This error means that the agent could not locate this file.

## How Can I Fix This / Should I Worry?

If you are receiving this error for a file that does not exist, then no, you do not need to worry. If you are using one template to track multiple agents, and some agents do have the file while others do not, it is acceptable to let it track this file. The only caution to consider is the number of files it is looking for. If the template grows exponentially, having a large volume of these errors may cause performance issues; however, in most cases, it is perfectly fine.

If you are certain the file exists but are still getting this error, follow these steps:

1. Check your configuration template. Is it looking for the file in the same location where you have placed the file?
2. Is this file located in different places on different servers? If so, please define all potential locations in the template.
3. Does this file have special permissions that prevent it from being read by our agent? If so, adjust the file permissions or modify the privileges of the account our agent uses.

> **NOTE:** In most cases, you can simply ignore this error as it is not harmful.

## Related Articles

- [How to Fix the "Check Log for Details" Message in the Event Details](https://kb.netwrix.com/8133)
- [Support for TLS 1.2 in the .NET Framework 3.5.1](https://kb.netwrix.com/8302)
- [MongoDB - Pre-allocated Log Files Accumulate & Result in Disk Space Errors](https://kb.netwrix.com/8285)
- [Change Tracker – How to Create a Custom Tracked Attributes Filter Within a Configuration Template](https://kb.netwrix.com/8265)
- [How To Turn Off Bulk Email Notifications](https://kb.netwrix.com/8284)