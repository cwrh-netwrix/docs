---
description: >-
  This article provides detailed instructions for installing the Gen 7 Agent on both Windows and Linux platforms, including user-attended and scripted installation methods.
keywords:
  - Gen 7 Agent
  - installation
  - Windows
  - Linux
  - troubleshooting
sidebar_label: Gen 7 Agent Deployment Options
tags: []
title: GEN 7 Agent Deployment Options
knowledge_article_id: kA04u0000000JSTCA2
products:
  - activity-monitor
---

# GEN 7 Agent Deployment Options

## Installing Gen 7 Agent for Windows

**Note:** Microsoft .NET Framework 4.5 is required – enable this using **Roles/Features** > **Add Features** or [download the official Microsoft installer](https://www.microsoft.com/en-gb/download/details.aspx?id=30653).

![Gen 7 Agent Installation](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJzs&d=%2Fa%2F4u000000Lzpf%2Fq6GXKCy66tI5GzR2qjRC9ERtU2s6IBIa8Y1AT4BjvBQ&asPdf=false)

### User-Attended Gen 7 Agent .exe Installer

The Hub API page must be entered together with access credentials. By default, the Agent username is `agent` with password `passWord121`, but these can be changed via **User Settings**.

![Gen 7 Agent User-Attended Installer](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJzs&d=%2Fa%2F4u000000Lzpf%2Fq6GXKCy66tI5GzR2qjRC9ERtU2s6IBIa8Y1AT4BjvBQ&asPdf=false)

By default, the Agent will register using the name of the server, but there is an opportunity to customize this during installation (or post-installation via an edit of the [Hub Details file](#_Check_Agent_Operation) – see more here).

During installation, this can also be performed using the **Advanced Configuration** stage of the .exe installation, and there is also an option to test agent connectivity (strongly recommended).

> **IMPORTANT:** In order to maximize performance, Gen 7 Agent operational files are located in `%PROGRAMDATA%\NNT\gen7agent.service`. If you need to [edit the HubDetails.xml file](#_Check_Agent_Operation) for the Agent, this is where the file can be found. Similarly, if you are ever required to provide a `rolling-log.txt` file to Netwrix Support, this is where it is located.

![Gen 7 Agent Important Files](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKBC&d=%2Fa%2F4u000000LzXZ%2FPMntE8vK2z8OLlAPpvC.RD.KDdAWCvi70fGSnARKj0U&asPdf=false)

### Gen 7 Agent UI

A local UI for the Gen 7 Agent provides visibility of operation for troubleshooting purposes. It is available from the hosting platform, e.g., [http://localhost:8096](http://localhost:8096), and requires credentials of username `admin` and password `password`.

![Gen 7 Agent UI](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKKM&d=%2Fa%2F4u000000Lzqc%2FZakQG8OdHrtuIqb._Yd9Q9CLVPeeCubmdymDxiW3DZU&asPdf=false)

### Scripted/Command Line Use of Gen 7 Agent .exe Installer

By co-locating a pre-configured `HubDetails.xml` file in the same folder as the Gen 7 Agent installer, these details will be used by the installer for the installed agent.

Use of the `/SP- /VERYSILENT /SUPPRESSMSGBOXES` switches will ensure the installation is silent and operates unattended.

![Gen 7 Agent Command Line Installation](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJta&d=%2Fa%2F4u000000Lzqh%2F4hZsvcN6eBo4UfabxXbTviE6F990SC986KnM3CuzEHc&asPdf=false)

Alternatively, a full command line installation can be used, with individual arguments used to specify HubDetails settings.

For example:

![Gen 7 Agent Command Line Example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKC0&d=%2Fa%2F4u000000LzqO%2Fu_dG3YuyUcgMRLzfZAL8_OKGZEqkCYxB5JARm6SmHs8&asPdf=false)

[Full details of HubDetails.xml nodes and their settings can be found here](#).

## Installing Gen 7 Agent for Linux

### Using Local RPM Files

Netwrix Gen 7 Agent can also be installed on Linux and Unix platforms. In a similar way to the Windows Agent, the Agent requires a runtime and an Agent executable. For Linux, the runtime is Mono, the open-source parallel to Microsoft .NET.

Installation simply requires the Netwrix-Mono and Netwrix-Gen7 Agent RPMs to be installed as follows:

![Gen 7 Agent Linux Installation](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJoN&d=%2Fa%2F4u000000Lzqm%2Fkb5lKrR7dT97tjLjVaq..0OUQSbHHqwfGe8Ae559S5s&asPdf=false)

Once installed, the `HubDetails.xml` file must be configured – this can be done directly by editing a `HubDetails.xml` on the `/var/nnt/gen7agent.service` path or by using the `/opt/nnt/gen7agent/configure-gen7agent.sh` script.

![Gen 7 Agent Configuration](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK7c&d=%2Fa%2F4u000000LzRe%2FqYq.svlEHnJrAgbyl_ibS71z6nKyc4Pjac76ZbmRlPo&asPdf=false)

The Agent service can then be started using:

![Gen 7 Agent Start Service](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKIL&d=%2Fa%2F4u000000LzV4%2F9dfNHPQeTTtxhGZSJxsxoxfZ_cfecXVQtb2aiUiF5d8&asPdf=false)

### Scripted Installation of Gen 7 Agent RPM Installer

The entire process outlined above can be completed using a single command as follows:

![Gen 7 Agent Scripted Installation](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKLE&d=%2Fa%2F4u000000Lzh0%2FlS98a4UbzWxCHgEWaKwDSl81TNCcTV0ovSAPEuZFFJ8&asPdf=false)

> **Note:** Removal: `rpm -evv nnt-mono-4.6.1-5.x86_64 nnt-changetracker-gen7agent-7.0.0.15-7.noarch`

### For Debian Linux

Netwrix provides packages for Debian distributions, so please download the relevant Gen 7 Agent package and then install using:

![Gen 7 Agent Debian Installation](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKAh&d=%2Fa%2F4u000000Lzal%2F62991j1y.IaE1KE16V8dCWS9UCiYEF4dLF7b.P.B1og&asPdf=false)

You can then use the same steps for [configuring your HubDetails.xml file as in the previous section](#).

> **Note:** To uninstall the Gen 7 Agent on Debian, use:

![Gen 7 Agent Uninstall](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJy6&d=%2Fa%2F4u000000Lzhd%2FzlhZbdYUS_em3DlsWkANZtV3BXI8.3KFCKdGvYBa9VQ&asPdf=false)

You’ll then want to remove the Netwrix Gen 7 Agent files, which will be found at:

![Gen 7 Agent Files Location](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKLJ&d=%2Fa%2F4u000000LzPz%2Fhvffk5ODTuqFR9W87y8ABj.EJ56e0brKkF6hGwnEE6U&asPdf=false)

### Gen 7 Agent UI

A local UI for the Gen 7 Agent provides visibility of operation for troubleshooting purposes. It is available from the hosting platform, e.g., [http://localhost:8096](http://localhost:8096), and requires credentials of username `admin` and password `password`.

![Gen 7 Agent UI](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKLO&d=%2Fa%2F4u000000Lzqr%2FhnxhDYRpOQsy5r2e5FOZu8.1I625q_vDiInnLvmyRQI&asPdf=false)

## Troubleshooting Connectivity

### Check Agent Operation

For any agent on any platform, there is a local agent status interface which can be viewed via the local web browser at [http://localhost:8096](http://localhost:8096).

If the Agent UI is not available, then it is likely that the agent service is stopped or has failed.

- **Windows:** Check **Task Manager** and **Services Console**.
- **Linux:** `service nntGen7agent status`.

The below shows that the agent service is running correctly but it has been unable to register with the Change Tracker Hub.

The Agent should report the URL for the Hub it is registered as in the green pop-out boxes.

![Agent Status](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKLT&d=%2Fa%2F4u000000LzX3%2FBxUUYL2l_qKUbGzcmWXKNqd3vasr7KNVA2XUxF6JoHk&asPdf=false)

If the Hub URL referenced is not correct, you can edit the `HubDetails.xml` file and correct this. Likewise, the Agent username and password settings can be reset by editing this file.

- **Windows:** `C:\ProgramData\NNT\gen7agent.service\HubDetails.xml`
- **Linux:** `/var/nnt/gen7agent.service/HubDetails.xml`

## The HubDetails.xml File

The Agent configuration settings are controlled by the Hub during operations, but the initial registration necessitates a basic config file for registration with the Hub.

The `HubDetails.xml` file includes some details unique to your deployment of Change Tracker Gen 7, hence it requiring your intervention to make sure settings are as needed.

![HubDetails.xml Structure](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKLY&d=%2Fa%2F4u000000LzWk%2FNCPf5ZuxRDfCES7PcRm0ISKD0gcYwE5YkdtTQP.pyCA&asPdf=false)

> **Note:** An unencrypted password means the Agent didn’t initialize and suggests a bad installation or .NET Framework issue – remember the Agent on Windows requires .NET Framework V3.5, Linux/Solaris requires the latest Netwrix Mono runtime.

> **Note:** Netwrix’s Gen 7 Agent also supports additional nodes – `NamePrefix`, `NameSuffix`.

The Thumbprint uniquely identifies the Web Server certificate; see more [here](https://msdn.microsoft.com/en-us/library/ms734695(v=vs.110).aspx).

1. Open **IIS**.
2. Select the server from the list on the left-hand side.
3. Select **Server Certificates**.
4. Double-click your certificate in the list to open the certificate's permissions.
5. Open the **Details** tab.
6. Scroll to the bottom of the list and highlight the **Thumbprint** field.
7. The thumbprint value will then be displayed – transpose this to your `HubDetails.xml` file.

The next step is to check that there is network connectivity to the Hub URL from the Agent’s host.

> **NOTE:** Where the Change Tracker Hub has been installed on a Windows/IIS platform, then the Hub URL will be [https://192.168.1.36](https://192.168.1.36).

## Finally, the Agent will Maintain a Rolling Log of Its Activity

- **Windows:** `C:\ProgramData\NNT\gen7agent.service\rolling-log.txt`
- **Linux:** `/var/nnt/gen7agent.service/rolling-log.txt`

This will also provide diagnostic information if the agent is not functioning correctly.

## Finally – Please Contact Support if You Need Help at Any Stage