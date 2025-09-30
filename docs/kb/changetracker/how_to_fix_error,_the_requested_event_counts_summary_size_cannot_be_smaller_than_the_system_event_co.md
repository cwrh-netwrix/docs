---
description: >-
  This article provides a solution for the error message stating that the requested event counts summary size cannot be smaller than the system event count window size in Change Tracker.
keywords:
  - Change Tracker
  - EventStatsUnitSeconds
  - error resolution
sidebar_label: Fix Event Counts Summary Size Error
tags: []
title: How to Fix "Error, the Requested Event Counts Summary Size Cannot Be Smaller Than the System Event Count Window Size" Message
knowledge_article_id: kA04u0000000JgYCAU
products:
  - change-tracker
---

# How to Fix "Error, the Requested Event Counts Summary Size Cannot Be Smaller Than the System Event Count Window Size" Message

## Problem

When any Change Tracker user browses to the **Change Tracker Dashboard** tab or the **Device** tab, a red error message box appears on the screen stating - "**Error, the requested event counts summary size cannot be smaller than the system event count window size**".

## Solution

To resolve the issue, the user will need to ensure that the **EventStatsUnitSeconds** configuration item is set to a factor of 86400.

The **default value** is set to **1800**. If the error message is seen, this implies that the current value **is not** a whole number multiple of 86400, and the value will need to be corrected. To check and correct the value, please follow the steps below:

1. Log in to **Change Tracker**.
2. Browse to the **Settings Tab**.
3. Browse to **System Settings**.
4. Scroll to the **bottom** of the page.
5. Select **Show Advanced Options**.
6. Under **Configuration Settings**, look for the description: **EventStatsUnitSeconds**.
7. If the config item cannot be found, use the **Add Config Item** to create it.
8. If the value is **not set** or the value is **not 1800**, select the **Edit** button next to **EventStatsUnitSeconds** and change the value accordingly.
9. Press **Update**.
10. Log out and log in to **Change Tracker**.

## Related Articles

- [How to Fix "Error, the Requested Event Counts Summary Size Cannot Be Smaller Than the System Event Count Window Size" Message](#)
- [The NNT FAST™ Cloud Usage Considerations](#)
- [HTTP Error 500.19 - Internal Server Error - Error Code 0x8007007e](#)
- [Redis - QFork.dat Files Taking Up Large Amounts Of Disk Space?](#)
- [NNT Gen 7 Agent - Hub Connection Test Error (WinHttp.WinHttpRequest)](#)