---
description: >-
  This article explains how to detect a Windows system time change using the Log Tracker Server, including necessary configurations and alert setups.
keywords:
  - Windows system time change
  - Log Tracker Server
  - system clock monitoring
sidebar_label: Detecting Windows System Time Changes
tags: []
title: How to Detect a Windows System Time Change With the Log Tracker Server
knowledge_article_id: kA04u0000000JTRCA2
products:
  - log-tracker
---

# How to Detect a Windows System Time Change With the Log Tracker Server

## Overview

This article explains how to detect a Windows system time change using the **Log Tracker Server**. It outlines the necessary configurations and how to set up alerts for system time changes.

## Question

How to detect a Windows system time change with the Log Tracker Server?

## Answer

First, you will need to have the **Log Tracker Windows Agent** installed on the Windows platform. By default, the agent configuration monitors changes to the system clock and will generate a system message such as the following if the system clock is changed:

```plaintext
Location: WINDOWS7

Security 4616: Microsoft-Windows-Security-Auditing: The system time was changed. 

 Subject: 
   Security ID: WINDOWS7\jeff-davison 
   Account Name: jeff-davison 
   Account Domain: WINDOWS7 
   Logon ID: 0x21a7a 

 Process Information: 
   Process ID: 0x159c 
   Name: C:\Windows\System32\rundll32.exe 
   Previous Time: 2014-12-12T20:26:54.000000000Z 
   New Time: 2014-12-12T20:26:54.000000000Z 

This event is generated when the system time is changed. (Audit Success)
```

No other action (other than installing the agent) is necessary to get the above messages correctly logged. If you would like to trigger an alert if the above message occurs, match the above message in the **Alerts > Device** screen. You can set up a single alert across all devices. If you set up an alert, you will then receive a ticket if the system time changes for any device.

## Related Articles

- [How to Backup / Restore / Move your MongoDB Database](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JWTCA2.html)
- [How to move your Linux Server MongoDB Database to a Windows server?](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JemCAE.html)
- [How to Change the Admin Password of your Mongo Database](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JgJCAU.html)
- [Supporting Documents for Hub Server Problems](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JdtCAE.html)