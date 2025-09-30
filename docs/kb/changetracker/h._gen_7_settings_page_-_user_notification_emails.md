---
description: >-
  This article explains how to configure user notification emails for selected events in specified Device Groups.
keywords:
  - user notification emails
  - email alerts
  - device groups
sidebar_label: User Notification Emails
tags: []
title: Gen 7 Settings Page - User Notification Emails
knowledge_article_id: kA04u0000000JSqCAM
products:
  - change-tracker
---

# Gen 7 Settings Page - User Notification Emails

## Overview

Email alerts can be controlled on a per-user basis to provide email notification of selected events for specified Device Groups. Select the user from the drop-down **User Name** selector, then specify the groups of interest for alerts, the required **Notification Types**, and the **Notification Method** of email. The password is set or changed by clicking the chain icon.

![User Notification Emails Configuration](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK5C&d=%2Fa%2F4u000000Lzck%2FobyiQYIMGsNkUjyEPEVKfBrLYi6qtmw.JfD89fVCy6w&asPdf=false)

## Notification Messages Explained

| Event Message                                                                 | Description                                                                                                                                                                                                                     |
|-------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Your backup scheduled at <time> is complete.                                  | This notification message is generated when a scheduled backup finishes successfully. Backup types vary from full backups to individual sections of the software, i.e., Planned Changes/Events.                               |
| Your backup scheduled at <time> encountered an error. (+ error here)         | This notification message is generated when a scheduled backup finishes with errors. The error message will be displayed within the events description – this information may be used by Netwrix Support to resolve the issue. |
| Your restore scheduled at <time> is complete.                                 | This notification message is generated when a scheduled restore finishes successfully. Restore types vary from full backups to individual sections of the software, i.e., Planned Changes/Events.                             |
| Your restore scheduled at <time> encountered an error. (+ error here)        | This notification message is generated when a scheduled restore finishes with errors. The error message will be displayed within the events description – this information may be used by Netwrix Support to resolve the issue. |
| Scheduled Query document size exceeds 16mb. Consider altering the saved query schedule or filter options to produce fewer results. | This notification message is generated when a report collated from the results of a saved query is too large. The end user will need to reconfigure their query schedule to include fewer days or fewer event types.            |
| Netwrix Change Tracker - Group Report Results (Scheduled compliance report run change details) | This notification message is generated when a scheduled report assigned to a Change Tracker group has completed. To receive this notification, a user's notification settings must be configured for the group.                  |
| Moved <number> events from failover event queue to primary event queue.       | This notification message is generated when events from a temporary failover queue are moved back to the primary queue. A temporary queue is dynamically created for redundancy purposes if the primary queue fails.             |
| Moved <number> background tasks from repository to queue.                     | This notification message is generated when background tasks from a temporary failover queue are moved back to the primary queue. A temporary queue is dynamically created for redundancy purposes if the primary queue fails.   |
| Event Pipeline component down [].                                               | This notification message is generated when a component fails. A component is a Change Tracker repository or queue.                                                                                                          |
| Event Pipeline component is back up [].                                        | This notification message is generated when a component recovers. A component is a Change Tracker repository or queue.                                                                                                        |
| Error disaggregating rule result data for event <event>, task <task>.        | This notification message is generated when a rule from a compliance report errors during presentation to the events list.                                                                                                   |
| <event> started                                                               | This notification message is generated when a scheduled planned change window opens.                                                                                                                                          |
| <event> ended                                                                 | This notification message is generated when a scheduled planned change window closes.                                                                                                                                         |
| Device Online: <device>                                                       | This notification message is generated when a device starts communicating with the Change Tracker.                                                                                                                            |
| Device Offline: <device>                                                      | This notification message is generated when a device stops communicating with the Change Tracker.                                                                                                                             |
| New device registered: <device>                                               | This notification message is generated when a device that hasn't been seen before registers with the Change Tracker server. This message should only be seen once per device.                                                  |
| Tests syslog message from Change Tracker server                                | This notification message is generated when a test syslog message is sent from the Change Tracker server to your specified syslog collector. This test ensures that events captured by Change Tracker can be forwarded successfully. |