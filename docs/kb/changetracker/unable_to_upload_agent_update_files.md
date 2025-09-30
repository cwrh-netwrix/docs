---
description: >-
  This article provides guidance on resolving issues related to uploading agent update files in Netwrix Change Tracker.
keywords:
  - Netwrix Change Tracker
  - agent updates
  - file upload error
sidebar_label: Unable to Upload Agent Update Files
tags: []
title: Unable to Upload Agent Update Files
knowledge_article_id: kA0Qk0000000XYfKAM
products:
  - change-tracker
---

# Unable to Upload Agent Update Files

## Symptom

When you attempt to upload agent updates in **Netwrix Change Tracker**, the following errors are prompted:

```
System Error
An unknown error occurred
```

```
%number_of% File(s) failed to upload
```

The upload attempt fails.

## Cause

The default size for the maximum file upload in Internet Information Services (IIS) is too low. The default value prevents **Change Tracker** from uploading agent updates.

## Resolution

Increase the predefined file upload size in `Web.config`:

1. Run the following line in an elevated Command Prompt to stop all IIS services:

   ```plaintext
   iisreset /stop
   ```

2. Locate and open the `Web.config` file:

   ```plaintext
   C:\inetpub\wwwroot\Change Tracker Generation 7 (NetCore) Hub\Web.config
   ```

3. Modify the `<requestFiltering>` node to specify the following value:

   ```plaintext
   <requestFiltering>
       <requestLimits maxAllowedContentLength="250000000" />
   </requestFiltering>
   ```

   Save the changes.

4. Run the following line in an elevated Command Prompt to start all IIS services:

   ```plaintext
   iisreset /start
   ```

5. Log in to the **Change Tracker** console and reupload the update files.