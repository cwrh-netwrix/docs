---
description: >-
  This article explains how to configure Agentless devices with Configuration Templates, similar to Agent-based devices, and how to manage tracked configuration items.
keywords:
  - Agentless monitoring
  - Configuration Templates
  - Tracked configuration items
sidebar_label: Agentless Configuration Integrity Monitoring
tags: []
title: Agentless Configuration Integrity Monitoring
knowledge_article_id: kA04u0000000JUXCA2
products:
  - activity-monitor
---

# Agentless Configuration Integrity Monitoring

## Overview

In the same way as an Agent-based device can have a Configuration Template assigned via an inherited Group property, so too can an Agentless device. Configuration templates for Agentless monitoring can be built in the same way as Agent-based templates and then assigned to a Group. Any Agentless Device associated with this Group will then inherit the configuration template.

![Configuration Template Example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJyC&d=%2Fa%2F4u000000LzPy%2FVS_jCJqqbsMPm.ztTho2labyWi.HAleWvNpQHSVrjtw&asPdf=false)

Tracked configuration items such as files or command outputs can be included within the Template, and the detail can be reviewed either directly from the Configuration Template editor page or from the [Device Page → Show Tracked Items](https://kb.netwrix.com/8113). Trackers are typically run automatically according to the polling schedule defined; you can run an immediate update for any tracker for testing or troubleshooting purposes. See the Change Tracker Gen 7 Admin Guide for more information.

**Attachments:**

- [image2017-6-2_15-56-8.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJud&d=%2Fa%2F4u000000Lzid%2Fu60wMCkbo3CRtj85ErE9YipkgjUPdIO5VsXgbAzZqPo&asPdf=false)