---
description: >-
  This article provides a technical overview of NNT Change Tracker, a file integrity monitoring product used for compliance and change control in enterprise IT systems.
keywords:
  - file integrity monitoring
  - compliance
  - change control
  - IT security
  - NNT Change Tracker
sidebar_label: Technical Overview
tags: []
title: Technical Overview of NNT Change Tracker
knowledge_article_id: kA04u0000000JQBCA2
products:
  - change-tracker
---

# Technical Overview of NNT Change Tracker

## Overview

NNT Change Tracker is a file integrity monitoring product used for compliance programs, host intrusion detection, and change control for enterprise IT systems. It is utilized by enterprise IT organizations, including military, federal agencies, banks, financial services, airlines, retailers, utilities, and not-for-profit organizations around the world.

The product automates the collection of configuration data from various IT devices, including servers, desktops, database systems, firewalls, network routers, and switches, and stores a baseline for each device. Supported platforms include Windows, Linux, Unix, Oracle, and SQL Server. 

Configuration data collected is then analyzed for compliance with an organization's hardened build standard, typically based on a CIS Benchmark hardening checklist or one provided by a manufacturer such as Microsoft, Red Hat, Oracle, or Cisco. Compliance standards supported by Change Tracker include PCI DSS, DISA STIG, NERC CIP, ISO 27001, GLBA, FISMA, HIPAA HITECH, SOX, NIST 800-53, and GPG 13.

![NNT Change Tracker Overview](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJxM&d=%2Fa%2F4u000000LzPq%2FtPfjPbZSZ6bcBCCl.eg6do2.QwY7d7Kggabhyn390vs&asPdf=false)

Devices are monitored continuously using either a Change Tracker Agent installed directly onto the device or through a periodically scheduled agentless interaction with the device. Any changes recorded that deviate from the initial baseline are assessed for a match with Planned Changes configured in the Change Tracker system. Planned Change rules can be recorded directly from a device exhibiting changes, for example, when pre-staging patches, or from observed changes reported by Change Tracker. The makeup of a Planned Change comprises the range of devices to assess, time window, and details of the changes to match, such as a file change or registry value. Due to the nature and variety of patches, hundreds of Planned Change rules can be active at any one time.

This feature has been referred to as Closed-Loop, Intelligent Change Control due to its close alignment with COBIT or ITIL Change Control processes, whereby changes are pre-approved via a 'Request For Change' process and then reviewed for accuracy and quality via a QA Testing or Post-implementation review. Change Tracker automates this entire process by reviewing changes observed against predefined Planned Change rules or by retrospectively building new Planned Change Rules based on observed changes, hence the Closed-Loop terminology. 

Any changes recorded that are not matched by a Planned Change rule are reported as potentially breach activity. In this way, Change Tracker provides a Host Intrusion Detection System capability.

NNT products have been awarded Security Software Certification for CIS Benchmarks. NNT is also an official OVAL Adopter, utilizing OVAL vulnerability, inventory, and compliance content in either SCAP or XCCDF content.

NNT products have also received a series of Five Star reviews from SC Magazine.