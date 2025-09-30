---
description: >-
  This article provides a step-by-step guide to resolve the issue of being unable to upload an agent installer package to the hub due to existing software updates.
keywords:
  - agent installer
  - hub upload issue
  - Change Tracker
sidebar_label: Unable to Upload Agent Installer
tags: []
title: Unable to Upload an Agent Installer Package to the Hub
knowledge_article_id: kA04u0000000JW0CAM
products:
  - change-tracker
---

# Unable to Upload an Agent Installer Package to the Hub

## Overview

This article addresses the issue encountered on a Change Tracker 54 hub installed on a Windows server with .NET 4.6.1. The problem arises when the **Agent Software Updates** section is empty, yet the hub displays an error stating, "There appears to be a software update of this version available already." The error prompts the user to remove the existing version before uploading a new one.

## Symptom

The **Agent Software Updates** section is empty, and an error message appears when attempting to upload a new agent installer package.

## Cause

This issue occurs when there is a partial upload or existing software update that has not been cleared from the system.

## Resolution

To resolve this issue, follow these steps to wipe the partial upload from the MongoDB `fs.files` and `fs.chunks` collections:

### Recovering from a Botched Agent Update Upload

1. **Find Scheduled Updates**: Use the following command to find scheduled updates on groups via MongoDB, then remove them using the UI:
   ```plaintext
   use NNTHubService
   db.SystemDirectory.find({ "_t" : ["MongoMember", "MongoGroupMember"], "GroupAgentUpdateSchedule" : { $ne: null }}, { "DisplayName" : 1 })
   ```
   This command will list any group names that have scheduled agent updates.  
   **Remove the updates from the listed groups using the UI.**

2. **Verify Update Zip Files**: Check for any update zip files in MongoDB GridFS that need to be removed. Use the following query:
   ```plaintext
   db.fs.files.find({ "metadata.UpdateType" : { $gt: 0 } }).pretty()
   ```

3. **Remove File Records and Data**: Execute the following commands to remove the file records and data from GridFS:
   ```plaintext
   db.fs.files.remove({ "metadata.UpdateType" : { $gt: 0 } })
   db.fs.chunks.remove({ "metadata.UpdateType" : { $gt: 0 } })
   ```
   **Note**: The second command may not be necessary but will not cause any harm.

4. **Verify Deletion**: Run the query from Step 2 again. **It should now return no results**, indicating that all updates have been deleted.

5. **Restart IIS**: Restart IIS to refresh the Hub's cached idea of the available updates.