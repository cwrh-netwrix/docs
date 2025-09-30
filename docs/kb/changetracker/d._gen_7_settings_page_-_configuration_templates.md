---
description: >-
  This article provides guidance on editing and managing configuration policy templates in Change Tracker Gen 7, including creating and editing monitoring policies.
keywords:
  - configuration templates
  - Change Tracker Gen 7
  - monitoring policies
sidebar_label: Gen 7 Configuration Templates
tags: []
title: Gen 7 Settings Page - Configuration Templates
knowledge_article_id: kA04u0000000JSWCA2
products:
  - activity-monitor
---

# Gen 7 Settings Page - Configuration Templates

## Overview

Edit and upload/download configuration policy templates – the default templates provided with Change Tracker Gen 7 are already aligned to default Device Groups, but this association can be changed together with the make-up of the Configuration Monitoring policy.

> **NOTE:** Always click the **Save Changes** button after any edit.

## Instructions

1. To configure additional File/Folder/Registry Match Pattern definitions, click on the **Show Advanced Options** button.
2. To gather a Process and/or Services list from a donor device, use the **Show Advanced Options** and select a device.

![Configuration Monitoring Policy Template](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK9D&d=%2Fa%2F4u000000LzcG%2Fwa7wDLrtnFoTk8DV4AZT2_7lgh.OxFHFwVyX52SwPU0&asPdf=false)

### Create/Edit a Configuration Monitoring Policy

To create a new Configuration Monitoring Template, either upload a pre-defined template file provided by Netwrix, or click **+ Add a Template**.

To edit a template, just click on the **Edit** button alongside the template name.

A Configuration Monitoring Policy template comprises a wide range of attributes that can be monitored including Files/Folders and File Contents, Registry Keys/Values, Installed Software and Updates, Processes and Services (Running and Startup states), Security and Audit Policy* and Local User Accounts* (*Windows platforms only*).

One of the key strengths of Change Tracker Gen 7 is that even the configuration of complex FIM policies is straightforward. Templates for all standard platforms are provided, based on trusted guidance from the Center for Internet Security.

When a custom policy is needed, for example, to protect the integrity of a bespoke application, setup is easy too. Paths and files to track are specified along with details of the file/folder-match specification to use – these can be pre-defined and just picked off from a drop-down menu so there is no need to always be working out commands to use and any regular expressions needed to target the tracking.

Similarly, there is a simple way to define exclusions, again with or without using a file/folder-match specification. This same approach is extended to Registry tracking so that precisely the keys and values that need to be tracked are.

This results in a precision, tailor-made monitoring policy to only track changes where required, eliminating spurious changes and unwanted ‘change noise’.