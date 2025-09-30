---
description: >-
  This article provides step-by-step instructions for changing the database location in the NNT Change Tracker Suite.
keywords:
  - database location
  - MongoDB
  - NNT Change Tracker
sidebar_label: Change DB Location
tags: []
title: How to Change the Database Location in NNT Change Tracker Suite
knowledge_article_id: kA04u0000000JTeCAM
products:
  - change-tracker
---

# How to Change the Database Location in NNT Change Tracker Suite

## Overview

This article provides step-by-step instructions for changing the database location in the NNT Change Tracker Suite.

## Instructions

1. Stop the IIS Web server using the command line:
   ```plaintext
   iisreset /stop
   ```
   Alternatively, you can use the **IIS Management Console** or the **Windows Services Console**.

2. Next, stop the MongoDB service using the **Windows Services Console**.

3. Edit the `mongod.conf` file located at:
   ```
   C:\Program Files\NNT Change Tracker Suite\Gen7\MongoDB\conf
   ```

4. Edit the parameters for `dbpath` to change the location for the database files.

5. Then, start the MongoDB service, followed by:
   ```plaintext
   iisreset /start
   ```

**Attachments:**
- [image2017-6-2_12-50-34.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKBT&d=%2Fa%2F4u000000LzeS%2FaNBRGcLX_rWYT53yHbH1dnquGmBv8cvLfFyt6gSF8iI&asPdf=false)