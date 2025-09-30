---
description: >-
  This article provides a step-by-step guide on how to move your MongoDB database from a Linux server to a Windows server while retaining all data.
keywords:
  - MongoDB
  - Linux
  - Windows
  - Change Tracker
  - Database Migration
sidebar_label: Move MongoDB Database
tags: []
title: How to Move Your Linux Server MongoDB Database to a Windows Server
knowledge_article_id: kA04u0000000JemCAE
products:
  - change-tracker
---

# How to Move Your Linux Server MongoDB Database to a Windows Server

## Overview

Are you setting up a new server to host your Change Tracker Software? Were you previously hosting on a Linux Server and are looking to move over to a Windows Server? Do you want to retain all of your old data (events, agents, config, etc.)? If so, follow the guide below.

First of all, read through pages 50-52 of the attached guide to ensure that all of the Change Tracker server installation prerequisites are in place. Once that is confirmed, please proceed with the steps below:

## Instructions

1. Connect to the Linux server that hosts your Change Tracker software.
2. Stop the **NNTHubService** and **NNTGen7Agent** services. (See Screenshot Below):
   - **Commands:**
     ```plaintext
     service nnthubservice stop
     service nntgen7agent stop
     ```
   ![Stop Services Screenshot](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKbX&d=%2Fa%2F4u000000LznX%2FBUP4PNGsa.mRI1H28aN.VFbe2x.oUJ6.68dgKNNPOVQ&asPdf=false)

3. Create a directory to hold the MongoDump in your preferred location (This will need to be moved to your Windows Server). (See Screenshot Below):
   ![Create Directory Screenshot](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKbI&d=%2Fa%2F4u000000LzX8%2FxudyTz8gVLPj.7xXYQIgPAp4jbgO4Wz8Wvjgl4Ml4JA&asPdf=false)

4. Change directory to the newly created directory to begin exporting the database. See Example:
   ```plaintext
   cd /example/MongoDump
   ```

5. Once you are in the directory where you wish to export the database, enter the following command:
   ```plaintext
   mongodump -d NNTHubService
   ```
   ![MongoDump Screenshot](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKTy&d=%2Fa%2F4u000000M01n%2Fy_oHddJYhiw071SC6.Z3EMLN2jdVpQZsIE_aSVeOux4&asPdf=false)

6. Connect to the server where Change Tracker is going to be installed via RDP.
7. Install **Change Tracker software**.
8. Navigate through the installation screens, ensuring that you select the correct **Database Storage Engine** option when prompted. The two options you will be presented with are either **Use default MMAPv1 storage engine** or **Use new WiredTiger storage engine**. The storage engine you choose must match the storage engine of your existing database stored on your old server. If you're not sure what to look for, please contact Netwrix Support for clarification.
   ![Database Storage Engine Screenshot](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKbb&d=%2Fa%2F4u000000M07s%2FxrlFByVu41_.oGy23.tMF1YzfTqOaFTLTBRO5qDBocQ&asPdf=false)

9. Open a **Command Prompt**, ensuring that you run it as an **Administrator**.
10. Enter the following command:
    ```plaintext
    iisreset /stop
    ```
11. Enter the following command:
    ```plaintext
    sc stop MongoDB
    ```
12. Enter the following command:
    ```plaintext
    cd C:\ProgramData\Change Tracker Generation 7\MongoDB
    ```
13. Enter the following command:
    ```plaintext
    rmdir db /s
    ```
14. Enter **Y** and **Enter** when prompted.
15. Enter the following command:
    ```plaintext
    mkdir db
    ```
16. Enter the following command:
    ```plaintext
    cd C:\Program Files\NNT Change Tracker Suite\Gen7\MongoDB\bin
    ```
17. Enter the following command:
    ```plaintext
    sc start MongoDB
    ```
18. Enter the following command:
    ```plaintext
    mongorestore.exe C:\MongoDump\dump\NNTHubService -d NNTHubService
    ```
    ![MongoRestore Screenshot](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK6S&d=%2Fa%2F4u000000Lzgu%2FsfM9Diw_LTBdaq61vj.C.Lcq5DIgx5n6DX7jGV5eWLI&asPdf=false)

Allow some time for the **database to re-index**. Once complete, the word **done** should appear in the command prompt window.

19. Enter the following command:
    ```plaintext
    iisreset /start
    ```
20. Close the command prompt window.

Ensure that you can **login** to the **Change Tracker** software and browse to the **Settings** screen.

If at this point, you see the error below in the bottom right-hand corner of the screen, please follow the steps below:

### Error: “Key not valid in specified state”

1. Open a **Command Prompt**, ensuring that you run it as an **Administrator**.
2. Enter the following command:
    ```plaintext
    iisreset /stop
    ```
3. Enter the following command:
    ```plaintext
    cd C:\Program Files\NNT Change Tracker Suite\Gen7\MongoDB\bin
    ```
4. Enter the following command:
    ```plaintext
    mongo.exe
    ```
5. Enter the following command:
    ```plaintext
    show dbs
    ```
6. Enter the following command:
    ```plaintext
    use NNTHubService
    ```
7. Enter the following command:
    ```plaintext
    db.RemoteCredentials.update({},{$set: { "pa.Password": "" }}, { multi: true });
    ```
8. Enter the following command:
    ```plaintext
    exit
    ```
9. Enter the following command:
    ```plaintext
    iisreset /start
    ```
10. Close the command prompt window.
    ![Command Prompt Screenshot](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKI9&d=%2Fa%2F4u000000M07x%2Fawr.kmcz0MGjljCiZxVtDs0ww6kUi29F511xDaH_IBs&asPdf=false)

Ensure that you can login to the Change Tracker software.

Once the above has been completed, load up the Change Tracker login screen and attempt to login to the software. If you changed the admin user's password to something else on the old server, this should still work.

If this does not resolve the issue and you are still seeing:

### Error: “Key not valid in specified state”

Please try the following:

1. Open a **Command Prompt**, ensuring that you run it as an **Administrator**.
2. Enter the following command:
    ```plaintext
    iisreset /stop
    ```
3. Enter the following command:
    ```plaintext
    cd C:\Program Files\NNT Change Tracker Suite\Gen7\MongoDB\bin
    ```
4. Enter the following command:
    ```plaintext
    mongo.exe
    ```
5. Enter the following command:
    ```plaintext
    show dbs
    ```
6. Enter the following command:
    ```plaintext
    use NNTHubService
    ```
7. Enter the following command:
    ```plaintext
    db.HubConfigData.remove({ "Key" : "SMTP Password" });
    ```
8. Enter the following command:
    ```plaintext
    db.HubConfigData.remove({ "Key" : "SMTP Password2" });
    ```
9. Enter the following command:
    ```plaintext
    exit
    ```
10. Enter the following command:
    ```plaintext
    iisreset /start
    ```

## Related Articles

- [How to Backup / Restore / Move your MongoDB Database](https://kb.netwrix.com/8150)
- [How to Move Your Linux Server MongoDB Database to a Windows Server?](https://kb.netwrix.com/8283)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://kb.netwrix.com/8164)
- [How to Change the Admin Password of your Mongo Database](https://kb.netwrix.com/8310)

**Attachments:**
- [image2018-6-7_16-33-46_123213.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKbg&d=%2Fa%2F4u000000M03T%2FV88Qg_0PJk1h9u3KGHtU7vgf5MpB.JqjDXg6dYOMJv4&asPdf=false)
- [image2018-6-7_16-30-43.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKV5&d=%2Fa%2F4u000000M034%2FRkZbJD7omk3DnuR1JVLt.yMknBEeI4ej6QzIz9C6q60&asPdf=false)
- [Change_Tracker_-_Move_MongoDB_-_1.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK9g&d=%2Fa%2F4u000000M087%2FIWBxMeRNPk7vhxqEBZUbnIn_iVOJZF2kKlzBiatkC7Q&asPdf=false)
- [Linux_-_Mongo_Dump.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKD4&d=%2Fa%2F4u000000LzwD%2FTER_Gm_rH.Y3TxwM6zZus94k0wGw7NoIRap8oSOkKKI&asPdf=false)
- [Linux_-_Create_Directory.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKIc&d=%2Fa%2F4u000000M08C%2FlK6Jmcwb2OBRcl.nI_RRCEFQDN2pizPLre75iBaPR3o&asPdf=false)
- [Linux_-_Stop_Services.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKBR&d=%2Fa%2F4u000000M04V%2F0VXU16CY.BBCRQN4RJmGx0LLOcwdb3LITiLOHn8qJA8&asPdf=false)