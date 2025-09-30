---
description: >-
  This article explains why you are receiving File Access events in Change Tracker, what they signify, and how to enable or disable them.
keywords:
  - file access events
  - Change Tracker
  - configuration template
sidebar_label: File Access Events in Change Tracker
tags: []
title: Why am I receiving file access events in Change Tracker?
knowledge_article_id: kA04u0000000JYjCAM
products:
  - activity-monitor
---

# Why am I receiving file access events in Change Tracker?

## Overview

This article will describe why you are receiving File Access events in Change Tracker, what they are, and how to disable or enable them.

The `fileaccessed` event you are seeing is a "read" operation for the file shown in the details. This does not mean someone changed the file; it simply means the file was accessed (or read), whether that be a person or software doing so. Think of it as someone opening a Word document. If you were tracking that, you would see the same notification for the Word document simply being opened.

![File Access Event Example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKIB&d=%2Fa%2F4u000000LzjE%2Fcd3X1mt3ENeD2fx9u0gx5LT4Knhwzafl3CqahQthYCA&asPdf=false)

## How to Enable or Disable "fileaccessed" Events in Change Tracker

The steps below will show you how to enable or disable these event types in Change Tracker.

### Disabling File Access Events

To disable file access events, follow the steps below:

1. This setting is configured from a device **Configuration Template**, which is appended to a group. Devices within that group then receive the template.
2. Go to the **Settings** Tile > Click on the **Configuration Templates** Navigation button to the left.
3. Find the Configuration Template that you want to use for these event types, or create a new one by pressing the **Create a Template** button.
4. Click the **Edit** button on the template you want to modify.
5. For the desired path, locate the **Tracked Attributes** Column. Click the **Edit** button and change this to **"File attributes (excluding contents) only"** (See Screenshot Below).
6. Click **Save Changes** at the top of the page.
7. If this is a new template, apply it to the group of devices by going to **Settings** > **Groups** > Select the group > **Device Templates** > **Add a template**.

> **IMPORTANT:** When you update a configuration template, the agent does a re-baseline of the files within the defined parameters. Changes to the files will not be seen until after the baseline is completed. A baseline typically takes about 15-20 minutes to complete on a Windows device. If you are going to test a change on this folder, and you update it as per the instructions above, please test it about 30 minutes after you have saved the change to the template so that the agent has adequate time to complete its baseline process.

### Enabling File Access Events

To enable file access events, follow the steps below:

1. This setting is configured from a device **Configuration Template**, which is appended to a group. Devices within that group then receive the template.
2. Go to the **Settings** Tile > Click on the **Configuration Templates** Navigation button to the left.
3. Find the Configuration Template that you want to use for these event types, or create a new one by pressing the **Create a Template** button.
4. Click the **Edit** button on the template you want to modify.
5. For the desired path, locate the **Tracked Attributes** Column. Click the **Edit** button and change this to **"All file and folder attributes excluding contents"** (See Screenshot Below).
6. Click **Save Changes** at the top of the page.
7. If this is a new template, apply it to the group of devices by going to **Settings** > **Groups** > Select the group > **Device Templates** > **Add a template**.

> **IMPORTANT:** When you update a configuration template, the agent does a re-baseline of the files within the defined parameters. Changes to the files will not be seen until after the baseline is completed. A baseline typically takes about 15-20 minutes to complete on a Windows device. If you are going to test a change on this folder, and you update it as per the instructions above, please test it about 30 minutes after you have saved the change to the template so that the agent has adequate time to complete its baseline process.

![File Access Event Configuration Example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKQs&d=%2Fa%2F4u000000LztN%2FyRXwPRqZsMNh6L2pKXYcjMwVtkWEWBCUWabLI5bmCx8&asPdf=false)

## Related Articles

- [How to fix "Error, the requested event counts summary size cannot be smaller than the system event count window size" message](https://kb.netwrix.com/8313)
- [The Netwrix FAST™ Cloud Usage Considerations](https://kb.netwrix.com/8161)
- [HTTP Error 500.19 - Internal Server Error - Error Code 0x8007007e](https://kb.netwrix.com/8300)
- [Redis - QFork.dat Files Taking Up Large Amounts Of Disk Space?](https://kb.netwrix.com/8286)
- [Netwrix Gen 7 Agent - Hub Connection Test Error (WinHttp.WinHttpRequest)](https://kb.netwrix.com/8276)

**Attachments:**
- [image2018-1-12_17-10-47.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK9x&d=%2Fa%2F4u000000Lzvc%2FB7kznCt15N_PvtMJ3DcJVb8WU9QhgPSTRRes0pShjEY&asPdf=false)
- [attrib.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK3u&d=%2Fa%2F4u000000LzqJ%2FKKXAUZwSCeprXZsqzYuhzM69v.P0arwr3Ft3XCOs3OQ&asPdf=false)