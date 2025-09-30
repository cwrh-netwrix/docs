---
description: >-
  This article provides step-by-step instructions on how to backup, restore, and move your MongoDB database while retaining all data for the Change Tracker Software.
keywords:
  - MongoDB
  - Change Tracker
  - backup
  - restore
  - server migration
sidebar_label: Backup and Restore MongoDB Database
tags: []
title: How to Backup, Restore, and Move Your MongoDB Database
knowledge_article_id: kA04u0000000JWTCA2
products:
  - activity-monitor
---

# How to Backup, Restore, and Move Your MongoDB Database

## Question

How to make a backup of MongoDB, restore MongoDB, or set up a new server to host your Change Tracker Software and retain all of your old data (events, agents, config etc.)?

> **IMPORTANT:** For additional information on Change Tracker installation prerequisites, refer to the following article: [System Requirements Overview — v7.6](https://helpcenter.netwrix.com/bundle/ChangeTracker_7.6/page/Content/ChangeTracker/Requirements/Overview.htm).

## Answer

Follow the procedures below to backup your MongoDB, restore MongoDB, or set up a new server to host your Change Tracker Software.

> **IMPORTANT:** Verify the MongoDB versions match in both your current and target servers.

### Backup MongoDB Database

First, you need to backup your MongoDB database. For that:

1. Connect to the server which hosts your Change Tracker software via RDP.
2. Open a **Command Prompt**, ensuring that you run it as an **Administrator**.
3. Enter the following command: `iisreset /stop`.
4. Enter the following command: `cd C:\Program Files\NNT Change Tracker Suite\Gen7\MongoDB\bin`.
5. Enter the following command: `mongodump.exe -d NNTHubService -o C:\MongoDump --gzip`.

![Backup MongoDB Database](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka0Qk0000005oqb&feoid=00N0g000004CA0p&refid=0EM4u000008pZbw)

Take a copy of the following folders and transfer them to the new server:

- `C:\MongoDump`
- `C:\inetpub\wwwroot\Change Tracker Generation 7 (NetCore) Hub\Configs\DPKeys`
- `C:\ProgramData\Change Tracker Generation 7 (NetCore)\MongoDB\db`

### Prepare Target Server

1. Connect to the server where Change Tracker is going to be installed via RDP.
2. Run the **Change Tracker** installer and ensure you are installing the same version as you have been using on the old server.
3. On the **Database Storage Engine** step, make sure that this option matches the storage engine of your existing database stored on your old server. If you're not sure what to look for, please contact NNT Support for clarification.

![Prepare Target Server](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka0Qk0000005oqb&feoid=00N0g000004CA0p&refid=0EM4u000008pZc1)

### Restore MongoDB Database (New or Existing Server)

The steps below apply regardless of whether you are restoring the database to an existing server or have decided to move it to a new server using the steps above.

1. Open a **Command Prompt**, ensuring that you run it as an **Administrator**.
2. Enter the following command: `iisreset /stop`.
3. Enter the following command: `sc stop MongoDB`.
4. Enter the following command: `cd C:\ProgramData\Change Tracker Generation 7 (NetCore)\MongoDB`.
5. Enter the following command: `rmdir db /s`.
6. Enter `Y` and press **Enter** when prompted.
7. Enter the following command: `mkdir db`.
8. Enter the following command: `cd C:\Program Files\NNT Change Tracker Suite\Gen7\MongoDB\bin`.
9. Enter the following command: `sc start MongoDB`.
10. Enter the following command: `mongorestore.exe C:\MongoDump\NNTHubService -d NNTHubService --gzip`.

![Restore MongoDB Database](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka0Qk0000005oqb&feoid=00N0g000004CA0p&refid=0EM4u000008pZc6)

Allow some time for the database to re-index. Once completed, the word **done** will appear in the command prompt window.

1. Enter the following command: `iisreset /start`.
2. Close the command prompt window.

Ensure that you can log in to **Change Tracker** and go to the **Settings** page.

### Troubleshooting

If you see the error below on the **Settings** screen, follow the troubleshooting steps below.

```
Error: Key not valid in specified state
```

1. Open a **Command Prompt**, ensuring that you run it as an **Administrator**.
2. Enter the following command: `iisreset /stop`.
3. Enter the following command: `cd C:\Program Files\NNT Change Tracker Suite\Gen7\MongoDB\bin`.
4. Enter the following command: `mongo.exe`.
5. Enter the following command: `show dbs`.
6. Enter the following command: `use NNTHubService`.
7. Enter the following command: `db.RemoteCredentials.update({},{$set: { "pa.Password": "" }}, { multi: true });`.
8. Enter the following command: `exit`.
9. Enter the following command: `iisreset /start`.
10. Close the command prompt window.

![Troubleshooting](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka0Qk0000005oqb&feoid=00N0g000004CA0p&refid=0EM4u000008pZcB)

Ensure that you can log in to the Change Tracker software.

Once the above has been completed, try to log in to Change Tracker. If you changed the admin user's password to something else on the old server, this should still work.

> **NOTE:** If this does not resolve the issue and you are still seeing the `Key not valid in specified state` error, try the following:

1. Open a **Command Prompt**, ensuring that you run it as an **Administrator**.
2. Enter the following command: `iisreset /stop`.
3. Enter the following command: `cd C:\Program Files\NNT Change Tracker Suite\Gen7\MongoDB\bin`.
4. Enter the following command: `mongo.exe`.
5. Enter the following command: `show dbs`.
6. Enter the following command: `use NNTHubService`.
7. Enter the following command: `db.HubConfigData.remove({ "Key" : "SMTP Password" });`.
8. Enter the following command: `db.HubConfigData.remove({ "Key" : "SMTP Password2" });`.
9. Enter the following command: `exit`.
10. Enter the following command: `iisreset /start`.
11. Close the command prompt window.