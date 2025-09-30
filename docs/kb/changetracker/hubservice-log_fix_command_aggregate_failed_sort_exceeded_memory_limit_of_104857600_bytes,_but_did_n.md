---
description: >-
  This article addresses the error encountered when logging into Change Tracker, specifically the command aggregate failure due to exceeding the memory limit. It provides a solution for rectifying the issue.
keywords:
  - Change Tracker
  - MongoDB
  - command aggregate
  - error resolution
  - allowDiskUse
sidebar_label: Hubservice Log Fix
tags: []
title: Hubservice Log Fix: Command Aggregate Failed Due to Memory Limit
knowledge_article_id: kA04u0000000JXdCAM
products:
  - change-tracker
---

# Hubservice Log Fix: Command Aggregate Failed Due to Memory Limit

## Problem

You are unable to log into **Change Tracker**, receiving the error "username or password incorrect."

The **MongoDB** service is running, as is the **IIS** service. Upon checking the log for **Change Tracker Hub**, the `hubservice-log.txt` found by default at `C:\inetpub\wwwroot\Change Tracker Generation 7 Hub\log` contains the following error, which repeats:

```
MongoDB.Driver.MongoCommandException: Command aggregate failed: Sort exceeded memory limit of 104857600 bytes, but did not opt in to external sorting. Aborting operation. Pass allowDiskUse:true to opt in.
```

![Hubservice Log Error](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKMO&d=%2Fa%2F4u000000Lzs2%2FzsuKN6UK.ZUWoERo5KKIzPnZusTTjDSJaMw2B04JgM4&asPdf=false)

## Solution

The cause of the error has been identified as a sub-optimal query running during the hub service startup. This issue has been resolved in later releases of the software (7.0.1.58 and onwards).

For earlier versions of **Change Tracker**, perform the following steps to rectify the issue:

1. Log into the **Change Tracker** server and open a command prompt.
2. Execute the following commands:

   ```plaintext
   cd "C:\Program Files\NNT Change Tracker Suite\Gen7\MongoDB\bin"
   mongo.exe
   use NNTHubService
   db.SystemDirectory.createIndex({OrganizationId:1, _t:1, DisplayName:1})
   ```

The output of the command should be:

```plaintext
{
  "createdCollectionAutomatically" : false,
  "numIndexesBefore" : 5,
  "numIndexesAfter" : 6,
  "ok" : 1
}
```

Attempt to log into **Change Tracker** again.

## Related Articles

- [How to Backup / Restore / Move your MongoDB Database](https://kb.netwrix.com/8150)
- [Monitoring Oracle Databases using Change Tracker](https://kb.netwrix.com/8282)
- [How to Configure The FAST Cloud Integration With Proxy Internet Settings](https://kb.netwrix.com/8295)
- [How to Move Your Linux Server MongoDB Database to a Windows Server?](https://kb.netwrix.com/8283)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://kb.netwrix.com/8164)

**Attachments:**
- [image2018-7-23_14-51-29.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKXy&d=%2Fa%2F4u000000M01l%2FEP5oJdhdbI9Yg.AfVi1GiCXfCztPdgM0PS8OZnbym0M&asPdf=false)
- [image2018-7-23_14-50-59.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKQp&d=%2Fa%2F4u000000Lzgn%2Ft7LhHwI4_4WryjAU2EN2q_RoLjD04VPuVyqBVpTTNWE&asPdf=false)