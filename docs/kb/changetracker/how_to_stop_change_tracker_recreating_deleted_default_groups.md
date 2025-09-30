---
description: >-
  This article provides step-by-step instructions on how to prevent Change Tracker from recreating deleted default groups.
keywords:
  - Change Tracker
  - default groups
  - configuration settings
sidebar_label: Stop Change Tracker from Recreating Default Groups
tags: []
title: How to Stop Change Tracker from Recreating Deleted Default Groups
knowledge_article_id: kA04u0000000JWGCA2
products:
  - change-tracker
---

# How to Stop Change Tracker from Recreating Deleted Default Groups

## Overview

Have you created custom groups for your agents? Have you deleted some or all of the default OS groups that come with the software? Do the groups keep re-appearing regularly? If so, follow the instructions below.

By default, the Change Tracker console will recreate default groups and their attached configuration templates and compliance reports whenever the Netwrix application pool is recycled through IIS, which occurs every 29 hours. To stop this from happening, please follow these steps:

## Instructions

1. Log into **Change Tracker**.
2. Browse to **Settings**.
3. Browse to **System Settings**.
4. Select **Show Advanced Options**.
5. Select **Add Config Item**.
   - Enter Description: **CreateDefaultGroups**
   - Enter Value: **No**
6. Select **Update**.

Once this has been set, the default groups should no longer be recreated.