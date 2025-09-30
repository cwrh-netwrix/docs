---
description: >-
  This article provides step-by-step instructions for installing the Netwrix Agent App on Solaris systems, including necessary downloads and configurations.
keywords:
  - Netwrix Agent
  - Solaris installation
  - Mono runtime
sidebar_label: Installing Netwrix Agent App for Solaris
tags: []
title: Installing Netwrix Agent App for Solaris (SPARC and Intel)
knowledge_article_id: kA04u0000000JQpCAM
products:
  - change-tracker
---

# Installing Netwrix Agent App for Solaris (SPARC and Intel)

## Overview

The Netwrix Change Tracker Enterprise Agent for Linux/Unix uses a Mono runtime instead of the Microsoft .NET framework used on Windows. Netwrix provides pre-built runtime file sets for Solaris hosts, which can be simply downloaded and unzipped on the target host, along with the Netwrix Agent App file set. Solaris will typically require the `libstdc++` package to be added. This can be acquired from the official Oracle website or from [OpenCSW](http://www.opencsw.org/).

## Instructions

### Step 1 – Downloads

Download the required files for your version of Solaris from the [Netwrix Members Area](http://www.newnettechnologies.com/members-area/member-2/cat_view/6-support-information-for-existing-customers/23-nnt-agent-app-nix-runtime-packages.html). This will almost certainly comprise a GC and Mono zip file. For example, Solaris 10 Intel requires the following:

- `gc-7.5-solaris-10-intel`
- Solaris 10 Intel Mono Runtime (Mono 3.2.3)
- The Netwrix Agent installation file set (`NNTAgent-1.0.0.xxx-yyy.zip`) can be downloaded from the [Members Area](http://www.newnettechnologies.com/members-area/member-2/doc_download/172-nnt-change-tracker-6-5-agent.html).

Copy the three zip files onto your host using `scp` or WinSCP. The files should be copied to the `/opt` directory.

### Step 2 – Extract Mono runtime to host

Extract the Mono runtime and GC zip files:

```bash
$ unzip gc-7.5-solaris-10-intel.zip
$ unzip mono-3.2.3-solaris-10-intel.zip
```

You should then have `/opt/mono` and `/opt/gc` directories in the root of `/opt`.

![Mono and GC directories](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK0p&d=%2Fa%2F4u000000LzTd%2F9od64NQxxT_IKKhF6HsLZROyJrXot9B6l52C6pyVfI0&asPdf=false)

![Extraction confirmation](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJrK&d=%2Fa%2F4u000000LzTA%2FD8M4LIDk6b0hufS2aDVODx3s3HfkQDktJcHlb.TspaM&asPdf=false)

### Step 3 - Install libstdc++

OpenCSW is used by Netwrix to ensure the correct libraries are present on the Solaris system, namely `libstdc++.so.6`. Install OpenCSW as follows:

![OpenCSW installation](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK0u&d=%2Fa%2F4u000000LzTi%2FZX_cY_0VwkAzb8MyTu_epd1pCOB51jXKw0NBI3FwGAg&asPdf=false)

### Step 4 – Extract Netwrix Agent App files to host

Extract the Netwrix Agent App files:

```bash
$ unzip NNTAgent-1.0.0.70.zip files/mono/ -d /opt/mono/nntagent
```

### Step 5 – Create HubDetails.xml file for the Netwrix Agent App

**Note:** Entries highlighted should be edited to reflect your settings.

```bash
$ cat /opt/mono/nntagent/files/mono/HubDetails.xml
```

```xml
true
https://192.168.1.141/api/
agent
passWord121
EOF
```

It is a good idea to add this `HubDetails.xml` to your Netwrix Agent App file set so that it will then be included for any future deployments to other hosts.

![HubDetails.xml example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK0z&d=%2Fa%2F4u000000LzTn%2FNoL9oFoxSbHQpgXV4BzJ1q.MGV6_LeoMuK3N.nu8Tiw&asPdf=false)

### Step 6 – Setup Path Information

**NOTE:** This should be achievable with one command as follows:

```bash
$ export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/mono/lib:/opt/gc/lib:/opt/csw/lib
```

The path `/opt/csw/lib` is present to provide the location of `libstdc++.so.6` as per step 2. Verify the path has been set correctly using:

```bash
$ set | grep LD_LIB
```

You should see:

```
LD_LIBRARY_PATH=:/opt/gc/lib:/opt/mono/lib:/opt/csw/lib
```

### Step 7 – Run Agent

From the Netwrix Agent program files path (`/opt/mono/nntagent/files/mono`):

```bash
$ cd /opt/mono/nntagent/files/mono
$ nohup /opt/mono/bin/mono NNTAgentApp.exe &
```