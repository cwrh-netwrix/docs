---
description: >-
  This article provides a step-by-step guide on how to revert language settings in the Log Tracker Server.
keywords:
  - Log Tracker
  - language settings
  - configuration
sidebar_label: Reverting Language Settings in Log Tracker
tags: []
title: How to Revert Language Settings in Log Tracker
knowledge_article_id: kA04u0000000JbsCAE
products:
  - log-tracker
---

# How to Revert Language Settings in Log Tracker

## Overview

There are several techniques available to switch language within the Log Tracker Server. The technique described below is not bad, but if you want to just revert essential information (tabs, alerts, etc.), you can execute the procedure below, which may be simpler in many cases.

## Instructions

To switch menu and tab languages, use the following procedure:

1. Stop the **Log Tracker Framework Service** using the Windows Service Manager.
   
2. Execute the `C:\Program Files (x86)\NNT Log Tracker Suite\system\CO-install.exe` program as **Administrator**.  
   > **NOTE:** This is the setup wizard for the program, which can be executed at any time to re-install the Apache server or make other changes to the basic program defaults without affecting the configuration or log data.

3. On the third screen of the **CO-install.exe Wizard**, select a language as the **Menu and Tab Language**.

4. Run the Wizard to completion.

The **CO-install.exe** program will load the language-specific files and restart the **Log Tracker Framework Service** when finished (you don't have to restart the service you stopped in step 1 above—the Wizard will restart the service).

This will not affect the text of any existing Alerts or Tickets that were previously created, but any new Alerts (created using the **Suggest** button on the **Alerts** screens) will be in the language you selected in step 3 above.

## Related Articles

- [How to delete a device in Log Tracker](#)
- [Log Tracker - Types of Authentication](#)
- [Log Tracker Tags Facility](#)
- [How to use CloseTicket.exe to Immediately Close Log Tracker Tickets](#)
- [How to Monitor Devices with Ping Adapter (Log Tracker)](#)