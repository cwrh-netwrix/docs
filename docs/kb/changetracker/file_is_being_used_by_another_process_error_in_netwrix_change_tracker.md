---
description: >-
  This article addresses the "File Is Being Used by Another Process" error encountered in Netwrix Change Tracker, detailing its symptoms, causes, and resolutions.
keywords:
  - Netwrix Change Tracker
  - file access error
  - antivirus conflict
sidebar_label: File Access Error in Change Tracker
tags: []
title: File Is Being Used by Another Process Error in Netwrix Change Tracker
knowledge_article_id: kA04u00000111HUCAY
products:
  - change-tracker
---

# File Is Being Used by Another Process Error in Netwrix Change Tracker

## Symptom

The following error is prompted when attempting to run a report in Netwrix Change Tracker:

```
The process cannot access the file '%path_to_file%' because it is being used by another process.
```

The `'%path_to_file%'` path may differ depending on the affected report. (E.g., `C:\Windows\TEMP\1-11530090-NNT CIS Microsoft Windows Server 2012 R2 Benchmark - Level 2 Member Server.json`.)

## Cause

The antivirus (AV) or endpoint detection and response (EDR) solution installed in your environment is conflicting with Netwrix Change Tracker.

## Resolutions

1. Make sure the top-level folder of the affected path is excluded from the monitoring scope of your AV or EDR solution to prevent further conflicts. This applies to real-time scans and backups. For the example path provided, it is recommended to exclude `C:\Windows\TEMP`.
2. Exclude Netwrix Change Tracker folders, services, and processes from the monitoring scope of your AV and EDR. Refer to the following article for additional information: [Antivirus Exclusions for Netwrix Change Tracker](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u00000111HFCAY.html).

### Related Articles

[Antivirus Exclusions for Netwrix Change Tracker](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u00000111HFCAY.html)