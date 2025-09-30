---
description: >-
  This article explains the error that occurs when the number of pages in a report exceeds the limit in Netwrix Change Tracker and provides steps to resolve it.
keywords:
  - Netwrix Change Tracker
  - report error
  - page limit
sidebar_label: Pages in Report Exceed 250 Error
tags: []
title: Error: Pages in Report Exceed 250
knowledge_article_id: kA0Qk0000000YjFKAU
products:
  - change-tracker
---

# Error: Pages in Report Exceed 250

## Symptom

When you attempt to run a report in **Netwrix Change Tracker**, the following error is prompted:

```
TemplateId: %template_name%
Results State: QueryError
Number of pages in the report will exceed 250 - Estimated Total Page Count %page_count%
```

## Cause

The estimated page count for the report exceeds the predefined limit.

## Resolution

Introduce a new limit for report pages:

1. In **Change Tracker**, proceed to **Settings** > **System Settings** > **Show Advanced Options**.
2. In the **Configuration Settings** section, click **Add Config Item**. In the **Description** field, specify **MaxPagesInReport**. In the **Value** field, specify **2000**.

   > **NOTE:** You can introduce any value to cover the required target page count. The value **2000** is used as an example.

3. Click **Update**. Run the affected report again.