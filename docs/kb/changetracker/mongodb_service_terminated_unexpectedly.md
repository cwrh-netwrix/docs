---
description: >-
  This article provides troubleshooting steps for resolving issues when the MongoDB Service terminates unexpectedly after startup.
keywords:
  - MongoDB
  - Change Tracker
  - service termination
sidebar_label: MongoDB Service Termination
tags: []
title: MongoDB Service Terminated Unexpectedly
knowledge_article_id: kA04u000000wnncCAA
products:
  - change-tracker
---

# MongoDB Service Terminated Unexpectedly

## Symptom

The MongoDB Service does not stay running and stops after each startup.

## Cause

The issue occurs if a database is corrupted, which can happen when a server is shut down unexpectedly, as MongoDB does not have time to shut down safely.

## Resolution

1. On the computer that hosts **Change Tracker** software, stop the **MongoDB** service.
2. Open a **Command Prompt**, ensuring that you run it as an **Administrator**.
3. Enter the following command:
   ```plaintext
   cd "C:\Program Files\NNT Change Tracker Suite (Netcore)\Gen7\MongoDB\bin"
   ```
4. Enter the following command:
   ```plaintext
   mongod.exe --dbpath "C:\ProgramData\Change Tracker Generation 7 (Netcore)\MongoDB\db" --repair
   ```
5. Enter the following command:
   ```plaintext
   iisreset
   ```
6. Close the command prompt window.