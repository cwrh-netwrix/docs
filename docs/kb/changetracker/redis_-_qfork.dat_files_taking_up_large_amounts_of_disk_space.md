---
description: >-
  This article explains the implications of Redis QFork.dat files taking up significant disk space and provides guidance on whether it is safe to delete them.
keywords:
  - Redis
  - QFork.dat
  - disk space
sidebar_label: Redis QFork.dat Files Disk Space
tags: []
title: Redis - QFork.dat Files Taking Up Large Amounts Of Disk Space?
knowledge_article_id: kA04u0000000JewCAE
products:
  - change-tracker
---

# Redis - QFork.dat Files Taking Up Large Amounts Of Disk Space?

## Overview

Have you noticed that the server hosting your Change Tracker web console is running low on disk space? Have you scanned the server's disks and found that the culprit is the Redis QFork.dat files? Are you unsure of what the files are and if it is safe to delete them? If so, please read the guide below for your answer!

The files that you may be faced with are normally stored in the following directory: **C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Redis**

![Redis QFork.dat Files Location](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKM9&d=%2Fa%2F4u000000M08R%2FYuRr3pHb.sSwdfTJpN3FbZp8eTKDKEzuIfsxriSQokk&asPdf=false)

These files are created due to Redis using the fork UNIX system API to create a point-in-time snapshot of the data store for storage to disk. Windows does not have a fork-like API available, so Redis opted to simulate this behavior by placing the Redis heap in a memory-mapped file that can be shared with a child (quasi-forked) process. By default, the size of each snapshot file should be equal to the size of the device's physical memory.

If you encounter this problem, **it is safe** to delete these files, as long as the Redis service is not running.