---
description: >-
  This article explains the error message related to the RegistryTrackerDataCollector and provides guidance on how to resolve it.
keywords:
  - RegistryTrackerDataCollector
  - registry key permissions
  - Change Tracker
sidebar_label: Rolling-Log Fix
tags: []
title: Rolling-Log Fix: "RegistryTrackerDataCollector - check the agent process has the required permissions to access the registry key. The specified registry key does not exist."
knowledge_article_id: kA04u0000000JXICA2
products:
  - activity-monitor
---

# Rolling-Log Fix: "RegistryTrackerDataCollector - check the agent process has the required permissions to access the registry key. The specified registry key does not exist."

## Example Error Message

```
2017-10-02 09:14:38,759 [9] ERROR RegistryTrackerDataCollector - check the agent process has the required permissions to access the registry key. (HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\ExampleService\Parameters, error: The specified registry key does not exist.)
```

## What Does It Mean?

This error occurs when your configuration template in **Change Tracker** is set to track a registry key, but the agent cannot access the registry key because it is either not found or does not have the proper permissions.

## How Can I Fix This / Should I Worry?

If you are receiving this error for a registry key that does not exist, then there is no need to worry. If you are using one template to track multiple agents, and some agents do have the key while others do not, it is acceptable to let it track this key. The only caution is regarding the number of keys it is monitoring. If the template grows significantly, having a large volume of these errors may cause performance issues; however, in most cases, it is perfectly fine.

If you are certain that the registry key exists but are still encountering this error, follow these steps:

1. Check your configuration template. Is it looking for the key in the same location where you have placed the file?
2. Is this a registry key that exists in different locations on different servers? If so, please define all potential locations in the template.
3. Does this agent have special permissions that prevent it from accessing the registry? If so, adjust the permissions accordingly.

> **NOTE:** In most cases, you can simply ignore this error as it is not harmful.

## Related Articles

- [How to fix the "Check Log for Details" message in the event details](https://kb.netwrix.com/8133)
- [Support for TLS 1.2 in the .NET Framework 3.5.1](https://kb.netwrix.com/8302)
- [MongoDB - Pre-allocated Log Files Accumulate & Result to Disk Space Errors](https://kb.netwrix.com/8285)
- [Change Tracker – How to Create a Custom Tracked Attributes Filter Within a Configuration Template](https://kb.netwrix.com/8265)
- [How To Turn Off Bulk Email Notifications (Force Change Tracker to send one email for each change instead of compiling into one email with multiple changes)](https://kb.netwrix.com/8284)