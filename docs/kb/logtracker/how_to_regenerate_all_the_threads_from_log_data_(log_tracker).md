---
description: >-
  This article provides step-by-step instructions on how to regenerate all thread catalogs from existing log data using a batch file and the CGenx.exe tool.
keywords:
  - log data
  - thread catalogs
  - CGenx.exe
  - batch file
  - Log Tracker
sidebar_label: Regenerate All Thread Catalogs
tags: []
title: How to Regenerate All The Threads From Log Data (Log Tracker)
knowledge_article_id: kA04u0000000JV2CAM
products:
  - log-tracker
---

# How to Regenerate All The Threads From Log Data (Log Tracker)

## Overview

It may be necessary to regenerate all the thread catalogs from existing log data. This might be important to recover from a crash or prior to conducting a reporting session or forensic investigation. The **cli-bin** **tools** include a program called **CGenx.exe**, which can be used to regenerate a catalog of any type. This tool requires administrative access to the system and can be run at a command prompt to regenerate a catalog from an existing log file.

## Instructions

To regenerate all thread catalogs for all log data, you can compose a simple batch file as follows and place this file in the cli-bin folder. 

> **IMPORTANT:** The batch file may take many hours or even days to complete (depending on the amount of data on the system).

For example, a simple **REGEN_ALL_THREADS.bat** batch file, which iterates across all existing log files in the `C:\Program Files (x86)\NNT Log Tracker Suite\logs` folder and regenerates all threads, might look like the following:

```plaintext
REM: # # # # # # # # # # # # # # # # # # # # # # # # #

REM: REGEN_ALL_THREADS.bat
REM: Regenerate all thread catalogs from the files
REM: found in the C:\Program Files (x86)\NNT Log Tracker Suite\logs folder

for %%F in (C:\Program Files (x86)\NNT Log Tracker Suite\logs\*.log) do (
cgenx -threads %%~nF
)
```

1. Cut and paste the above batch file into the **REGEN_ALL_THREADS.bat** file.
2. Place this in the **cli-bin** folder.
3. To regenerate all threads from all log data, execute the file (as an Administrator).
4. If your log data is contained in a non-standard location on your system, you may need to change the value of `C:\Program Files (x86)\NNT Log Tracker Suite\logs`.

The above batch file uses standard Windows Batch File syntax to run the **CGenx.exe** program for each log file in the **logs** folder. The batch file syntax may seem a little obscure to you, but it has been around for fifteen years and works perfectly on all Windows platforms. See the article below for assistance with this batch file syntax:

[Batch File Looping Through Files](https://stackoverflow.com/questions/39615/how-to-loop-through-files-matching-wildcard-in-batch-file)

You can change the **-thread** option to **-all** (or some other CGenx option) to regenerate all catalogs (or some other specific catalog, such as devices, facilities, severities, users, etc.).

### Related Articles

- [How to fix the "Check Log for Details" message in the event details](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JVQCA2.html)
- [Rolling-Log Fix: "Hub Offline, connection retries exhausted (The remote server returned an error: (403) Forbidden.)"](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JfHCAU.html)
- [Rolling-Log Fix: ERROR "HubDetails - Crypto error. Has the agent process account changed since the password data was entered?"](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000Jf1CAE.html)
- [MongoDB - Pre-allocated Log Files Accumulate & Result to Disk Space Errors](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JdQCAU.html)