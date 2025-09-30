---
description: >-
  This article provides step-by-step instructions on how to reset the admin password for a MongoDB database when authentication is enabled.
keywords:
  - MongoDB
  - admin password reset
  - authentication
sidebar_label: Change Admin Password for MongoDB
tags: []
title: How to Change Admin Password for Mongo Database
knowledge_article_id: kA04u0000000JgJCAU
products:
  - change-tracker
---

# How to Change Admin Password for Mongo Database

## Overview

This article provides step-by-step instructions on how to reset the admin account password for MongoDB when authentication is enabled.

## Instructions

**IMPORTANT:** This process requires logon to the server that has the MongoDB installed.

**Step 1.** Stop the MongoDB Service in Task Manager.

**Step 2.** Disable MongoDB Authentication:

1. Navigate to `C:\Program Files\NNT Change Tracker Suite\Gen7\MongoDB\conf`.
2. Edit the **mongo.conf** file.
3. Comment each line out using the **#** symbol except for **logpath**, **dbpath**, and **storageEngine**:

   ![A screenshot of a computer showing MongoDB configuration](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka04u000000Qmcb&feoid=00N0g000004CA0p&refid=0EM4u000007cf9k)

**Step 3.** Start the MongoDB Service in Task Manager.

**Step 4.** Open the Mongo shell by running the following program: `C:\Program Files\NNT Change Tracker Suite\Gen7\MongoDB\bin\mongo.exe`.

You will see the following window:

![Mongo shell window](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka04u000000Qmcb&feoid=00N0g000004CA0p&refid=0EM4u000007cf9V)

**Step 5.** Enter the following command:

```
use admin
```

**Step 6.** Enter one more command:

```
db.changeUserPassword("admin", "passWord121")
```

**NOTE:** The command above uses **passWord121** as an example password; be sure to modify this to a password you wish to use.

Changing the password should take you to a new line without an output:

![Password change confirmation](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka04u000000Qmcb&feoid=00N0g000004CA0p&refid=0EM4u000007cf9f)

**Step 7.** Close the **mongo.exe** window and stop the MongoDB Service in Task Manager.

**Step 8.** Re-enable MongoDB Authentication:

1. Navigate to `C:\Program Files\NNT Change Tracker Suite\Gen7\MongoDB\conf`.
2. In the **mongo.conf** file, remove all **#** symbols from each of the lines. Save changes:

   ![MongoDB configuration with authentication enabled](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka04u000000Qmcb&feoid=00N0g000004CA0p&refid=0EM4u000007cf9u)

**Step 9.** Start the MongoDB Service in Task Manager.

**Step 10.** Open Command Prompt and verify your MongoDB logon using your authentication command. Below is an example:

```
"C:\Program Files\NNT Change Tracker Suite\Gen7\MongoDB\bin\mongo" --ssl --sslCAFile C:\mongo.crt --host 192.168.1.X --port 27017 -u admin -p passWord121 --authenticationDatabase admin --sslAllowInvalidCertificates
```

**NOTE:** Parameters highlighted with **blue** must reflect the **IP of the server hosting the MongoDB** and the **new password** entered in the command above.

## Related Articles

- [How to Backup / Restore / Move your MongoDB Database](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JWTCA2.html)
- [Monitoring Oracle Databases using Change Tracker](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JehCAE.html)
- [How to move your Linux Server MongoDB Database to a Windows server?](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JemCAE.html)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JXHCA2.html)