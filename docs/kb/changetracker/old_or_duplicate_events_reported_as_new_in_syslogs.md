---
description: >-
  This article addresses the issue of old or duplicate events being reported as new in syslogs, detailing the symptoms, causes, and resolution steps.
keywords:
  - syslogs
  - MongoDB
  - event reporting
sidebar_label: Old or Duplicate Events in Syslogs
tags: []
title: Old or Duplicate Events Reported as New in Syslogs
knowledge_article_id: kA0Qk0000000ODdKAM
products:
  - change-tracker
---

# Old or Duplicate Events Reported as New in Syslogs

## Symptoms

- Old events appear in syslogs as new events. Upon further investigation, these are confirmed to be duplicates of previously reported events.
- The affected events have not been resubmitted.

## Cause

The pending notifications queue in the MongoDB contains notifications for older events. When the outdated notifications are released, they are reported as new events or duplicates of previously reported events.

## Resolution

Refer to the following steps:

1. Install MongoDB Shell: Download the MongoDB Shell `.zip` and place the contents in `C:\Program Files\NNT Change Tracker Suite\Gen7\MongoDB\bin`. Download MongoDB Shell in [MongoDB Shell Download · MongoDB 🡥](https://www.mongodb.com/try/download/shell).
2. Once copied, run the `mongosh.exe` application to connect to your Mongo database. Run the following line:

   ```plaintext
   mongodb://localhost:27017
   ```

   > **NOTE:** Make sure to replace the `27017` port in case MongoDB in your environment uses a different port.
3. Once connected to your Mongo Database, run the following commands to confirm whether notifications are queued:

   ```plaintext
   use NNTHubService
   db.IncomingEventQueue.count()
   db.NotificationQueue.count()
   db.PendingNotifications.count()
   db.BackgroundTaskQueue.count()
   ```
4. To clean up the queued notifications, run the following commands:

   ```plaintext
   use NNTHubService
   db.NotificationQueue.deleteMany({})
   ```

## Related Links

- [MongoDB Shell Download · MongoDB 🡥](https://www.mongodb.com/try/download/shell)