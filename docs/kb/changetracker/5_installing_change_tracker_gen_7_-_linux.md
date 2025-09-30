---
description: >-
  This article provides detailed instructions for installing Change Tracker Gen 7 on a Linux system, including system requirements and recommendations.
keywords:
  - Change Tracker Gen 7
  - Linux installation
  - system requirements
sidebar_label: Installing Change Tracker Gen 7 - Linux
tags: []
title: Installing Change Tracker Gen 7 on Linux
knowledge_article_id: kA04u0000000JQQCA2
products:
  - change-tracker
---

# Installing Change Tracker Gen 7 on Linux

## System Requirements

The following table outlines the recommended system requirements for installing Change Tracker Gen 7 on a Linux system:

| SYSTEM ELEMENT                     | RECOMMENDED                                      |
|------------------------------------|--------------------------------------------------|
| CPU                                | Quad Core CPU or 4 vCores                        |
| MEMORY                             | 8GB                                             |
| DISK FREE                          | 500GB Minimum*                                   |
| OPERATING SYSTEM – 64BIT ONLY     | CentOS/RHEL/OEL 6.6 64 bit                       |
| MONO FRAMEWORK                     | Version 4.2x (Use either the Platform Manufacturer or NNT repository) |
| WEB SERVER                         | NGINX Version 1.6 (Use NNT Repo/ NNT RPM files) |
| DATABASE                           | Mongo V3.x Main Store** (Use NNT Repo/ NNT RPM files) |

*500GB Minimum based on limited trial implementations only. For production, we size based on an average of 4GB per device, per annum, based on typical change event and report volumes (4 Compliance Reports per month, 200 change events per month).  
**(Note: A Redis database is also used for internal records; this will be installed as a dependency for the NNT HubService.)