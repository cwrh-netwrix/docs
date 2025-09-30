---
description: >-
  This article provides step-by-step instructions on how to create an installed software baseline report using Netwrix Change Tracker.
keywords:
  - installed software
  - baseline report
  - Netwrix Change Tracker
sidebar_label: Create Installed Software Baseline Report
tags: []
title: How to Create an Installed Software Baseline Report
knowledge_article_id: kA04u0000000JXRCA2
products:
  - change-tracker
---

# How to Create an Installed Software Baseline Report

## Overview

If you have a system in your environment that represents the gold standard of required installed software, you can use **Netwrix Change Tracker** to build a report that checks if other systems match the gold standard machine. The approach in the steps below isolates the gold standard machine within its own groups and with its own templates applied. This ensures that we gather information from the gold standard system without impacting the templates applied to the wider production environment.

## Instructions

### Step 1 - Create a Template

Identify the system to be used for the gold standard baseline report and confirm that this system is registered with **Change Tracker**. Use the **Device** tile to find the template that is applied to the system, as we are going to make a copy of this template, **CIS Win 8 L1 Base** in this example.

![Template Selection](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK6C&d=%2Fa%2F4u000000Lzrp%2FrS8tuveofeVygSlaTrmBR6ioX3xLuRKQGD5tqN8kLaw&asPdf=false)

While logged on with an admin account, navigate to **Settings > Configuration Template**.

Find the template that is applied to the system. In the example below, I will be reviewing a Windows 8 system and have located the template, **CIS Win 8 L1 Base**.

![CIS Win 8 L1 Base Template](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKGZ&d=%2Fa%2F4u000000LzkB%2FWAhnnWq7LSrhix0k2vKpDG9VI0NPip7UYvniP6D8QbQ&asPdf=false)

Press the **Copy Config** button and provide the template with a suitable name. I have called my template **CIS Win 8 L1 Base Gold Standard**.

### Step 2 - Turn on Baselining

Within the created gold standard template, configure the template to collect the baseline information that will be used to build the report. To do this, edit your template and on the **Installed Software and Updates** tab, click the **Send baseline events** checkbox and the **Save Changes** button.

![Turn on Baselining](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKMg&d=%2Fa%2F4u000000Lzru%2FFVemYR6EXd4dbx8Kj2vvW8sgB0tCKarhgXiu3exulfo&asPdf=false)

### Step 3 - Create a Group Structure

Still logged in with the admin account, navigate to **Settings > Groups** and create a group for your gold standard systems. In the example below, I have created a group for a Windows 8 system.

![Create Group Structure](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKHX&d=%2Fa%2F4u000000LzMb%2F.w7hBa3OeB1owarS1Fntqibhg60MZPsHyCT6LbwY61Y&asPdf=false)

With the group created, navigate to the **Device Templates** tab and use the **Add a Template to the Group** button to import your gold standard template.

### Step 4 - Add Your Device to the Group

With both the group and template created, move your device into the group from **Settings > Agents and Devices** using the **Edit** button.

![Add Device to Group](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKFr&d=%2Fa%2F4u000000Lzrz%2FCL7zXQgtkrBXbQvsjgxHwCzw.QVuNk.b1WxV4fpbBpY&asPdf=false)

### Step 5 - Creating the Baseline Report

As soon as the agent is added to the group, it will begin its baseline activities. You can see the **Installed Software** baseline event messages through the **Change Tracker Event** tab by using a **Baseline** event type within the filter.

![Baseline Event Messages](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKCw&d=%2Fa%2F4u000000LzpB%2FnfCqRQRTDvsvy7GOjXDlWNAMJFZKvKO2LcJgeVTezH8&asPdf=false)

Once the baselining has completed, which shouldn’t take more than ten minutes, navigate to the **Device** tile and highlight the gold standard system. You will see a button under the configuration display entitled **Create Baseline Report**.

![Create Baseline Report](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKMl&d=%2Fa%2F4u000000LzcS%2FqskqIfksBdnNjFg3j8Mmmt4X5pmiuv6M.CjUk09HPXk&asPdf=false)

Click the **Create Baseline Report** and accept the defaults from the popup window; obviously, change the name of the report if you prefer!

![Accept Defaults](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKMq&d=%2Fa%2F4u000000Lzs4%2FCtVy0P3TPIMzybSmCZmGzmOA1gVnjrvyfjSgYTKab3M&asPdf=false)

You have now created a baseline report for all software and patches that are installed on your gold standard system. You can view the report from **Settings > Compliance Reports Templates**.

### Step 6 - Running the Report

With the report created, you will be able to add the report to an existing group in order to run the report against all occupants of that group, or run the report ad hoc from the **Device** tile.

#### Scheduling Within a Group

![Scheduling Within a Group](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKMv&d=%2Fa%2F4u000000Lzs9%2FG_wfCvQCp3x3c91TII.ABPaLEYlrmj8T5..oKgT_Yik&asPdf=false)

#### Running the Report Ad Hoc from the Device Tile

![Running Report Ad Hoc](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKN0&d=%2Fa%2F4u000000LzhM%2FWN4tFLiaCuuP8QTiA1lWJlTwb8Ipg.fcOOr2Ozd0H7k&asPdf=false)

![Running Report Ad Hoc](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKEn&d=%2Fa%2F4u000000LzsE%2FcNv5KTb6j.3EHVw9_gF8KElY4kcO6OJm1wpIC6x7jNA&asPdf=false)