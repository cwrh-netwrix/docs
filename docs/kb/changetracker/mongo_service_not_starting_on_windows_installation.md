---
description: >-
  This article addresses the issue of the MongoDB service not starting on Windows after installing Change Tracker, providing a solution to resolve the problem.
keywords:
  - MongoDB
  - Change Tracker
  - Windows service
sidebar_label: MongoDB Service Not Starting
tags: []
title: Mongo Service Not Starting on Windows Installation
knowledge_article_id: kA04u0000000JPNCA2
products:
  - change-tracker
---

# Mongo Service Not Starting on Windows Installation

## Problem

After installing Change Tracker for the first time, you are able to reach the logon screen but receive a 'Logon Failure' message when attempting to access Change Tracker. You have checked the state of the Mongo service, and it is marked as stopped. When you attempt to start the service, the following error is received:

```
Windows could not start the MongoDB service on Local Computer
```

![MongoDB Service Error](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJv6&d=%2Fa%2F4u000000LzNG%2FfFKJ5OFpECboYB2Q71KHwq0SDArO6rHk78kzP.3M8zE&asPdf=false)

## Solution

Update the **Visual C++ Redistributable Packages** on the system.

1. Download the latest **Visual C++ package** from [Microsoft](https://www.microsoft.com/en-gb/download/details.aspx?id=48145).
2. Once downloaded, install the C++ Package; there will be no reboot required.
3. Start the MongoDB service.

## Related Articles

- [How to fix "Error, the requested event counts summary size cannot be smaller than the system event count window size" message](https://kb.netwrix.com/8313)
- [The NNT FAST™ Cloud Usage Considerations](https://kb.netwrix.com/8161)
- [HTTP Error 500.19 - Internal Server Error - Error Code 0x8007007e](https://kb.netwrix.com/8300)
- [Redis - QFork.dat Files Taking Up Large Amounts Of Disk Space?](https://kb.netwrix.com/8286)
- [NNT Gen 7 Agent - Hub Connection Test Error (WinHttp.WinHttpRequest)](https://kb.netwrix.com/8276)