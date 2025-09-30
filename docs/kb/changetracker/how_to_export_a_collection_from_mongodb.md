---
description: >-
  This article provides a step-by-step guide on how to export or back up specific collections from MongoDB, which can be useful for development and troubleshooting.
keywords:
  - MongoDB
  - export collection
  - backup
sidebar_label: Export Collection from MongoDB
tags: []
title: How to Export a Collection from MongoDB
knowledge_article_id: kA04u0000000JdeCAE
products:
  - change-tracker
---

# How to Export a Collection from MongoDB

## Overview

This article is for when you need to export or back up specific collections from MongoDB. Exporting a collection may be useful to send over to Development when you've investigated a problem that lies within MongoDB.

## Instructions

1. First, access the Hub machine and determine where MongoDB is installed. The default location is:  
   **C:\Program Files\NNT Change Tracker Suite\Gen7\MongoDB**

2. To view collections, open Command Prompt as **Administrator** and change the directory to the **"bin"** folder in MongoDB.

3. Run the following command:  
   ```plaintext
   cd C:\Program Files\NNT Change Tracker Suite\Gen7\MongoDB\bin
   ```
   If you need to change drives, enter the command `X:`, replacing `X` with your drive letter.

4. Next, enter the following command to start MongoDB:  
   ```plaintext
   .\mongo.exe
   ```

5. Enter the following command to show the databases:  
   ```plaintext
   show dbs
   ```

6. Next, enter:  
   ```plaintext
   use NNTHubService
   ```

7. Enter the command:  
   ```plaintext
   show collections
   ```
   ![List of Collections in MongoDB](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJx6&d=%2Fa%2F4u000000LzbJ%2FHgxJc4BpDng1O.GyEWrin0x1u3huIDeX5DBxEnqeGRA&asPdf=false)

8. Once this is completed, you will be able to see all collections located in MongoDB.

9. Enter the following command to exit:  
   **exit**

10. To export a collection, enter the following command (edit according to your needs):  
    ```plaintext
    mongodump -d NNTHubService -c ENTER-COLLECTION-NAME -o "C:\ENTER PATH HERE"
    ```

11. In the **"ENTER-COLLECTION-NAME"** field, enter the collection you wish to export.

12. In the **"C:\ENTER-PATH-HERE"** field, enter the path you wish to export to.  
    ![Export Path Example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKWm&d=%2Fa%2F4u000000LzqU%2FMFqMjwW9QtYTPnIRi7ijVpkIoglv9JabT1eJhRycJh4&asPdf=false)

## List of All Collections in MongoDB

The following is a list of all collections in MongoDB:

- AgentTaskQueue
- AgentTasks
- BackgroundTaskQueue
- BackgroundTasks
- Counters
- DefaultFilters
- EventStats
- Events
- Hashes
- HubBackups
- HubConfigData
- IncomingEventQueue
- IpAddressActivity
- Licensing
- NotificationQueue
- Organizations
- PendingNotifications
- PerformanceData
- PlannedChangeDefinitions
- PlannedChangeInstances
- Policy
- RemoteCredentials
- SavedUserData
- Scheduled Policy
- Sequences
- SystemDirectory
- UserAuth
- UserAuthDetails
- UserRoles
- fs.chunks
- fs.files

## Related Articles

- [How to Backup / Restore / Move your MongoDB Database](https://kb.netwrix.com/8150)
- [Monitoring Oracle Databases using Change Tracker](https://kb.netwrix.com/8282)
- [How to move your Linux Server MongoDB Database to a Windows server?](https://kb.netwrix.com/8283)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://kb.netwrix.com/8164)
- [Vulnerability Tracker - How to Change a Task's Status through the GSM Database](https://kb.netwrix.com/8311)

## Attachments

- [6.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKXW&d=%2Fa%2F4u000000Lzil%2FNXwayDGS5wLR8Zo291IHw99VnNO_UlhICuzbuoFE1sw&asPdf=false)
- [5.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKVy&d=%2Fa%2F4u000000M02u%2Fd.J5dhW7bPuaUUTqK95NfIu.JhLbtwEB0kgGFT7pUwo&asPdf=false)
- [4.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKRY&d=%2Fa%2F4u000000M03v%2F_fJ4Wuc40KeZ_J_.DSqy4t_iUr2Biqkr7YZ1gfAZIz0&asPdf=false)
- [3.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKYN&d=%2Fa%2F4u000000LzOS%2Fw6cBqlLNTj2OWnVOzgyypD9mvLCGJxT.sKm7d18JbXk&asPdf=false)
- [2.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKYS&d=%2Fa%2F4u000000LzyJ%2FAUJnAS9x.yj.eaEmL6WxbL7R5cMNVXagPc_iZo_nK8o&asPdf=false)
- [1.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKWN&d=%2Fa%2F4u000000Lzhx%2Fo9L72Rtcif5BBvxyI_ZyXfDQpopFiNF3UMa4TjENbgM&asPdf=false)