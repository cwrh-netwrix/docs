---
description: >-
  This article provides a step-by-step guide to ensure that FAST Cloud is checked last against other Scheduled Planned Changes to reduce the risk of FAST Breaches.
keywords:
  - FAST Cloud
  - Scheduled Planned Changes
  - Change Management
sidebar_label: FAST Cloud Check Order
tags: []
title: How to Have FAST Cloud Checked Last Against Other Scheduled Planned Changes
knowledge_article_id: kA04u0000000JcHCAU
products:
  - change-tracker
---

# How to Have FAST Cloud Checked Last Against Other Scheduled Planned Changes

## Overview

This article is useful to ensure that **FAST Cloud** is checked last against other **Scheduled Planned Changes**. The reason this happens is that planned changes are run in alphabetical order. There is a small edit we can make to change this. This can help reduce the number of FAST Breaches people may experience.

Here is an example of the **FAST Cloud Planned Change** not being checked last. We see that the **FAST Cloud** rule is checked before our **Planned Linux Changes**. We don't want this because the **Planned Linux Changes** may have a rule to catch this change as planned.

![Example of FAST Cloud Planned Change Order](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKGr&d=%2Fa%2F4u000000Lzf3%2FFZP8FTSeYdff6jdMkQe2L5zyFmaqFvHhKljfVRDAw4Q&asPdf=false)

To remedy this, we can make a small edit in the **FAST Cloud Planned Change** name.

## Step-by-step Guide

1. First, go to **Settings**.
2. Then, on the sidebar, click **Planned Changes**.
3. To the right of the **FAST Cloud Scheduled Planned Change**, click the **Edit** button.  
   ![Edit Button for FAST Cloud Scheduled Planned Change](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKJA&d=%2Fa%2F4u000000LzhI%2FnS1CZNdjW.YLsqpEDZdRpCEdlXFAoXXD8fSL5jG3UkQ&asPdf=false)
4. In the **Planned Change Name**, edit the name to begin with **~** (See Screenshot Below).  
   ![Edit Planned Change Name](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKWR&d=%2Fa%2F4u000000LzeN%2FnVgq1Sxz415PE0Qlg5J5WnX9K2Y7GXL7s82YA4k6Jqo&asPdf=false)
5. Click **Update**.

After making this change, your **FAST Cloud Scheduled Planned Change** should be checked after all other **Scheduled Planned Changes**.  
![FAST Cloud Scheduled Planned Change Order After Update](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKUq&d=%2Fa%2F4u000000LzYB%2Fq_0UBcgw2tXq07pJxfghUpIehJJ.EoihczoK9MvOydU&asPdf=false)

## Related Articles

- [How to Configure The FAST Cloud Integration With Proxy Internet Settings](https://kb.netwrix.com/8295)
- [How to Move Your Linux Server MongoDB Database to a Windows Server?](https://kb.netwrix.com/8283)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://kb.netwrix.com/8164)
- [How to Change the Admin Password of Your Mongo Database](https://kb.netwrix.com/8310)

**Attachments:**
- [Screenshot_4.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKWg&d=%2Fa%2F4u000000Lzik%2F0k2XjnuRzN87OvBjy1tgMKcDGlSmpCUaE2kYJxJt.hc&asPdf=false)
- [Screenshot_3.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKHO&d=%2Fa%2F4u000000Lzxy%2FRDLTHtGrLhf_nexwidOIMtLeiVoUF3mp4LKRdb5exVs&asPdf=false)
- [Screenshot_2.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKKN&d=%2Fa%2F4u000000M024%2FsZLsAhYKuSIZztSoqXcRkfSGCOu8iQKrhTw1Y3LMSRE&asPdf=false)
- [Screenshot_1.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKO1&d=%2Fa%2F4u000000M029%2Fo0L0B03TI.Jz14FLgIP355wmb3FcXILCBdSyRO3t2Pg&asPdf=false)