---
description: >-
  This article provides step-by-step instructions on how to import externally created configuration templates into Log Tracker.
keywords:
  - Log Tracker
  - configuration templates
  - import templates
sidebar_label: Import Configuration Templates
tags: []
title: How to Import Externally Created Configuration Templates in Log Tracker
knowledge_article_id: kA04u0000000JavCAE
products:
  - log-tracker
---

# How to Import Externally Created Configuration Templates in Log Tracker

## Overview

Sometimes it is faster to edit configuration files in Notepad and import them.

## Instructions

1. Create a new folder with a `.dir` extension in `C:\Program Files (x86)\NNT Log Tracker Suite\config\$templ\`. For example: `C:\Program Files (x86)\NNT Log Tracker Suite\config\$templ\newfolder.dir`.

2. Place the INF files you wish to import into the folder you just created.

3. Log onto your **Log Tracker** web interface, then go to **Correlation** > **Config** > **Templates**.

4. Click **Start**, click **Next** (leave `LoadFrom` selected), find your newly created folder name in the drop box, then click **Finish**... preferably with `Merge` still selected.