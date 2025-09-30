---
description: >-
  This article provides step-by-step instructions for installing the Netwrix Gen 7 Agent on Linux, including RPM and Debian installations, as well as uninstallation procedures.
keywords:
  - Gen 7 Agent
  - Linux installation
  - RPM
  - Debian
  - Mono
sidebar_label: Installing Gen 7 Agent for Linux
tags: []
title: Installing Gen 7 Agent for Linux
knowledge_article_id: kA04u0000000JQaCAM
products:
  - activity-monitor
---

# Installing Gen 7 Agent for Linux

## Overview

Netwrix Gen 7 Agent can also be installed on Linux and Unix platforms. In a similar way to the Windows Agent, the Agent requires a runtime and an Agent executable. For Linux, the runtime is Mono, the open-source parallel to Microsoft .NET. Installation simply requires the Netwrix-Mono and Netwrix-Gen7 Agent RPMs to be installed as follows:

```bash
rpm -ivh nnt-mono-4.6.1-5.x86_64.rpm nnt-changetracker-gen7agent-7.0.0.15-7.noarch.rpm
```

Once installed, the **HubDetails.xml** file must be configured. This can be done directly by editing a **HubDetails.xml** on the `/var/nnt/gen7agent.service` path or by using the `/opt/nnt/gen7agent/configure-gen7agent.sh` script.

![Gen 7 Agent Installation](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJzX&d=%2Fa%2F4u000000LzSB%2F6l5T5j.VGI9ZxU1tCc0sYaVblFy3p2VzyrvGv1oc2Pc&asPdf=false)

The Agent service can then be started using:

```bash
/sbin/service nntgen7agent start
```

## Scripted Installation of Gen 7 Agent RPM Installer

The entire process outlined above can be completed using a single command as follows:

```bash
rpm -ivh nnt-mono-4.6.1-5.x86_64.rpm nnt-changetracker-gen7agent-7.0.0.15-7.noarch.rpm ; /opt/nnt/gen7agent/configure-gen7agent.sh https://192.168.1.107/api agent passWord121 /opt/nnt/agent/bin GenVII ; /sbin/service nntgen7agent start
```

> **NOTE:** Removal can be done using:

```bash
rpm -evv nnt-mono-4.6.1-5.x86_64 nnt-changetracker-gen7agent-7.0.0.15-7.noarch
```

## For Debian Linux

Netwrix Change Tracker provides packages for Debian distributions, so please download the relevant Gen 7 Agent package then install using:

```bash
dpkg -i nnt-mono_4.2.1_amd64.deb

dpkg -i nnt-changetracker-gen7agent_7.0.0.19-34_all.deb
```

You can then use the same steps for configuring your **HubDetails.xml** file as in the previous section. To uninstall the Gen 7 Agent on Debian, use:

```bash
apt-get remove nnt-gen7agent

apt-get remove nnt-mono
```

You'll then want to remove the Netwrix Gen 7 Agent files which will be found at:

```bash
rm -fr /var/nnt/gen7agent.service

rm -fr /opt/nnt

rm -fr /opt/mono
```

## For Mac OSX

```bash
sudo installer -pkg MonoFramework-MDK-4.6.1.3.macos10.xamarin.universal.pkg -target /

sudo installer -pkg /tmp/nnt-gen7agent-7.0.0.19-34-x64.pkg -target /
```

To uninstall the Gen 7 Agent on MacOSX, use:

```bash
sudo pkgutil --forget MonoFramework-MDK-4.6.1.3.macos10.xamarin.universal.pkg

sudo pkgutil --forget nnt-gen7agent-7.0.0.19-34-x64.pkg
```

You'll then want to remove the Netwrix Gen 7 Agent files which will be found at:

```bash
rm -fr /var/nnt

rm -fr /opt/nnt

rm -fr /opt/mono
```

## Gen 7 Agent UI

A local UI for the Gen 7 Agent provides visibility of operation for troubleshooting purposes. It is available from the hosting platform, e.g., `http://localhost:8096`, and requires credentials of username **admin** and password **password**.

![Gen 7 Agent UI](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJzh&d=%2Fa%2F4u000000LzP3%2F.Hyz1eNsHIp7uKGOwibldkmnMrtQ5fBLisk4an9iBTk&asPdf=false)