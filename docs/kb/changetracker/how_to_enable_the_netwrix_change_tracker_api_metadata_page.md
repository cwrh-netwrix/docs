---
description: >-
  This article provides a step-by-step guide on how to enable the Netwrix Change Tracker API Metadata page to resolve a 404 error.
keywords:
  - Netwrix Change Tracker
  - API Metadata
  - 404 error
sidebar_label: Enable Change Tracker API Metadata
tags: []
title: How to Enable the Netwrix Change Tracker API Metadata Page
knowledge_article_id: kA04u0000000JdyCAE
products:
  - change-tracker
---

# How to Enable the Netwrix Change Tracker API Metadata Page

## Step-by-step Guide

In order to navigate to [https://localhost/api/metadata](https://localhost/api/metadata), you will need to take the steps below on the Change Tracker Server:

1. On the Change Tracker Server, open this file with a text editor of your choice:
   **C:\inetpub\wwwroot\Change Tracker Generation 7 Hub\appSettings.config**

2. Modify the following keys:
   Change this key from `false`:
   to `true`:

3. Save the file, replacing the old one if needed.

4. Now, head into **IIS** and restart the **Change Tracker Generation 7** site.

## Related Articles

- [How to move your Linux Server MongoDB Database to a Windows server?](https://kb.netwrix.com/8283)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://kb.netwrix.com/8164)
- [How to Change the Admin Password of your Mongo Database](https://kb.netwrix.com/8310)
- [Supporting Documents for Hub Server Problems](https://kb.netwrix.com/8273)