---
description: >-
  This article provides troubleshooting steps for resolving issues related to not receiving threat events in Netwrix Threat Manager.
keywords:
  - Netwrix Threat Manager
  - App Token
  - threat events
sidebar_label: Not Receiving Threat Events
tags: []
title: "Not Receiving Threat Events"
knowledge_article_id: kA0Qk0000001ZYPKA2
products:
  - activitymonitor
---

# Not Receiving Threat Events

## Symptom

Netwrix Threat Manager (formerly StealthDEFEND) does not appear to be gathering threat events.

## Cause

The App Token within Threat Manager is no longer valid or is not working between the required application servers.

## Resolution

To resolve this issue, you must generate a new App Token in Threat Manager and update it in the sending application servers.

1. Generate a new **App Token** in Netwrix Threat Manager:
   1. In Threat Manager v2.8, go to **Administration** > **Configuration Menu** > **Integrations Interface** > **App Tokens** page.
   2. Follow the steps in the [Generate an App Token](/docs/threatmanager/3.0/administration/configuration/integrations/apptoken) guide to create a new token.
   ![App Tokens page in Netwrix Threat Manager showing token details](https://helpcenter-be.netwrix.com/bundle/ThreatManager_2.8/page/Content/Resources/Images/ThreatManager/Admin/Configuration/Integrations/AppTokens/Details.png?_LANG=enus)

2. Update the new **App Token** in the sending application servers:
   - **Netwrix Activity Monitor** (formerly Stealthbits Activity Monitor) v7.1:
     1. Go to the **Administration** > **Output Types** > **Threat Manager** tab.
     2. Enter the new **App Token** as described in the [Threat Manager Tab](/docs/activitymonitor/8.0/admin/outputs/threatmanager) documentation.
     ![Threat Manager tab in Netwrix Activity Monitor Output Types](./images/servlet_image_07420143fdc8.png)

   - **Netwrix Activity Monitor File System (UDP)**:
     - No App Token is needed for UDP output. For configuration, see [Syslog output](/docs/activitymonitor/8.0/admin/outputs/syslog/syslog).

     ![Syslog output configuration in Netwrix Activity Monitor](./images/servlet_image_07420143fdc8.png)

   - **Netwrix Threat Prevention** (formerly StealthINTERCEPT) v7.4:
     1. Go to the **Administration** > **Netwrix Threat Manager Configuration Window** > **Event Sink** tab.
     2. Enter the new **App Token** as described in the [Event Sink Tab](/docs/threatprevention/7.5/admin/configuration/threatmanagerconfiguration) documentation.
     <!-- Event Sink tab in Netwrix Threat Prevention Threat Manager Configuration window -->

> **IMPORTANT:** Because Threat Manager receives data from the following applications, verify that each is functioning properly after updating the App Token:
> - Netwrix Activity Monitor: For more information, see [Output for Monitored Hosts](/docs/activitymonitor/8.0/admin/monitoredhosts/output/output).
> - Netwrix Threat Prevention Server (SI): For more information, see [Agents](/docs/threatprevention/7.5/admin/agents/overview).

## Related Links

- [Generate an App Token in Netwrix Threat Manager 3.0](/docs/threatmanager/3.0/administration/configuration/integrations/apptoken)
- [Threat Manager Tab in Netwrix Activity Monitor 7.1](/docs/activitymonitor/8.0/admin/outputs/threatmanager)
- [Syslog Output in Netwrix Activity Monitor 7.1](/docs/activitymonitor/8.0/admin/outputs/syslog/syslog)
- [Event Sink Tab in Netwrix Threat Prevention 7.4](/docs/threatprevention/7.5/admin/configuration/threatmanagerconfiguration)
- [Output for Monitored Hosts in Netwrix Activity Monitor 7.1](/docs/activitymonitor/8.0/admin/monitoredhosts/output/output)
- [Agents in Netwrix Threat Prevention 7.4](/docs/threatprevention/7.5/admin/agents/overview)