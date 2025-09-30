---
description: >-
  This article explains how to send text messages using the Log Tracker Server by configuring SMTP settings and using a batch file.
keywords:
  - Log Tracker Server
  - SMS gateway
  - SENDTEXT.bat
sidebar_label: Send Text Messages Using Log Tracker Server
tags: []
title: How to Send Text Messages Using Log Tracker Server
knowledge_article_id: kA04u0000000JbYCAU
products:
  - change-tracker
---

# How to Send Text Messages Using Log Tracker Server

## Overview

The easiest way to send a text message from **Log Tracker Server** is to send an email to an SMS-enabled gateway. You need to configure and enable the **Log Tracker > System > SMTP** settings, and then set up a simple **Ticket Action** batch file, such as the `SENDTEXT.bat` file attached here.

The `SENDTEXT.bat` file removes extra text to keep the text message short and pertinent. You can configure one or more `SENDTEXT.bat` files to send messages to one of the phone carriers using the email addresses below:

- AT&T: `number@txt.att.net`
- Qwest: `number@qwestmp.com`
- T-Mobile: `number@tmomail.net`
- Verizon: `number@vtext.com`
- Sprint: `number@messaging.sprintpcs.com`
- Sprint (Alt): `number@pm.sprint.com`
- Virgin Mobile: `number@vmobl.com`
- Nextel: `number@messaging.nextel.com`
- Alltel: `number@message.alltel.com`
- Metro PCS: `number@mymetropcs.com`
- Powertel: `number@ptel.com`
- Boost Mobile: `number@myboostmobile.com`
- Suncom: `number@tms.suncom.com`
- Tracfone: `number@mmst5.tracfone.com`
- U.S. Cellular: `number@email.uscc.net`

Note that the "number" must be entered without any punctuation marks, including commas, dashes, periods, or parentheses.

If you want to send SMS messages directly from the **Log Tracker Server** (such as via a dial-out modem), this is more complicated and requires third-party software to be installed. Currently, there is no native GA code to do this in **Log Tracker**, but we have successfully integrated with several low-cost SMS gateways.

Please see the attached example of the `SENDTEXT.bat` file described above.

### Attachments

- [SENDTEXT_bat.txt](#)

## Related Articles

- [How to delete a device in Log Tracker](#)
- [How To Turn Off Bulk Email Notifications](#)
- [Rolling-Log Fix: "ERROR AgentTaskRunner - task execution failed for task - DeviceConfigTask. Item wildcards match text must not contain separator '\' for MatchType.Wildcards unless ContainerMatchAppliesToWholePath is true."]( #)
- [Log Tracker - Types of Authentication](#)
- [Log Tracker Tags Facility](#)