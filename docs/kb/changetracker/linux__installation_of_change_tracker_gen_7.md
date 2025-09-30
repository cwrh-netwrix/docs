---
description: >-
  This article provides the system requirements for installing Change Tracker Gen 7 on a Linux environment.
keywords:
  - Change Tracker
  - Linux installation
  - system requirements
sidebar_label: Change Tracker Gen 7 Installation
tags: []
title: Linux Installation of Change Tracker Gen 7
knowledge_article_id: kA04u0000000JPwCAM
products:
  - change-tracker
---

# Linux Installation of Change Tracker Gen 7

## System Requirements

The following table outlines the recommended system requirements for installing Change Tracker Gen 7 on a Linux environment:

| SYSTEM ELEMENT                     | RECOMMENDED                                           |
|------------------------------------|------------------------------------------------------|
| **CPU**                            | Quad Core CPU or 4 vCores                            |
| **Memory**                         | 8GB                                                  |
| **Disk Free**                      | 500GB Minimum*                                       |
| **Operating System – 64bit Only** | CentOS/RHEL/OEL 6.6 64 bit                           |
| **Mono Framework**                 | Version 4.2x (Use either the Platform Manufacturer or Netwrix repository) |
| **Web Server**                     | NGINX Version 1.6 (Use Netwrix Repo/Netwrix RPM files) |
| **Database**                       | Mongo V3.x Main Store** (Use Netwrix Repo/Netwrix RPM files) |

*500GB Minimum based on limited trial implementations only. For production, we size based on an average of 4GB per device, per annum, based on typical change event and report volumes (4 Compliance Reports per month, 200 change events per month).

**Note:** A Redis database is also used for internal records; this will be installed as a dependency for the Netwrix HubService.