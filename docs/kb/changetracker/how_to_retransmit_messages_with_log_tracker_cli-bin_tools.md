---
description: >-
  This article provides step-by-step instructions on how to retransmit messages from Log Tracker Server to a third-party SIEM system using CLI-BIN tools.
keywords:
  - Log Tracker
  - SIEM
  - CLI-BIN
  - message retransmission
  - command line tools
sidebar_label: Retransmit Messages with Log Tracker CLI-BIN Tools
tags: []
title: How to Retransmit Messages With Log Tracker CLI-BIN Tools
knowledge_article_id: kA04u0000000JbTCAU
products:
  - change-tracker
---

# How to Retransmit Messages With Log Tracker CLI-BIN Tools

## Overview

When forwarding messages from **Log Tracker Server** to a third-party **SIEM** system, there may be situations where you need to resend and retransmit messages that were not forwarded. This may occur if, for example, the third-party SIEM was down or inaccessible to **Log Tracker Server** for an extended period.

You can retransmit any or all **Log Tracker Server** messages using the command line tools residing in the **CLI-BIN** folder of the **Log Tracker Server**.

## Instructions

To retransmit all the messages for a specific date and time range, execute the following commands at a command prompt or within a batch file:

```plaintext
cd C:\Program Files (x86)\NNT Log Tracker Suite\cli-bin
.\CatMsg -date YYYY/MM/DD -time HH:MM:SS -maxcount N > messages.txt
type messages.txt | ..\system\sendlog N.N.N.N -stdin
```

The above command sequence first creates a file `messages.txt` that contains all the messages for the date `YYYY/MM/DD` starting at the time `HH:MM:SS`, to a maximum of `N` messages. This is done by the **CatMsg.exe** program, which is one of several ways of listing messages from the message archive.

Once the `messages.txt` file is created, you can send this data to the third-party SIEM or syslog collector at the IP address `N.N.N.N` using the **sendlog** command.

Depending on how many messages you are sending, the **sendlog.exe** program can take a few minutes to a few hours to execute.

If only certain messages are to be forwarded, you can use any of the other **CLI-BIN** tools to filter the messages or send messages associated with just a single device or user.

## Related Articles

- [How to delete a device in Log Tracker](#)
- [Log Tracker - Types of Authentication](#)
- [What Change Tracker Gen7 Objects to Monitor Using Application Performance Monitoring (APM) Tools](#)
- [Log Tracker Tags Facility](#)
- [How to use CloseTicket.exe to Immediately Close Log Tracker Tickets](#)