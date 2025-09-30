---
description: >-
  This article provides instructions on resolving the "Check Log for Details" message by ensuring the Netwrix Info driver is running.
keywords:
  - Netwrix Info driver
  - Check Log for Details
  - event details
sidebar_label: Fix "Check Log for Details"
tags: []
title: How to Fix the "Check Log for Details" Message in the Event Details
knowledge_article_id: kA04u0000000JVQCA2
products:
  - change-tracker
---

# How to Fix the "Check Log for Details" Message in the Event Details

## Overview

This article provides instructions on resolving the "Check Log for Details" message by ensuring the Netwrix Info driver is running.

## Instructions

1. Open the command prompt as an administrator.
2. Type `fltmc` and press **Enter**. If the driver is running, you should see **Netwrix Info** as one of the listed items.

   ![Command prompt showing running drivers](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK41&d=%2Fa%2F4u000000LzSm%2FqpR4.v0IcK_EMJI.OzcPzu_rBrZoV1zAjMXfG9Ng86o&asPdf=false)

3. If **Netwrix Info** is not listed, navigate to the directory below, right-click the **Install** file, and run it as an administrator.

   **Gen7 Agent:**
   ```
   C:\Program Files\NNT Change Tracker Suite\Gen7Agent\Driver
   ```

   **6.5 Agent:**
   ```
   C:\Program Files\NNT Change Tracker Suite\Agent\Driver
   ```

   ![Installation directory for Netwrix drivers](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKG4&d=%2Fa%2F4u000000Lzlm%2F.Yirw9enA_kj0xD9q54lYRI2TBdb1gzFkmpzRxmXDl8&asPdf=false)

## Please Note:

In some cases, users may notice that the **NNTInfo** driver is running; however, they may experience intermittent interruptions of the "who made the change" information. This mainly occurs on extremely busy and noisy systems with a large volume of changes. The kernel buffer, which is used to capture the "who made the change" information, may be overflowing, preventing our agent from capturing this information.

Keep in mind that because our agent is a kernel-level agent, excluding the events in Change Tracker will stop the reporting of the events. However, these events are still being generated at the kernel level, and the agent is seeing them but choosing not to report them to the hub server based on the predefined exclusion.

Large volumes of changes will impact the agent's ability to capture "who made the change" information depending on the volume.