---
description: >-
  This article provides step-by-step instructions on how to monitor Log Tracker devices when they go offline, including setting up alerts and reports.
keywords:
  - Log Tracker
  - device monitoring
  - alerts
  - offline events
  - configuration
sidebar_label: Monitor Log Tracker Device Offline
tags: []
title: How to Monitor Log Tracker Device Offline
knowledge_article_id: kA04u0000000JY5CAM
products:
  - change-tracker
---

# How to Monitor Log Tracker Device Offline

## Overview

A common requirement of Log Tracker users is to detect and report when devices go "red" on the Log Tracker Server "Devices" screen, indicating that a device is no longer sending messages. You can easily configure an alert to detect this condition as follows:

## Instructions

1. Create a new correlation thread that detects the key phrase `message source is idle`.
2. Create an alert that opens a ticket if the above thread increments by one count in zero seconds. This sets an alert for any and all occurrences of this message.
3. Optionally, create a daily email report that lists the raw messages for the thread created in step 1. This report will be sent each day at midnight (only if at least one device has been reported offline during the previous day).
4. Optionally, drill down into the **Devices > Advanced** screen, and set the **Message Idle Time** threshold to be 1-Day, 1-Hour, 4-Hours, or some other value.

The above configuration relies on the internal message that is sent by Log Tracker when a device transitions from green to red. The specific text of this message (which is generated for each occurrence of this situation) is as follows:

*Log Tracker Network Monitor: Message source is idle. No messages received from '(device)' address during last (threshold). Message source is no longer sending periodic messages, and may be offline.*

The thread created in step 1 captures these messages. The alert configured in step 2 will open a ticket when this condition exists (which can send email by triggering a **Ticket Action**).

See the attached screenshot for additional notes on the **Message Idle Time** setting, found on the **Messages > Catalogs > Devices > Advanced** screen.

Finally, note that a good alternative to using the above thread and alert is to simply send email when a Log Tracker advisory is generated. The **Advisory** facility sets a system advisory when one or more devices are not sending messages, among many other advisories that can be generated. The operator can configure email for advisories using the **System > Prefs > Modify Advisories** screen—scroll down to the bottom of the **Modify Advisories** screen (also known as the **Advisory Preferences Screen**) to enable and configure the Advisory email notifications.

## Related Articles

- [How to move your Linux Server MongoDB Database to a Windows server?](https://kb.netwrix.com/8283)
- [Supporting Documents for Hub Server Problems](https://kb.netwrix.com/8273)
- [How to fix the "Check Log for Details" message in the event details](https://kb.netwrix.com/8133)
- [Change Tracker Gen 7 Change Log / Update Log / ReadMe.txt Documents for Agent/Hub](https://kb.netwrix.com/8368)