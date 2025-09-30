---
description: >-
  This article provides step-by-step instructions on how to monitor legacy systems using the Change Tracker Express Agent, including installation and configuration details.
keywords:
  - Change Tracker Express Agent
  - legacy systems monitoring
  - file integrity changes
sidebar_label: Monitor Legacy Systems
tags: []
title: How to Monitor Legacy Systems with the Change Tracker Express Agent
knowledge_article_id: kA04u0000000JVbCAM
products:
  - change-tracker
---

# How to Monitor Legacy Systems with the Change Tracker Express Agent

## Overview

Do you have legacy systems (AIX, Solaris, etc.) that you need to monitor for file integrity changes? Do you need to be notified of changes in real time? Do you need to know which user made the change? Then the **Change Tracker Express Agent** is for you! Review the guide below for information on how to install the agent and configure it to register with a Change Tracker server. The example below was captured on an AIX server.

Unlike our normal Change Tracker Gen 7 agent, which requires either .NET (for Windows) or Mono (for Linux), the Express Agent is intended to be a lightweight agent that can be built and deployed to more legacy platforms where it is only possible to compile C/C++ code.

The Express Agent is available as an RPM for easy installation onto something like an AIX server. The RPMs can be found in the Members Download area on the NNT website. If you require assistance locating the correct installers, please contact the NNT Support team.

## Instructions

Once the RPM files have been downloaded, copy it onto the endpoint that you would like to monitor.

Installation of the RPM can be done using the `rpm -ivh` command (example below):

```bash
bash-4.2# rpm -ivh nnt-changetracker-expressagent-2.0.1.2-38.ppc.rpm
```

Once the RPM is installed, you can configure the agent to register with a Change Tracker server using a shell script that NNT provides as part of the agent installation:

```
=================================================================================
Express Agent install complete.
Now run /opt/nnt/expressagent/configure-expressagent.sh to complete installation.
=================================================================================
```

The agent will be installed into the `/opt/nnt/expressagent` directory with `HubDetails.xml`, log files, and databases written to the `/var/nnt/expressagent` directory:

```bash
bash-4.2# ./configure-expressagent.sh
Welcome to the NNT ChangeTracker Express Agent Configuration script
Hub URL [https://localhost/api/] : https://192.168.1.1/api/
Agent username [agent] : agent
Agent password : passWord121
Agent config path [/var/nnt/expressagent] : /var/nnt/expressagent
```

The Express Agent will be configured with the following settings:

```
==================================================================
The Express Agent will be configured with the following settings :
Hub URL : https://192.168.1.1/api/
Agent user : agent
Agent password : 
Config path : /var/nnt/expressagent
==================================================================
```

![Express Agent Configuration](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK2i&d=%2Fa%2F4u000000LzgG%2FDy61fJ76UiA4cEt8rKQnOzvwczZ8VGnKzgegvDrJLI0&asPdf=false)

Once the agent has been installed, the status of the service can be checked by running the following command:

```bash
# ps -def | grep express
```

The `configure-expressagent.sh` script will start the agent; however, if you need to start or stop the service manually, you can run the service scripts directly:

```bash
# /etc/rc.d/rc2.d/Snntexpressagent.sh start
```

or

```bash
# /etc/rc.d/rc2.d/Knntexpressagent.sh stop
```

![Service Scripts](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKLP&d=%2Fa%2F4u000000Lzvt%2FjEfx1ZzQneu4n3kqsiUH6MPRQKJXcu.Upje3jhI3biM&asPdf=false)

In order for the Change Tracker Express Agent to function correctly, the following libraries will need to be in place on the system:

**./expressAgent needs:**

- `/usr/lib/libc.a(shr.o)`
- `/usr/lib/libpthread.a(shr_xpg5.o)`
- `/opt/nnt/expressagent/libcrypto.a(libcrypto.so.1.0.2)`
- `/usr/lib/libpthread.a(shr_comm.o)`
- `/opt/nnt/expressagent/libssl.a(libssl.so.1.0.2)`
- `/unix`
- `/usr/lib/libcrypt.a(shr.o)`
- `/usr/lib/libpthreads.a(shr_comm.o)`
- `/usr/lib/libc.a(shr_64.o)`
- `/usr/lib/libpthreads.a(shr_xpg5_64.o)`
- `/usr/lib/libcrypt.a(shr_64.o)`

![Required Libraries](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKH5&d=%2Fa%2F4u000000Lzl2%2Fgb.M544nevIhJdwTSgiFwZwVvsWlkwHQTF374AsT7OE&asPdf=false)

If you require any further information on the Express Agent or assistance with installing it, please open a support ticket on **Jira** or email **support@nntws.com**.