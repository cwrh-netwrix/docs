---
description: >-
  This article provides a step-by-step guide on how to create reports on blacklisted and whitelisted IP addresses using the Log Tracker's reporting facility.
keywords:
  - Log Tracker
  - firewall reports
  - IP address management
sidebar_label: Create Reports on Firewall Black and White Listed Devices
tags: []
title: How to Create a Report on Firewall Black and White Listed Devices
knowledge_article_id: kA04u0000000JcvCAE
products:
  - activity-monitor
---

# How to Create a Report on Firewall Black and White Listed Devices

## Overview

The **Reports > Audit > Perimeter** reporting facility can be configured to generate reports on blacklisted and whitelisted IP addresses. This may be useful to acquire a report on internal or perimeter devices of special interest. You can configure the report view to show internal devices that match a blacklist, external devices that match a blacklist, or both.

## Instructions

To accomplish this:

1. First, create either a blacklist or a whitelist in the **Correlation > Config > Lists** facility. This list will simply be a list of IP addresses of interest, listed one line at a time. The list can be large—perhaps up to 50,000 different addresses.
2. Then, on the **Reports > Audit > Perimeter** screen, click **Add New** to add a new report viewer. For the **Match External Address** (or the **Match Local Addrs**), simply specify the list macro as the column match qualifier.

See the screenshot below for further assistance:

![Screenshot of report configuration](<insert_image_url_here>)

Finally, note that this same technique may be useful for creating a report of blacklisted or whitelisted country codes. For example, to create a report of message references associated with a long list of country codes, you could create a list macro such as `@@allowed_countries@@` and then use this as the match qualifier for **Country Codes (column 2)**, such as `not @@allowed_countries@@`. (A list of country codes can be found in the **More > Geo-IP Tool** screen.)

## Related Articles

- [How to Backup / Restore / Move your MongoDB Database](<insert_link_here>)
- [Monitoring Oracle Databases using Change Tracker](<insert_link_here>)
- [How to Configure The FAST Cloud Integration With Proxy Internet Settings](<insert_link_here>)
- [How to move your Linux Server MongoDB Database to a Windows server?](<insert_link_here>)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](<insert_link_here>)