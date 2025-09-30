---
description: >-
  This article provides step-by-step instructions on how to turn off bulk email notifications in Change Tracker, ensuring that each change is sent as a separate email.
keywords:
  - Change Tracker
  - email notifications
  - bulk notifications
sidebar_label: Turn Off Bulk Email Notifications
tags: []
title: How To Turn Off Bulk Email Notifications in Change Tracker
knowledge_article_id: kA04u0000000JerCAE
products:
  - change-tracker
---

# How To Turn Off Bulk Email Notifications in Change Tracker

## Overview

The default behavior of **Change Tracker** when sending real-time email notifications is to wait and compile multiple changes into a single email. In some instances, it may be necessary to have each change sent as a separate email. Below is a guide on how to force **Change Tracker** to send each change as its own email.

## Instructions

Please follow the steps below carefully:

1. Stop IIS. You can do this by opening an administrative command prompt and running the following command:
   ```
   iisreset /stop
   ```
2. Navigate to `C:\inetpub\wwwroot\Change Tracker Generation 7 Hub\bin\Configs`.
3. If your `localhost.json` file is in a default configuration and you have not split your MongoDB to a different server, you can replace your localhost file with the preconfigured one here: [localhost.json](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKbl&d=%2Fa%2F4u000000M08H%2F9QAKMjZxxJQWYR_itsOPHj.qX1QJJ2to08Nte23PWto&asPdf=false).
4. Start IIS. You can do this by opening an administrative command prompt and running the following command:
   ```
   iisreset /start
   ```

> **NOTE:** If you prefer to edit your existing `localhost.json` file instead of replacing it with the one above, please insert the following lines of code at the end of the file. This method is required if your database has been split off to a different system:

```json
"pipeline": {
    "enableBulkNotifications": "no"
}
```

Below is a before and after of the modification:

**BEFORE:**

![Before Modification](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKbl&d=%2Fa%2F4u000000M08H%2F9QAKMjZxxJQWYR_itsOPHj.qX1QJJ2to08Nte23PWto&asPdf=false)

**AFTER:**

![After Modification](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKTe&d=%2Fa%2F4u000000Lzv5%2FB2LBbQb9j_axND7iWQ0BRIKKA97STm7goTMN36G4juU&asPdf=false)

## Related Articles

- [How To Turn Off Bulk Email Notifications (Force Change Tracker to send one email for each change instead of compiling into one email with multiple changes)](https://kb.netwrix.com/8284)
- [How to Send E-Mails to Multiple Users on Log Tracker](https://kb.netwrix.com/8249)
- [How to Change the Subject of E-Mail Messages (Log Tracker)](https://kb.netwrix.com/8247)

## Attachments

- [After.JPG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKbq&d=%2Fa%2F4u000000LzzQ%2F.zF2CRKLb17oxBLLjnRa6YYwwuPSben7BZLEakWaZwg&asPdf=false)
- [Before.JPG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKUh&d=%2Fa%2F4u000000Lzed%2FbHyk2j2cfxcg8rWqu2KlTHOrE7iK6RlgoRgCWFvr8aE&asPdf=false)
- [localhost.json](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKbv&d=%2Fa%2F4u000000Lzst%2FIP_5r58UvtZa0c2NOeeAdaME8WksDMfepTU5X8Kvezg&asPdf=false)