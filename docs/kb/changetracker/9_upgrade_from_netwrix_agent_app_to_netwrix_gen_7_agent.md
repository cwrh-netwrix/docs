---
description: >-
  This article provides a step-by-step guide for upgrading from the Netwrix Agent App to the Netwrix Gen 7 Agent, including necessary preparations and installation instructions.
keywords:
  - Netwrix Agent App
  - Gen 7 Agent
  - software upgrade
sidebar_label: Upgrade from Agent App to Gen 7 Agent
tags: []
title: Upgrade from Netwrix Agent App to Netwrix Gen 7 Agent
knowledge_article_id: kA04u0000000JQkCAM
products:
  - activity-monitor
---

# Upgrade from Netwrix Agent App to Netwrix Gen 7 Agent

If you are currently using a Netwrix Agent App (Version 1.0.0.x) and wish to upgrade to the Gen 7 Agent, the procedure is straightforward. However, as with any software upgrade, there may be additional steps required depending on your individual circumstances. The high-level overview is as follows:

1. Stop the Agent App service (you may choose to uninstall the program at this stage).
2. Run the installer for the Gen 7 Agent to install.
3. Hub details, Agent username, and password are required.
4. A thumbprint may be required if using a private certificate on your Hub server.

> **IMPORTANT:** Do not set either a Nameprefix or Namesuffix for the Agent name. If the Gen 7 Agent registers with the same Host Name as the Agent App, the Gen 7 Agent will assume the identity of the Agent App, ensuring event and report continuity.

Once the Gen 7 Agent is operational, you can then remove the Agent App (if you didn't already do this in step 1).

## Step 1 – Stop the Netwrix Agent App Service

**Windows:** Either use the MS Services Console (Run → `services.msc`) or use Command Line as Administrator:

```plaintext
sc stop NNTAgentService
```

**Linux:** Use the following command:

```plaintext
service nntagent stop
```

![Stopping the Netwrix Agent App Service](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK0L&d=%2Fa%2F4u000000LzT9%2Fr92J4wXtBDJodAmz5W0p83mO9X9fvdax0Ats5yb6ETU&asPdf=false)

## Step 2 – Install Netwrix Gen 7 Agent

**Windows:** See [Installing Gen 7 Agent for Windows](#).

**Linux:** See [Installing Gen 7 Agent for Linux](#).

## Step 3 – Uninstall Old Netwrix Agent App

**Windows:** Using `NNTAgent.exe` from the command line:

```plaintext
C:\Windows\system32>"C:\ProgramData\{2443C4AA-A2DC-4926-9D6B-2D3D8AAE6006}\NNTAgent.exe" /s MODIFY=FALSE REMOVE=TRUE UNINSTALL=YES
```

**Linux:** From the terminal, use the following commands:

```plaintext
rpm -ev nnt-mono nnt-agent
```

For Debian, from the terminal:

```plaintext
apt-get remove nnt-agent
apt-get remove nnt-mono
```

You will then want to remove the Netwrix Gen 7 Agent files, which can be found at:

```plaintext
rm -fr /opt/nnt
rm -fr /opt/mono
```

## MAC OSX – From Terminal

Use the following commands:

```plaintext
sudo pkgutil --forget MonoFramework-MDK-4.6.1.3.macos10.xamarin.universal.pkg
sudo pkgutil --forget nnt-gen7agent-7.0.0.19-34-x64.pkg
```

You will then want to remove the Netwrix Gen 7 Agent files, which can be found at:

```plaintext
rm -fr /var/nnt
rm -fr /opt/nnt
rm -fr /opt/mono
```

Finally, please contact Netwrix Support if you need help at any stage.