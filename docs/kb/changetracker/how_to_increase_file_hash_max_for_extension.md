---
description: >-
  This article provides step-by-step instructions on how to increase the FileHash Max for extensions when encountering specific error messages.
keywords:
  - FileHash Max
  - Gen7Agent Service
  - configuration
sidebar_label: Increase File Hash Max
tags: []
title: How to Increase File Hash Max for Extension
knowledge_article_id: kA04u0000000JcbCAE
products:
  - activity-monitor
---

# How to Increase File Hash Max for Extension

## Overview

This article will help you increase your FileHash Max for extensions when you receive the error below.

### Example Error Message

```
Hash attribute not calculated, file length is bigger than the current filehashmaxforextension limit: C:\folder\subfolder\myfile.exe (171758423 bytes)
```

## Instructions

To increase the maximum file hash size:

1. Stop the **Gen7Agent Service**.
2. Navigate to and edit `C:\Program Files\NNT Change Tracker Suite\Gen7Agent\Gen7Agent.Service.exe.config`.
3. Look for the following lines of code - Generally, this will be in line 13 and 14:
   ```xml
   <filehashmaxforextension>524288000</filehashmaxforextension>
   ```
4. Edit the value to represent the number you want to increase it to. Note that the higher the number, the more resources and time it takes to hash the file. Example (500MB):
   ```xml
   <filehashmaxforextension>524288000</filehashmaxforextension>
   ```
   > **NOTE:** This website is good for conversions. We are looking to convert Megabytes to Bytes: [http://www.matisse.net/bitcalc/?input_amount=135&input_units=megabytes&notation=legacy](http://www.matisse.net/bitcalc/?input_amount=135&input_units=megabytes&notation=legacy).
5. Save the file and close the word processor used to make the changes.
6. Start the **Gen7Agent Service**.

> **IMPORTANT:** You may find that you need to do this on multiple agents. If this is the case, this file can be copied and pasted on agents that have the same version number and are in default state, but a service stop and start is needed for the changes to take effect.

## Related Articles

- [Support for TLS 1.2 in the .NET Framework 3.5.1](https://kb.netwrix.com/8302)
- [MongoDB - Pre-allocated Log Files Accumulate & Result to Disk Space Errors](https://kb.netwrix.com/8285)
- [Change Tracker – How to Create a Custom Tracked Attributes Filter Within a Configuration Template](https://kb.netwrix.com/8265)
- [How To Increase File Content Max for Extension](https://kb.netwrix.com/8261)
- [Rolling-Log Fix: "Script error executing line 6: ExecuteAndCaptureChunked - /NNT_FILEHASH_LINUX_X64: Permission denied” (AGENTLESS LINUX)](https://kb.netwrix.com/8253)