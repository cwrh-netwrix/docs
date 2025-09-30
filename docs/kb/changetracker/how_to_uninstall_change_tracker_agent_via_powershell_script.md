---
description: >-
  This article explains how to uninstall the Change Tracker Agent using a PowerShell script, detailing the steps for both .NetCore and non-.NetCore installations.
keywords:
  - Change Tracker Agent
  - PowerShell script
  - uninstall
sidebar_label: Uninstall Change Tracker Agent via PowerShell
tags: []
title: How to Uninstall Change Tracker Agent via PowerShell Script
knowledge_article_id: kA0Qk0000000QSLKA2
products:
  - change-tracker
---

# How to Uninstall Change Tracker Agent via PowerShell Script

## Overview

This article explains how to uninstall the Change Tracker Agent via PowerShell script.

## Instructions

To uninstall the Change Tracker Agent via PowerShell script, do the following, depending on your installation type:

1. For .NetCore-based installation, navigate to **C:\Program Files\NNT Change Tracker Suite\Gen7Agent (NetCore)\unins000.exe**.
2. For non-.NetCore installations, the script is located here: **C:\Program Files\NNT Change Tracker Suite\Gen7Agent\unins000.exe**.

The script itself would be as follows:

```plaintext
.\unins000.exe /SP-- /VERYSILENT /SUPPRESSMSGBOXES
```

> **NOTE:** Log Tracker has no Silent Uninstall feature, as of yet.