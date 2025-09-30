---
description: >-
  This article provides step-by-step instructions on how to retrieve baseline events from an agent after it restarts, including necessary settings in the Change Tracker dashboard.
keywords:
  - baseline events
  - Change Tracker
  - agent restart
sidebar_label: Retrieve Baseline Events
tags: []
title: How to Retrieve Baseline Events After the Agent Restarts
knowledge_article_id: kA04u000000wnqvCAA
products:
  - change-tracker
---

# How to Retrieve Baseline Events After the Agent Restarts

## Overview

This article explains how to retrieve the baseline events (both the list of files and their hashes) from an agent after it restarts.

## Instructions

Typically, the agent performs a baseline scan of the file system after the agent/server has been restarted. However, to retrieve the baseline events for a server in the Change Tracker dashboard, a couple of settings need to be enabled first. Follow the instructions below to configure Change Tracker for retrieving baseline events:

1. Select the template running against the device and click **Edit**.
2. In the **Editing Tracking Templates** dialog, go to the **FIM File Integrity** tab and enable the **Send baseline events** checkbox.

   > **IMPORTANT:** Enable this option for each of the different trackers depending on which baselines you wish to retrieve.

   ![Editing Tracking Templates dialog with FIM File Integrity tab active](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka04u000000wwI4&feoid=00N0g000004CA0p&refid=0EM4u000008pf0d)

3. Navigate to **Settings** → **Agents & Devices**.
4. Select the device and click **Edit**.  
   ![Editing device settings](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka04u000000wwI4&feoid=00N0g000004CA0p&refid=0EM4u000008pf0J)

Once these options are enabled, baseline events will be sent the next time the agent/server is polled for this data.

## Related Articles

- [10. Configuration Templates - Working with Baseline Data](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JSHCA2.html)
- [How to Enable Baseline Events on Monitored Folders and What They Are?](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JWYCA2.html)