---
description: >-
  This article provides a step-by-step guide on how to change the subject of e-mail messages sent by Log Tracker.
keywords:
  - Log Tracker
  - email customization
  - batch file
sidebar_label: Change E-Mail Subject
tags: []
title: How to Change the Subject of E-Mail Messages (Log Tracker)
knowledge_article_id: kA04u0000000JcRCAU
products:
  - change-tracker
---

# How to Change the Subject of E-Mail Messages (Log Tracker)

## Overview

This article provides a procedure for modifying the subject of ticket e-mails sent by Log Tracker Server.

## Instructions

Here is a procedure for modifying the subject of ticket e-mails:

1. Copy the `t-actions\SENDMAIL.bat` file to the `t-actions\CUSTMAIL.bat` file (or some other name).
2. Edit the `t-actions\CUSTMAIL.bat` file created above. You may edit the file with **Notepad** or some other text editor.
3. In the `CUSTMAIL.bat` file, find the line that contains the keyword `Subject:`, and then modify the subject line to be your customized e-mail subject. You can include variables in the subject line using standard Windows batch file syntax.
4. Save the modifications.
5. Finally, either copy `CUSTMAIL.bat` back to `SENDMAIL.bat`, or modify your ticket actions (via the **Ticket > Actions** screen) to use the `CUSTMAIL.bat` file modified above.

> **NOTE:** The only main consideration is that `SENDMAIL.bat` is overwritten if you upgrade your Log Tracker Server to the next version, so it is good to save your changes or create a new ticket action. In the case of the above procedure, the `CUSTMAIL.bat` file will contain your changes and will not be overwritten if a later version of Log Tracker Server is installed.

The `t-actions` directory also contains a `README.txt` file that may be useful in creating ticket actions, and you may refer to the `t-actions\TEMPLATE.bat` file for a listing of all the environmental variables set by Log Tracker Server that may be used in batch files.

## Related Articles

- [How to move your Linux Server MongoDB Database to a Windows server?](https://kb.netwrix.com/8283)
- [How to Change the Admin Password of your Mongo Database](https://kb.netwrix.com/8310)
- [Supporting Documents for Hub Server Problems](https://kb.netwrix.com/8273)
- [Change Tracker Gen 7 Change Log / Update Log / ReadMe.txt Documents for Agent/Hub](https://kb.netwrix.com/8368)