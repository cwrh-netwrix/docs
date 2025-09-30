---
description: >-
  This article provides essential information on the files to provide when encountering issues with Netwrix software, specifically for various agents on Windows and Linux.
keywords:
  - Netwrix
  - Change Tracker
  - agent logs
sidebar_label: Netwrix Software Problem Information
tags: []
title: Netwrix Software Problem? What Info Should I Provide?
knowledge_article_id: kA04u0000000JPDCA2
products:
  - change-tracker
---

# Netwrix Software Problem? What Info Should I Provide?

## Problem

Once the NNT Change Tracker Windows or Linux agent is installed, the agent will automatically check in with the Change Tracker server and be assigned a monitoring template. The agent will appear in the Change Tracker console as shown below.

![Change Tracker Console](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJuX&d=%2Fa%2F4u000000LzMX%2F38YIbvW3VzH5QVufTePfteVTcO0PV3c5oCLZU4qAX0k&asPdf=false)

If, however, you do not see the agent in the console and are certain that all agent settings are correct, you will need to contact support.

> **IMPORTANT:** To solve the problem, support will ask for a number of files which will help to identify the issue. These files should also be provided if there is a problem with the software. The files which we will need are:

## Netwrix 6.5 AGENT

### On Windows

- `C:\Program Files\NNT Change Tracker Suite\Agent\rolling-log.txt`
- `C:\Program Files\NNT Change Tracker Suite\Agent\HubDetails.xml`
- `C:\Program Files\NNT Change Tracker Suite\Agent\store.db`

### On Linux

- `/opt/nnt/agent/bin/rolling-log.txt`
- `/opt/nnt/agent/bin/HubDetails.xml`
- `/opt/nnt/agent/bin/store.db`

## Netwrix GEN7 AGENT

### On Windows

- `C:\ProgramData\NNT\gen7agent.service\rolling-log.txt`
- `C:\ProgramData\NNT\gen7agent.service\HubDetails.xml`
- `C:\ProgramData\NNT\gen7agent.service\store.db`

### On Linux

- `/var/nnt/gen7agent.service/rolling-log.txt`
- `/var/nnt/gen7agent.service/HubDetails.xml`
- `/var/nnt/gen7agent.service/store.db`

## Netwrix EXPRESS AGENT

### On Unix / Linux

- `/var/nnt/expressagent/expressagent-log.txt`
- `/var/nnt/expressagent/HubDetails.xml`
- `/var/nnt/expressagent/store.db`

## LOCATIONS OF OTHER LOGS WE MAY ASK YOU FOR

- **Hub Service Log (Linux)** - `/opt/nnt/hubservice/log/hubservice-log.txt`
- **Hub Service Log (Windows)** - `C:\inetpub\wwwroot\Change Tracker Generation 7 Hub\log\hubservice-log.txt`
- **MongoDB Log (Linux)** - `/var/log/mongodb/mongod.log`
- **MongoDB Log (Windows)** - `C:\ProgramData\Change Tracker Generation 7\MongoDB\log\mongod.log`
- **Default MongoDB Location (Windows)** - `C:\ProgramData\Change Tracker Generation 7\MongoDB\db`
- **Default MongoDB Location (Linux)** - `/var/lib/mongodb`

## Related Articles

- [How to fix "Error, the requested event counts summary size cannot be smaller than the system event count window size" message](https://kb.netwrix.com/8313)
- [The Netwrix FAST™ Cloud Usage Considerations](https://kb.netwrix.com/8161)
- [HTTP Error 500.19 - Internal Server Error - Error Code 0x8007007e](https://kb.netwrix.com/8300)
- [Redis - QFork.dat Files Taking Up Large Amounts Of Disk Space?](https://kb.netwrix.com/8286)
- [Netwrix Gen 7 Agent - Hub Connection Test Error (WinHttp.WinHttpRequest)](https://kb.netwrix.com/8276)

**Attachments:**
- [image2016-11-16_15_29_8.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJuh&d=%2Fa%2F4u000000LzMh%2FfUb1x_YAC9_Eq4pUu6KXicnkJNQL3dAEviIYQXHebKg&asPdf=false)