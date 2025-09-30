---
description: >-
  This article provides step-by-step instructions for increasing the maximum file content size for extensions when encountering specific error messages.
keywords:
  - file content maximum
  - Gen7Agent service
  - configuration
sidebar_label: Increase File Content Max
tags: []
title: How to Increase File Content Max for Extension
knowledge_article_id: kA04u0000000JV3CAM
products:
  - activity-monitor
---

# How to Increase File Content Max for Extension

## Overview

This article will help you increase your file content maximum for extensions when you receive the error below.

### Example Error Message

```
Contents will not be tracked, file length is bigger than current filecontentmaxforextension limit: (701206 bytes)
```

## Instructions

To increase the maximum file content size:

1. Stop the **Gen7Agent Service**.
2. Navigate to and edit `C:\Program Files\NNT Change Tracker Suite\Gen7Agent\Gen7Agent.Service.exe.config`.
3. Look for the following lines of code - Generally, this will be in line 11 and 12:

   ```xml
   <maxFileContentSize value="1048576" />
   ```

4. Edit the value to represent the number you want to increase it to. Note that the higher the number, the more resources and time it takes to process file contents. Example (1 MB):

   ```xml
   <maxFileContentSize value="1048576" />
   ```

   Note that this website is good for conversions. We are looking to convert Megabytes to Bytes: [http://www.matisse.net/bitcalc/?input_amount=135&input_units=megabytes&notation=legacy](http://www.matisse.net/bitcalc/?input_amount=135&input_units=megabytes&notation=legacy).

5. Save the file and close the word processor used to make the changes.
6. Start the **Gen7Agent Service**.

   > **IMPORTANT:** You may find that you need to do this on multiple agents. If this is the case, this file can be copied and pasted on agents that have the same version number and are in default state, but a service stop and start is needed for the changes to take effect.

   > **NOTE:** We have built-in file content limits on the agent, and if these are exceeded, file contents will not be performed. This assists the agent and ensures that it can process files as quickly as possible, as the bigger the file, the longer it takes to generate a hash value. Increasing this value could affect the speed at which file contents are processed.

## Related Articles

- [How to move your Linux Server MongoDB Database to a Windows server?](https://kb.netwrix.com/8283)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://kb.netwrix.com/8164)
- [How to Change the Admin Password of your Mongo Database](https://kb.netwrix.com/8310)
- [How to fix the "Check Log for Details" message in the event details](https://kb.netwrix.com/8133)