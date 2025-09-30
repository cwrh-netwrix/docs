---
description: >-
  This article provides detailed instructions for installing the Gen 7 Agent for Windows, including prerequisites, installation methods, and configuration options.
keywords:
  - Gen 7 Agent
  - Windows installation
  - HubDetails.xml
sidebar_label: Installing Gen 7 Agent
tags: []
title: Installing Gen 7 Agent for Windows
knowledge_article_id: kA04u0000000JQVCA2
products:
  - activity-monitor
---

# Installing Gen 7 Agent for Windows

## Overview

Microsoft .NET Framework 4.5 is required for the installation of the Gen 7 Agent. You can enable this using 'Roles/Features' > 'Add Features' or download the official Microsoft installer from [Microsoft Download Center](https://www.microsoft.com/en-gb/download/details.aspx?id=30653).

![Gen 7 Agent Installation](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJxN&d=%2Fa%2F4u000000LzR8%2FICcG6Su194D.vbBVO1SLrX1Z4oFPW3UpxdkK2_n9T0c&asPdf=false)

## User-Attended Gen 7 Agent .exe Installer

The Hub API page must be entered together with Access Credentials. By default, the Agent username is `agent` with password `passWord121`, but these can be changed via User Settings.

![User-Attended Installer](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJyo&d=%2Fa%2F4u000000LzRD%2FvKc6nyiitZ66dR1LFNCSt.VxMS7RBZ8G_BwHhBQkjvY&asPdf=false)

By default, the Agent will register using the name of the server, but there is an opportunity to customize this during installation (or post-installation via an edit of the Hub Details file). During installation, this can also be performed using the Advanced Configuration stage of the .exe installation, and there is also an option to test agent connectivity (strongly recommended).

![Advanced Configuration](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJyt&d=%2Fa%2F4u000000LzRI%2Fwby6EBemecMDISD9J.YWwDHRtqOWLmpmUJ6DL996mIA&asPdf=false)

**IMPORTANT:** In order to maximize performance, Gen 7 Agent operational files are located in `%PROGRAMDATA%\NNT\gen7agent.service`. If you need to edit the `HubDetails.xml` file for the Agent, this is where the file can be found. Similarly, if you are ever required to provide a `rolling-log.txt` file to Netwrix Support, this is where it is located.

![Operational Files Location](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJvq&d=%2Fa%2F4u000000LzRN%2FuQL4UEqpGg_VgI5zoTcaxuXQV0U54GEZ0nlxjypLd.E&asPdf=false)

## Gen 7 Agent UI

A local UI for the Gen 7 Agent provides visibility of operation for troubleshooting purposes. It is available from the hosting platform, e.g., [http://localhost:8096](http://localhost:8096), and requires credentials of username `admin` and password `password`.

![Gen 7 Agent UI](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJtV&d=%2Fa%2F4u000000LzPw%2FHecRIt9Lqr4nJ6iN8M7nyUrxw.XRgU07ubDA03qmkdY&asPdf=false)

## Scripted/Command Line Use of Gen 7 Agent .exe Installer

By co-locating a pre-configured `HubDetails.xml` file in the same folder as the Gen 7 Agent installer, these details will be used by the installer for the installed agent. Use of the `/SP- /VERYSILENT /SUPPRESSMSGBOXES` switches will ensure the installation is silent and operates unattended. For example:

```plaintext
nnt-changetracker-gen7agent-7.0.0.15-68.exe /SP- /VERYSILENT /SUPPRESSMSGBOXES
```

Alternatively, a full command line installation can be used, with individual arguments used to specify HubDetails settings. For example:

```plaintext
C:\Users\Administrator\Downloads>nnt-changetracker-gen7agent-7.0.0.15-68.exe /UseNewHub=true /HUBURL=https://192.168.1.107/api /NamePrefix=GenVii- /HUBUSERNAME=agent /HUBPASSWORD=passWord121 /SP- /VERYSILENT /SUPPRESSMSGBOXES
```

Full details of `HubDetails.xml` nodes and their settings can be found here.