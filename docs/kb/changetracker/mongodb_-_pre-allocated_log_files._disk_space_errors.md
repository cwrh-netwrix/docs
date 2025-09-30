---
description: >-
  This article addresses the issue of pre-allocated log files in MongoDB Version 3.6.3, which can lead to unexpected service stops and disk space errors.
keywords:
  - MongoDB
  - log files
  - disk space errors
sidebar_label: MongoDB - Pre-allocated Log Files
tags: []
title: MongoDB - Pre-allocated Log Files. Disk Space Errors
knowledge_article_id: kA04u0000000JdQCAU
products:
  - change-tracker
---

# MongoDB - Pre-allocated Log Files. Disk Space Errors

## Problem

The number of pre-allocated log files grows unbounded in MongoDB Version 3.6.3, and the MongoDB service unexpectedly stops on the server. The following errors are reported in the `mongod.log` file:

```
: No space left on device
2018-11-29T14:48:23.440+0000 E STORAGE  [thread16497] WiredTiger error (28) [1543502903:439454][5596:140717558290144], log-server: log pre-alloc server error: No space left on device
2018-11-29T14:48:23.440+0000 E STORAGE  [thread16497] WiredTiger error (28) [1543502903:440450][5596:140717558290144], log-server: log server error: No space left on device
2018-11-29T14:48:23.440+0000 E STORAGE  [thread16497] WiredTiger error (-31804) [1543502903:440450][5596:140717558290144], log-server: the process must exit and restart: WT_PANIC: WiredTiger library panic
2018-11-29T14:48:23.458+0000 F -        [thread16497] Fatal Assertion 28558 at src\mongo\db\storage\wiredtiger\wiredtiger_util.cpp 361
2018-11-29T14:48:23.458+0000 F -        [conn16466] Fatal Assertion 28559 at src\mongo\db\storage\wiredtiger\wiredtiger_util.cpp 64
2018-11-29T14:48:23.458+0000 F -        [thread16497] 

***aborting after fassert() failure


2018-11-29T14:48:23.458+0000 F -        [conn16466] 

***aborting after fassert() failure
```

The log file indicates that there is no disk space left on the device; however, checking the storage available on the server shows that there is more than enough storage available.

## Cause

The problem appears to be a bug in MongoDB version 3.6.3, which has been resolved in version 3.6.4.

## Resolution

1. Head to the [MongoDB website](https://www.mongodb.com/) and download the following version:  
   **win32/mongodb-win32-x86_64-2008plus-ssl-3.6.4-signed.msi**.
2. Install it on the Change Tracker Server where MongoDB resides.

### Related Articles

- [How to Backup / Restore / Move your MongoDB Database](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JWTCA2.html)
- [How to move your Linux Server MongoDB Database to a Windows server?](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JemCAE.html)
- [How to Change the Admin Password of your Mongo Database](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JgJCAU.html)
- [How to fix the "Check Log for Details" message in the event details](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JVQCA2.html)
- [Change Tracker Gen 7 Change Log / Update Log / ReadMe.txt Documents for Agent/Hub](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JkGCAU.html)