---
description: >-
  This article provides troubleshooting steps for resolving connectivity issues with the Gen 7 Agent.
keywords:
  - Gen 7 Agent
  - connectivity issues
  - troubleshooting
sidebar_label: Troubleshooting Gen 7 Agent Connectivity
tags: []
title: Troubleshooting Gen 7 Agent Connectivity
knowledge_article_id: kA04u0000000JQfCAM
products:
  - change-tracker
---

# Troubleshooting Gen 7 Agent Connectivity

## Problem

If the Agent UI is not available, then it is likely that the agent service is stopped or has failed. For any agent on any platform, there is a local agent status interface which can be viewed via the local web browser at [http://localhost:8096](http://localhost:8096).

- **Windows** – Check **Task Manager** and **Services Console**
- **Linux** – `service nntGen7agent status`

The below shows that the agent service is running correctly but it is unable to register with the Change Tracker Hub. The Agent should report the URL for the Hub it is registered as in the green pop-out boxes.

![Agent Status](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJtf&d=%2Fa%2F4u000000LzSa%2FC1ypxuI3GKr49VA__BZqMkeRnaqAUgmXaA9QkLkpz64&asPdf=false)

## Resolution

If the Hub URL referenced is not correct, you can edit the **HubDetails.xml** file and correct this. Likewise, the Agent username and password settings can be reset by editing this file.

- **Windows** - `C:\ProgramData\NNT\gen7agent.service\HubDetails.xml`
- **Linux** - `/var/nnt/gen7agent.service/HubDetails.xml`

### HubDetails.xml File

#### Step 1. Check settings

The Agent configuration settings are controlled by the Hub during operations, but the initial registration necessitates a basic config file for registration with the Hub. The **HubDetails.xml** file includes some details unique to your deployment of Change Tracker Gen 7, hence it requires your intervention to make sure settings are as needed. The key tags within the file are as follows:

![HubDetails.xml Configuration](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJmo&d=%2Fa%2F4u000000LzSf%2F0rxXf5rbZCiDs2XKd2X0qRyEbnIIXCnHM4wg7vIwHMk&asPdf=false)

**Thumbprint** uniquely identifies the Web Server certificate; see more here [Thumbprint Documentation](https://msdn.microsoft.com/en-us/library/ms734695(v=vs.110).aspx).

> **NOTE:** An unencrypted password means the Agent didn't initialize and suggests a bad installation or .NET Framework issue – remember the Agent on Windows requires .NET Framework V3.5, Linux/Solaris requires the latest Netwrix Mono runtime.

> **IMPORTANT:** Netwrix Change Tracker's Gen 7 Agent also supports additional nodes – **NamePrefix**, **NameSuffix**.

#### Step 2. Add Thumbprint value

1. Open **IIS**
2. Select the server from the list on the left-hand side
3. Select **Server Certificates**
4. Double-click your certificate in the list to open the certificate permissions
5. Open the **Details** tab
6. Scroll to the bottom of the list and highlight the **Thumbprint** field
7. The thumbprint value will then be displayed. Transpose this to your **HubDetails.xml** file

#### Step 3. Check network connectivity

Check that there is network connectivity to the Hub URL from the Agent's host.

![Network Connectivity Check](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK01&d=%2Fa%2F4u000000LzSk%2FxwAOxkTh94.AuClhci0HEkbZmImNHlLGBGHL1qxNyDA&asPdf=false)

Finally, the Agent will maintain a rolling log of its activity.

- **Windows** - `C:\ProgramData\NNT\gen7agent.service\rolling-log.txt`
- **Linux** - `/var/nnt/gen7agent.service/rolling-log.txt`

This will also provide diagnostic information if the Agent doesn't work correctly.