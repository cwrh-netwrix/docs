---
description: >-
  This article addresses a system error encountered in Netwrix Change Tracker when running event queries that include a text search, detailing the cause and resolution steps.
keywords:
  - Netwrix Change Tracker
  - system error
  - event queries
sidebar_label: System Error When Running Event Queries
tags: []
title: System Error When Running Event Queries
knowledge_article_id: kA0Qk0000000WkfKAE
products:
  - change-tracker
---

# System Error When Running Event Queries

## Symptom

In Netwrix Change Tracker, when an Events query includes a text search, it generates a simple system error message in the lower-right corner of the screen indicating that the query will not complete successfully or that it will time out.

## Cause

The default **TextSearchMethod** setting is **Text**, which cannot handle the complexity of the query. The query requires a new search configuration.

## Resolution

Follow the steps below to resolve the issue:

1. Log in to Change Tracker.
2. Navigate to **Settings** > **System Settings**.
3. Scroll down and click on **Show Advanced Options** at the bottom of the page.
4. Scroll down until you find **Configuration Settings** and click on **Add Config Item**.
5. Add all of the following options:
   - **Description:** TextSearchMethod  
     **Value:** regex
   - **Description:** MaxEventQueryTimeMs  
     **Value:** 600000
   - **Description:** MaxEventCountTimeMs  
     **Value:** 5000
6. Click **Update**.