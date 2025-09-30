---
description: >-
  This article provides step-by-step instructions for configuring proxy settings for the FAST Cloud integration on a Change Tracker Server.
keywords:
  - FAST Cloud
  - proxy settings
  - Change Tracker Server
sidebar_label: Configure FAST Cloud Proxy
tags: []
title: How to Configure the FAST Cloud Integration with Proxy Internet Settings
knowledge_article_id: kA04u0000000JfVCAU
products:
  - change-tracker
---

# How to Configure the FAST Cloud Integration with Proxy Internet Settings

## Overview

If you have set up a proxy internet connection on your Change Tracker Server and you find that FAST Cloud is not working as expected, follow the instructions below to configure proxy settings for the IIS processes.

## Instructions

1. Open **Windows Control Panel**.
2. Choose **System**.
3. Choose **Advanced system settings**.
4. On the Advanced tab, click **Environment Variables**.
5. Click **New** to create a new environment variable under the **System Variables** heading.
6. Enter Variable Name: **ALL_PROXY**.
7. Enter Variable Value: `http://IPADDRESS:PORT`.

   > **NOTE:** This should be the IP and port of the proxy server.

8. Select **OK**.
9. After creating the environment variable, click **OK** to apply the changes.
10. Once the environment variable is configured, restart the Change Tracker server. The FAST Cloud should now function as expected.

## Related Articles

- [Rolling-Log Fix: "Hub Offline, connection retries exhausted (The remote server returned an error: (403) Forbidden.)"](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JfHCAU.html)
- [The NNT FAST™ Cloud Usage Considerations](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JX7CAM.html)