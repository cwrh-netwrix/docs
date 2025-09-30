---
description: >-
  This article provides troubleshooting steps for resolving the "Error 503 - Unable to Access Change Tracker Login Screen" issue in Netwrix Change Tracker.
keywords:
  - Change Tracker
  - Error 503
  - application pool
sidebar_label: Error 503 - Change Tracker Access Issue
tags: []
title: Error 503 - Unable to Access Change Tracker Login Screen
knowledge_article_id: kA0Qk0000000LFlKAM
products:
  - change-tracker
---

# Error 503 - Unable to Access Change Tracker Login Screen

## Symptom

The following error is prompted when attempting to access Netwrix Change Tracker:

```
Connection to server lost
Server unavailable since %datestamp% (local),
(503)
```

## Cause

The Change Tracker web application pool is not running. This may be caused by the application pool failing to start, often due to incorrect credentials of the custom **Identity** user for the affected application pool.

## Resolution

Refer to the following steps to review and specify the credentials of the custom **Identity** user for the application pool:

1. In the left pane of IIS Manager, select the **Application Pools** page.
2. Locate the Change Tracker web application pool, right-click it, and select **Advanced Settings...**.
3. Under the **Process Model** section, locate the **Identity** node, select it, and click the ellipsis button.
4. Click **Set...**, and specify new credentials for the account to run the application pool.
5. Click **OK** > **OK** > **OK** to save changes. Right-click the pool and select **Start** to run it.