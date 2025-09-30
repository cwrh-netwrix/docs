---
description: >-
  This article provides step-by-step instructions for converting your MongoDB from the MMAPv1 storage engine to the WiredTiger storage engine for Change Tracker.
keywords:
  - MongoDB
  - WiredTiger
  - Change Tracker
  - database conversion
  - backup
sidebar_label: Convert MongoDB to WiredTiger
tags: []
title: How to Convert your MongoDB from MMAPv1 to WiredTiger for Change Tracker
knowledge_article_id: kA04u0000000JVpCAM
products:
  - change-tracker
---

# How to Convert your MongoDB from MMAPv1 to WiredTiger for Change Tracker

## Overview

The MMAPv1 MongoDB storage engine pre-allocates hard drive space to accommodate expansion. This can lead to a large amount of space reserved when the database itself is actually quite small. The WiredTiger storage engine has built-in compression and does not need to reserve space ahead of time, making it a much leaner storage engine and faster for searching indexed information.

> **WARNING:** It is highly recommended to do this with a Netwrix support member. Incorrect implementation could lead to loss of data! If possible, please contact us so that we may assist you with this conversion!

## Backing Up the Current Database

This is very important in case something goes wrong. You want to have a backup of the database. The backup is also where you will be restoring the database from into the new storage engine. Make sure you have slightly more space than the size of your database for this backup.

1. Connect to the server that hosts the Change Tracker software.
2. Open **IIS**.
3. Stop the **IIS Server**.
4. Open **Command Prompt** (Run as Administrator).
5. Browse to the location of the MongoDB folder:

   ```plaintext
   cd C:\Program Files\NNT Change Tracker Suite\Gen7\MongoDB\bin
   ```

   This is the default location, but if Change Tracker is installed on a different partition, please make the necessary changes to the **folder path**.

6. Run the following command to start the MongoDB backup:

   ```plaintext
   mongodump -d NNTHubService -o C:\MongoBackup
   ```

   The location in which you store the backup may differ, so you will need to change the **folder path** accordingly.

7. Wait for the MongoDB backup to complete. As mentioned previously, this may take hours due to the size of the current database.
8. Once you have confirmed that the MongoDB backup has finished successfully, open another **Command Prompt** (Run as administrator).
9. Stop the MongoDB service:

   ```plaintext
   net stop MongoDB
   ```

   The following command will stop the MongoDB service.

## Making the Database Configuration Changes

This will make the changes to the necessary configuration files for the MongoDB that will convert the storage engine to WiredTiger when we restore the backed-up database in the future steps.

1. Browse to the following folder using **Windows Explorer**:

   **File Location:**

   ```plaintext
   C:\Program Files\NNT ChangeTracker Suite\Gen7\MongoDB\conf
   ```

   This is the default location, but if Change Tracker is installed on a different partition, please make the necessary changes to the **folder path**.

2. Locate the **mongod.conf** file.
3. Right-click the **mongod.conf** file and press **Edit**.

   **mongod.conf:**

   Change the **storageEngine** parameter to the following:

   ```plaintext
   storageEngine=wiredTiger
   ```

   This is case sensitive, so ensure that your **configuration** matches what is shown above.

4. **Save** and **Close** the **mongod.conf** file.

## Preparing for and Restoring the Mongo Database

This section will make all of the necessary preparations for the restoration of the database, as well as restore the database, converting it to the new storage engine.

1. Open **Command Prompt** (Run as administrator).
2. You will now need to delete or move the existing Mongo **db** folder to another directory. You can use the following command to move the directory:

   ```plaintext
   move "C:\Program Files\NNT Change Tracker Suite\MongoDB\DB" "C:\Program Files\NNT Change Tracker Suite\MongoDB\DB.old"
   ```

   We recommend moving the folder temporarily and then deleting it once it has been verified that the data was converted successfully. Note that you will need to accommodate the proper hard drive space to do this.

3. Create a new Mongo **db** folder using the following command:

   ```plaintext
   mkdir "D:\Program Files\NNT Change Tracker Suite\MongoDB\db"
   ```

4. Open **Command Prompt** (Run as Administrator).
5. Start the MongoDB service:

   ```plaintext
   net start MongoDB
   ```

   This will start the MongoDB service.

6. Start the MongoDB restore:

   ```plaintext
   mongorestore -d NNTHubService C:\MongoBackup\NNTHubService
   ```

   The location in which you stored the backup may differ, so you will need to change the **folder path** accordingly.

7. Wait for the MongoDB restore to complete. As mentioned previously, this may take hours due to the size of the current database.
8. Once you have confirmed that the MongoDB backup has finished successfully, open **IIS**.
9. Restart the **IIS server**.

You're done! Your MongoDB should now be converted.

## Related Articles

- [How to Backup / Restore / Move your MongoDB Database](https://kb.netwrix.com/8150)
- [How to move your Linux Server MongoDB Database to a Windows server?](https://kb.netwrix.com/8283)
- [How to Change the Admin Password of your Mongo Database](https://kb.netwrix.com/8310)
- [Supporting Documents for Hub Server Problems](https://kb.netwrix.com/8273)