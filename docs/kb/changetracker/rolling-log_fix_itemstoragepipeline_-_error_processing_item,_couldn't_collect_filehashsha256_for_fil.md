---
description: >-
  This article explains the "ItemStoragePipeline" error message related to file tracking in Change Tracker and provides steps to resolve it.
keywords:
  - ItemStoragePipeline
  - Change Tracker
  - file tracking
sidebar_label: Rolling-Log Fix
tags: []
title: Rolling-Log Fix: "ItemStoragePipeline - Error processing item, couldn't collect filehashsha256 for file"
knowledge_article_id: kA04u0000000JZwCAM
products:
  - activity-monitor
---

# Rolling-Log Fix: "ItemStoragePipeline - Error processing item, couldn't collect filehashsha256 for file"

## Example Error Message

```
2017-10-11 08:11:18,385 [4] ERROR ItemStoragePipeline - Error processing item, couldn't collect filehashsha256 for file: /etc/rc6.d/K05dsmcad Error: Failed to collect data for attribute (Could not find file "/etc/rc6.d/K05dsmcad")
```

## What Does It Mean?

This error occurs when your configuration template in **Change Tracker** is set to track a file, but the agent cannot hash the file because it is not found. In this case, we are looking to track `/etc/rc6.d/K05dsmcad`.

## How Can I Fix This / Should I Worry?

If you are receiving this error for a file that does not exist, then no, do not worry. If you are using one template to track multiple agents, and some agents do have the file while others do not, it is acceptable to let it track this file. The only caution is regarding the number of files it is looking for. If the template grows exponentially, having a large volume of these errors may cause performance issues; however, in most cases, it is perfectly fine.

If you are certain the file exists but are still getting this error, do the following:

1. Check your configuration template. Is it looking for the file in the same location where you have placed the file?
2. Is this file located in different places on different servers? If so, please define all potential locations in the template.
3. Does this file have special permissions that prevent it from being read by our agent? If so, adjust the file permissions or modify the privileges of the account our agent uses.

> **IMPORTANT:** In most cases, you can simply ignore this error as it is not harmful.

## Related Articles

- [How to fix the "Check Log for Details" message in the event details](https://kb.netwrix.com/8133)
- [Support for TLS 1.2 in the .NET Framework 3.5.1](https://kb.netwrix.com/8302)
- [MongoDB - Pre-allocated Log Files Accumulate & Result to Disk Space Errors](https://kb.netwrix.com/8285)
- [Change Tracker – How to Create a Custom Tracked Attributes Filter Within a Configuration Template](https://kb.netwrix.com/8265)
- [How To Turn Off Bulk Email Notifications (Force Change Tracker to send one email for each change instead of compiling into one email with multiple changes)](https://kb.netwrix.com/8284)