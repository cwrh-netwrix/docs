---
description: >-
  This article provides an overview of the NNT Change Tracker Gen 7 solution architecture, detailing its installation requirements and monitoring capabilities across various platforms.
keywords:
  - NNT Change Tracker
  - software solution
  - monitoring platforms
sidebar_label: Solution Architecture
tags: []
title: Solution Architecture of NNT Change Tracker Gen 7
knowledge_article_id: kA04u0000000JPcCAM
products:
  - change-tracker
---

# Solution Architecture of NNT Change Tracker Gen 7

## Overview

NNT Change Tracker Gen 7 is delivered as a 100% software solution. The central server component can be installed on either a Windows or Linux platform. A virtualized host is supported, but resources, and in particular disk I/O performance, are critical. See installation prerequisites in [Installing NNT Agent App for Windows](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA0Qk000000227NKAQ.html) or [Installing NNT Agent App for Linux](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000Is4CAE.html).

![NNT Change Tracker Architecture](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJmZ&d=%2Fa%2F4u000000LzOi%2FbAz62nv6hAno0uEhyYjZncpD9vLxbegsy5qV38GMPOY&asPdf=false)

Operating at a forensic level of detail, Change Tracker monitors all popular platforms and devices such as:

- Windows, all versions including XP, Windows 7, Windows 8, Windows 10, 2008R2, 2012R2, 2016
- Linux, all versions, including Ubuntu, SUSE, CentOS, RedHat, Oracle, Debian
- Apple MAC OS, all versions
- Unix, all versions including Solaris, HPUX, AIX
- Hyper-V and VMWare, all versions, including ESXi
- Database Systems, including Oracle, DB2, and SQL Server
- Network Devices and Appliances, all types and manufacturers, including routers, switches, and firewalls, from Cisco, Nortel, Juniper, and Checkpoint

## Instructions

Administration and everyday usage for reporting on the change history of a device and managing planned changes is all provided via the secure web interface. Integration options include alert propagation via syslog, SNMP trap, and email. For more advanced, two-way integration, Change Tracker provides a REST API.

- Windows Servers and Workstations are tracked using a locally installed active NNT Agent.
- Solaris, Ubuntu, SUSE Linux, RedHat, and CentOS hosts can also be tracked using an NNT Agent.
- Legacy Unix systems are monitored for File Integrity changes using scripted, agentless technology.
- Network devices, Unix, and Linux Servers are also tracked using an agentless, scripted interaction executed automatically from the Change Tracker server or using an NNT Proxy Agent function.
- Detailed Configuration Policy management for Servers and Workstations and Policy Compliance Reporting is performed via Change Tracker Gen7 Hub.