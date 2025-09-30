---
description: >-
  This article provides step-by-step instructions on configuring recursive file content monitoring using the File Integrity Monitoring tracker in Change Tracker.
keywords:
  - file content monitoring
  - Change Tracker
  - File Integrity Monitoring
sidebar_label: Configure Recursive File Content Monitoring
tags: []
title: How to Configure Recursive File Content Monitoring
knowledge_article_id: kA04u0000000JS3CAM
products:
  - change-tracker
---

# How to Configure Recursive File Content Monitoring

## Overview

You can monitor for file-content changes alongside File Integrity Monitoring (FIM) using our File Integrity Monitoring tracker. However, you will need to make some changes to a Change Tracker configuration file and the configuration template attached to your devices.

By default, the FIM/File-content combination is not enabled on the web console. To enable this feature, follow the steps below.

## Instructions

1. Connect to the server hosting your Change Tracker server via RDP.
2. Browse to the following folder: **C:\inetpub\wwwroot\Change Tracker Generation 7 Hub\bin\Filters**.
3. Edit the following file: **default.xml**.
4. Find the following chunk of text and remove the text highlighted in red:

   ```xml
   <!--filetrackerchangesfilter name="filecontentschangesonly" description="File attributes (including contents) only" priority="low" source="globalLow" watchdirectories="false" watchfiles="true" created="false" length="true" lastaccess="false" lastwrite="true" filename="true" directoryname="true" attributes="true" security="true" datastreams="true" content="true" />
   ```

5. Save and close the file.
6. Log off from the RDP session.

Now that this has been done, you will need to apply this FIM/File-content filter to your devices' configuration template. To do this, follow these steps:

1. Log into Change Tracker.
2. Browse to **Settings**.
3. Browse to **Configuration Templates**.
4. Select the appropriate configuration template from the list and click the **Edit** button next to it.
5. Browse to the **FIM File Integrity tracker**.
6. Select the **Tracked Folder** entry that you wish to monitor for file content changes recursively and click the **Edit** button next to it.
7. Under the **Tracked Attributes** column, select the drop-down menu and choose the **File attributes (including contents) only** option.
8. Press **Update**.
9. Press **Save Changes** at the top of the screen.

![Configuration Template Example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKIP&d=%2Fa%2F4u000000Lznx%2FUZuBS4PU_cMiSmxzwLgiSOvcUQf94Bb85OQINx_RvLQ&asPdf=false)

Once the changes made to the template have been saved, an updated version of the config will be sent to the agent, and a new baseline scan will run. Please allow some time for this scan to complete before making any test changes to files within the directory, as they may be captured as part of the baseline and not reported as a change.