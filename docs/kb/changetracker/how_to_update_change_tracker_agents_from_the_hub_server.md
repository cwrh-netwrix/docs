---
description: >-
  This article provides a step-by-step guide on how to update Change Tracker agents from the Hub server, including uploading updates and assigning them to the correct groups.
keywords:
  - Change Tracker
  - agent updates
  - Hub server
sidebar_label: Update Change Tracker Agents
tags: []
title: How to Update Change Tracker Agents from the Hub Server
knowledge_article_id: kA04u0000000JWFCA2
products:
  - activity-monitor
---

# How to Update Change Tracker Agents from the Hub Server

## Overview

Change Tracker has an Auto Update process for Windows-based agents. This process is initiated from the Hub server. The following steps will show you how to upload an update to your Change Tracker Server for agents to be updated.

## Instructions

1. On our website, download the agent zip file and the agent updater zip file. Move both the Agent and Agent updater zip files to the same directory.

   ![Download agent and updater zip files](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK2P&d=%2Fa%2F4u000000Lzmp%2F.76wbIYHPjfSsW2joKqkIV_2wZ6g0POTJ4Xqn7HMzKw&asPdf=false)

   ![Agent updater zip file](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKHg&d=%2Fa%2F4u000000Lzmu%2FJEO.PIJZEgP9vpOvP..W.oKsI4Ngwh2MZB70HGtH508&asPdf=false)

2. Once you have downloaded the two files and moved them to the same directory, log into your Change Tracker console and go to the **Settings** tile.

   ![Settings tile](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK9i&d=%2Fa%2F4u000000Lzhc%2F5pJxDjMBHx5NSTNoXs4p48IUXIWSekN3zrj9G.sfz1k&asPdf=false)

3. On the left, look for the **Agent Updates** navigation button. Click on that. On the agent updates screen, click on **Upload an Update**. Select both the updater file and the matching agent version, and click **Open**.

   ![Upload an update](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK42&d=%2Fa%2F4u000000Lzmz%2FDZ0x3Agc2rh_Jo.LuC1Ud3MM3VhhQPpsEjh649pukJQ&asPdf=false)

4. The agent files will upload. Click on the **Upload Files** button, and they will appear in the list.

   ![Uploaded files list](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKHl&d=%2Fa%2F4u000000Lzn4%2FIxbPX1m4CzEU77MrbxLO9ZCuXSp6w532eV6vj2A_ht8&asPdf=false)

   After this, the agents are ready to be assigned to the proper group to receive the updates. Follow the steps below to assign them to the proper group.

## Assigning Updates to Groups

1. On the **Settings** tile, select the **Groups** button. Select the group that the agent update needs to be assigned to (it will be highlighted in blue when selected) and click on the **Agent Software Updates** tab. From here, you can set the update schedule by pressing the **Define the update schedule** button.

   ![Define update schedule](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKHq&d=%2Fa%2F4u000000LziU%2FUtxLIxJSAdMC_xm4MENhCnO1o1sBbZbBiaMfW3wTB8U&asPdf=false)

2. Define an update schedule that is to your liking, and select the agent package from the dropdown. After clicking **Update**, your schedule will take effect immediately.

   ![Update schedule](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKHv&d=%2Fa%2F4u000000Lzn9%2F_1yH60.vjIMuX2cZFJxnW1pRRGEU2sHysN74dlIt6kY&asPdf=false)

   The next time the agents phone into the console within the update schedule you have defined, they will receive the update package and attempt to upgrade to that version.

## Related Articles

- [How to Backup / Restore / Move your MongoDB Database](https://kb.netwrix.com/8150)
- [How to move your Linux Server MongoDB Database to a Windows server?](https://kb.netwrix.com/8283)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://kb.netwrix.com/8164)
- [How to Change the Admin Password of your Mongo Database](https://kb.netwrix.com/8310)

**Attachments:**
- [image2017-7-6_17-27-50.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJrt&d=%2Fa%2F4u000000LzSn%2F36iqDO6zTj8g5SkA9ezj43hVmiRmfwlkLDHwVUa6KbE&asPdf=false)
- [image2017-7-6_17-24-56.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKG5&d=%2Fa%2F4u000000LznT%2FP5Xf2VEe5zSPUhSUJ2PzYbnUcmtqI.abC0j2mqgb2dI&asPdf=false)
- [image2017-7-6_17-17-41.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKGe&d=%2Fa%2F4u000000LzjD%2FEmDyd9orpwHPJwgwdt0dw_J.hPcU4waNIdFzXjG2Tlo&asPdf=false)
- [image2017-7-6_17-14-12.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJue&d=%2Fa%2F4u000000LzjI%2FErv9g_OqgCTda5pLegXTxsErCLcjrKDLbdY36mhII0o&asPdf=false)
- [image2017-7-6_17-6-49.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKD6&d=%2Fa%2F4u000000LznY%2F8B270dMqmWL4bD4V6dyjoKuXWExDm9JvherciqnNQjQ&asPdf=false)
- [image2017-7-6_17-2-20.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJs3&d=%2Fa%2F4u000000LzbT%2FYo3.yiQbx6_Uu9qvgtijh0gpIqQUNq50IknziYQwgRE&asPdf=false)