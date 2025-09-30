---
description: >-
  This article provides guidance on confirming the correct enablement of role services in Windows Server.
keywords:
  - Windows Server
  - role services
  - Change Tracker
sidebar_label: Windows Server Roles and Features
tags: []
title: Windows Server Roles and Features
knowledge_article_id: kA04u0000000JPrCAM
products:
  - change-tracker
---

# Windows Server Roles and Features

## Overview

Please refer to this material to confirm the correct enablement of role services.

![Role Services Confirmation](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJwT&d=%2Fa%2F4u000000LzP2%2FKAEzUPXb5fedRGvASdG6Hn2TEuxF0NoiEN7Ld_Mwvko&asPdf=false)

![IIS Features](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJwY&d=%2Fa%2F4u000000LzP7%2FIYigm5qXH90bAOiIVaxTtPyT0CPiTpbe0IeYo7xWd.Q&asPdf=false)

> **NOTE:** When installing **Change Tracker Gen 7** on **Windows Server 2008 R2**, some additional steps are required to update the .NET Framework version to 4.5, then enable **IIS Features**, ensuring that **ASP.NET** is an 'allowed' ISAPI extension.

![Change Tracker Agent](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJwd&d=%2Fa%2F4u000000LzPC%2FDoXCSLxI0heI7yxLjRKqWAk4SWACG8kHMX0zBJL6w9Q&asPdf=false)

Once the previous prerequisite conditions have all been met, you can run the installer – make sure that the **Run As Administrator** elevation is used.

The installer will automatically install the main application program, the various database and associated dependencies, and a local **Change Tracker Agent**. The Agent is pre-configured to automatically connect to the localhost and register with the **Change Tracker Gen 7** hub.