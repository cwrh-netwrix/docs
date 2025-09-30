---
description: >-
  This article provides recommendations for monitoring the health of your NNT Server and Agents using Application Performance Monitoring (APM) tools.
keywords:
  - NNT Server
  - Application Performance Monitoring
  - Change Tracker
sidebar_label: Monitoring Change Tracker Gen7
tags: []
title: What Change Tracker Gen7 Objects to Monitor Using Application Performance Monitoring (APM) Tools
knowledge_article_id: kA04u0000000JXbCAM
products:
  - change-tracker
---

# What Change Tracker Gen7 Objects to Monitor Using Application Performance Monitoring (APM) Tools

## Overview

This document indicates our recommendations for monitoring the health of your NNT Server and Agents. We have listed several variables that can be monitored utilizing application performance monitoring tools for monitoring the Server and Agents.

## Services

- **WAS**  
  Track this on your NNT Hub Server to monitor the IIS Service.

- **W3SVC**  
  Track this on your NNT Hub Server to monitor the IIS Service.

- **MongoDB**  
  Track this on your NNT Hub Server to monitor that the Mongo Database is running.

- **Gen7Agent**  
  Track this on all of your Windows Agents & NNT Hub Server to monitor that the NNT Agent Service is running.

- **nntgen7agent**  
  Track this on all of your Red Hat and Debian-based Distros to monitor that the NNT Agent Service is running.

## Processes

- **Gen7Agent.Service.exe**  
  Track this on all of your Windows-based agents and hub server to ensure the NNT Agent process is running.

- **w3wp or IIS Worker Process (w3wp.exe)**  
  Track this on your NNT Hub Server to ensure that the IIS Process is running.

- **MongoD or MongoDB Database Server (mongod.exe)**  
  Track this on your NNT Hub Server to ensure that the Mongo Database Process is running.

## Default Software Paths

- **C:\inetpub\wwwroot\Change Tracker Generation 7 Hub**
- **C:\inetpub\wwwroot\Change Tracker Generation 7 WebUI**
- **C:\Program Files\NNT Change Tracker Suite**
- **C:\ProgramData\NNT**
- **C:\ProgramData\Change Tracker Generation 7**

## Drivers/Dependencies

- **NNT WHO MADE THE CHANGE DRIVER** - `C:\Windows\System32\drivers\NNTInfo.sys`

- **.NET FRAMEWORK/Mono Runtime 3.5** - If you are using a NNT 6.5 Agent (Version Example: 1.0.0.106), ensure that this does not get uninstalled or downgraded to an older version.

- **.NET FRAMEWORK/Mono Runtime 4.5** - If you are using a NNT Gen7 Agent (Version 7.0.0.29), ensure that this does not get uninstalled or downgraded to an older version. If you need to use an older version due to a critical application, use a 6.5 Agent instead.

- **.NET FRAMEWORK/Mono Runtime 4.6.1** - For the NNT Change Tracker Generation 7 Hub Server (Version 7.0.1.48 or newer), ensure that this does not get uninstalled or downgraded to an older version.

## Potential Syslog Thresholds / Messages

- **Agent Error** - This messaging type shows any errors that Change Tracker Agents are experiencing. It is recommended that you build a threshold mechanism that searches for this kind of message from the Change Tracker server and alerts the proper response teams.

- **Audit (Device Admin)** - This messaging type shows any changes to device configurations. It is recommended that you build a threshold mechanism that searches for this kind of message from the Change Tracker server and alerts the proper response teams.

- **Audit (System Config Change)** - This messaging type shows any changes to system settings for Change Tracker server configurations. It is recommended that you build a threshold mechanism that searches for this kind of message from the Change Tracker server and alerts the proper response teams.

- **Audit (User Administration)** - This messaging type shows any changes to User Settings for the Change Tracker console. It is recommended that you build a threshold mechanism that searches for this kind of message from the Change Tracker server and alerts the proper response teams.

- **Audit (Device Details Change)** - This messaging type shows any changes to the details of an agent device.

- **Device Offline** - This messaging type shows when an agent goes offline.

- **Device Online** - This messaging type shows when an agent goes online.

- **New Device Registered** - This messaging type shows when a new agent registers to the NNT Hub Server.

- **System Error** - This messaging type shows when the Change Tracker Server is experiencing an error. It is recommended that you build a threshold mechanism that searches for this kind of message from the Change Tracker server and alerts the proper response teams.

- **Planned and Unplanned Changes** - This messaging type shows when the Change Tracker Server receives planned or unplanned changes. It is recommended that you build a threshold mechanism that searches for this kind of message from the Change Tracker server and alerts the proper response teams.

- **Event Type: Communications** - This messaging type shows communications between the agent and hub server. It is recommended that you build a threshold mechanism that searches for this kind of message from the Change Tracker server and alerts the proper response teams.

- **Event Type: Audit** - This messaging type shows audit information for Change Tracker, such as user account management, configuration changes, etc. It is recommended that you monitor for this and build threshold mechanisms if needed.

## Log Files

### NNT 6.5 AGENT

**On Windows**

- `C:\Program Files\NNT Change Tracker Suite\Agent\rolling-log.txt`
- `C:\Program Files\NNT Change Tracker Suite\Agent\HubDetails.xml`

**On Linux**

- `/opt/nnt/agent/bin/rolling-log.txt`
- `/opt/nnt/agent/bin/HubDetails.xml`

### NNT GEN7 AGENT

**On Windows**

- `C:\ProgramData\NNT\gen7agent.service\rolling-log.txt`
- `C:\ProgramData\NNT\gen7agent.service\HubDetails.xml`

**On Linux**

- `/var/nnt/gen7agent.service/rolling-log.txt`
- `/var/nnt/gen7agent.service/HubDetails.xml`

### Change Tracker Server / Database Logs

- **Hub Service Log (Linux)** - `/opt/nnt/hubservice/log/hubservice-log.txt`
- **Hub Service Log (Windows)** - `C:\inetpub\wwwroot\Change Tracker Generation 7 Hub\log\hubservice-log.txt`
- **MongoDB Log (Linux)** - `/var/log/mongodb/mongod.log`
- **MongoDB Log (Windows)** - `C:\ProgramData\Change Tracker Generation 7\MongoDB\log\mongod.log`

## Things to Keep in Mind

### NNT Change Tracker Hub Server:

- The percentage of memory in use on a server should not be monitored as MongoDB prefers to reserve as much as possible. The reserved memory is known as the "Commit Size"; however, the memory that is actually in use is defined by the "Working Set". An example of this is shown in the screenshot below:

![Memory Usage Example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKMT&d=%2Fa%2F4u000000Lzu0%2FU5hmbbSCGprdgx78yG0znAEr91KFgI9.JRyPnMoX.Qk&asPdf=false)

### NNT Change Tracker Agents:

- The NNT Change Tracker Gen7 Agent is built using .NET Framework. Applications that are based on .NET Framework may allocate different amounts of memory at different times. Keep in mind that .NET Framework has a Garbage Collecting function, which determines the best time for the system to clean up current memory banks that the application no longer needs. Overall, memory usage for .NET applications is a difficult metric to gauge, as in most scenarios, the application is not really utilizing all the memory that has been assigned to it, and the .NET Framework portion of the application will allocate and de-allocate the memory as per the system’s needs.

- An Agent Performance Metrics and Footprint guide has been created. If you want this, please notify NNT Support with the request, and we can send you the latest version.