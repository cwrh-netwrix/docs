---
description: >-
  This article provides step-by-step instructions for enabling Netwrix's File Approved-Safe technology (FAST) within the Netwrix Change Tracker.
keywords:
  - Netwrix Change Tracker
  - FAST technology
  - configuration
  - cloud integration
  - planned changes
sidebar_label: Enabling FAST Cloud
tags: []
title: Enabling Change Tracker's FAST Cloud
knowledge_article_id: kA04u0000000JPSCA2
products:
  - change-tracker
---

# Enabling Change Tracker's FAST Cloud

## Overview

This article covers the enablement of Netwrix's File Approved-Safe technology (FAST). Your FAST component is enabled via the Netwrix Change Tracker license and will be delivered by Netwrix upon receipt of an order.

The FAST configuration is relatively simple; however, there are a couple of key pieces of information you must be aware of.

**For FAST, your Netwrix Change Tracker must be version 7.0.1.51 or above.**

View your Change Tracker version by logging into Change Tracker and scrolling to the bottom of the page.

![Change Tracker Version](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJvG&d=%2Fa%2F4u000000LzNQ%2FMyXErdVzVKkbrx693lZzpWDcX8O8zByBampF_uZaR18&asPdf=false)

**The FAST service communicates with the Netwrix Cloud on port 8474.**

The actual address used for FAST is - [https://fast.nntsupport.com:8474](https://fast.nntsupport.com:8474).

Ensure that the Netwrix Change Tracker server can access this address over port 8474.

The communication to this address is always initiated from your Change Tracker server; fast.nntsupport.com will never attempt unsolicited communication to your Change Tracker installation.

## Instructions

### Step-by-step guide

**Configure the FAST License:**

1. Confirm your Change Tracker version as directed above.
2. Confirm the Netwrix Change Tracker server can communicate with [https://fast.nntsupport.com:8474](https://fast.nntsupport.com:8474).
3. Log into Netwrix Change Tracker's web console with an admin-level account.
4. Move to the **Settings** tile and scroll down to **License**.
5. Paste your FAST-enabled license from Netwrix into **Paste License Text**. You will be asked to log out. Once logged back in, your license details will look something like the below.

![FAST License Configuration](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJun&d=%2Fa%2F4u000000LzNV%2Fs547xf9k3_h56tQ6YmPgmcvHwdieJRgYJzP2WYNnGRI&asPdf=false)

**Configure the FAST Planned Change:**

1. Move to **Settings** and **Planned Changes**.
2. Press the button - **Schedule a Planned Change** and fill in the details as below. Once complete, click **Update**.

![FAST Planned Change](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJvL&d=%2Fa%2F4u000000LzNa%2FCwMMLarktUrcirBvg2.jYgPsuGOv10h01ootudDX0o0&asPdf=false)

3. Click the **Rules** button on the right-hand side of your new FAST planned change.
4. Once again, fill in the details as shown in the following screenshot. It is important that your configuration mirrors the below exactly!

![FAST Rules Configuration](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJvQ&d=%2Fa%2F4u000000LzNf%2FbxU621kV2keb2slWC7lFgbfkGFrQarisqA9w7VrYIUE&asPdf=false)

5. Click the **Update** button, and you are all set!

## Related Articles

- [How to Configure The FAST Cloud Integration With Proxy Internet Settings](https://kb.netwrix.com/8295)
- [The Netwrix FAST™ Cloud Usage Considerations](https://kb.netwrix.com/8161)
- [Change Tracker – How to Create a Custom Tracked Attributes Filter Within a Configuration Template](https://kb.netwrix.com/8265)
- [How to Add/Replace Configuration/Compliance Report Templates](https://kb.netwrix.com/8215)