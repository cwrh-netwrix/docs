---
description: >-
  This article provides a step-by-step guide on how to generate an alert when devices stop sending messages on Log Tracker.
keywords:
  - Log Tracker
  - device alerts
  - message idle time
sidebar_label: Generate Alert for Device Messages
tags: []
title: How to Generate an Alert When Devices Stop Sending Messages on Log Tracker
knowledge_article_id: kA04u0000000JcMCAU
products:
  - change-tracker
---

# How to Generate an Alert When Devices Stop Sending Messages on Log Tracker

## Overview

When a device stops sending messages, the device icon on the **Messages > Device** screen turns red. The exact threshold time for this is configured in the **Advanced** screen of the **Messages > Device** screen, specifically the **Message Idle Time Threshold** value, which is set to one day by default.

When Log Tracker detects that the last message for that device exceeds this configured time, not only does the device icon turn red, but the system also logs a message to itself as follows:

```
Log Tracker Network Monitor: Message source is idle. No messages received from (iapddr) during last (threshold-time)
```

## Instructions

So, given the above information, you can receive an email when any device stops sending messages using the following procedure:

1. Create a Correlation Thread via the **Correlation > Threads > Add New** screen, and configure the match expression to be the phrase **message source is idle**. This thread will collect all the messages that have this key text.
2. Create an alert via the **Alerts > Counter > Add New** screen, and configure a threshold of 1 count in 60 seconds. This will open a ticket when any device turns red. (If two devices turn red within 60 seconds, only one ticket is opened. Some users prefer to set the severity of this alert high, such as to **critical**, but this is up to the end user.)
3. As needed, configure a notification via the **Tickets > Actions > Add New** screen to send an email (or perform other notifications) when the alert triggers.

The above steps are sufficient to receive an email when any device turns red, serving as a useful precaution against any misconfiguration of an agent or firewall changes that may prevent a managed device from communicating with the Log Tracker Server.

## Related Articles

- [Rolling-Log Fix: "Couldn't get credentials for remote platform discovery on"](https://)
- [MongoDB - Pre-allocated Log Files Accumulate & Result to Disk Space Errors](https://)
- [How to delete a device in Log Tracker](https://)
- [How To Turn Off Bulk Email Notifications (Force Change Tracker to send one email for each change instead of compiling into one email with multiple changes)](https://)
- [Log Tracker - Types of Authentication](https://)