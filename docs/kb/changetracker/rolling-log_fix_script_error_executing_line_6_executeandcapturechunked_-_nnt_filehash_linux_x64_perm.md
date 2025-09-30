---
description: >-
  This article addresses the "Script error executing line 6: ExecuteAndCaptureChunked - /NNT_FILEHASH_LINUX_X64: Permission denied" issue and provides steps to resolve it.
keywords:
  - permission denied
  - Netwrix File Hash
  - Agentless Linux
sidebar_label: Rolling-Log Fix
tags: []
title: Rolling-Log Fix: "Script error executing line 6: ExecuteAndCaptureChunked - /NNT_FILEHASH_LINUX_X64: Permission denied” (AGENTLESS LINUX)
knowledge_article_id: kA04u0000000JclCAE
products:
  - change-tracker
---

# Rolling-Log Fix: "Script error executing line 6: ExecuteAndCaptureChunked - /NNT_FILEHASH_LINUX_X64: Permission denied” (AGENTLESS LINUX)

## What Does It Mean?

**This means that the Netwrix File Hash Binary does not have the permissions to execute or perform hashing on various filesystems.**

## How Can I Fix This / Should I Worry?

If you are receiving this error, the Netwrix Agent is NOT reporting to your hub. This is a critical error, and for monitoring to continue, it must be resolved. To resolve this error:

1. Navigate to the location where the **FILEHASH Binary** is being stored - By default, this is `/usr/bin`.
2. You must change the permissions of the **FILEHASH Binary** as well as the ownership of the file.

   > **NOTE:** 
   >
   > ```plaintext
   > [root@Netwrix-LINUX-CENTOS7-D1 ~]# chmod 775 /usr/bin/NNT_FILEHASH_LINUX_X64
   > ```
   >
   > ```plaintext
   > [root@Netwrix-LINUX-CENTOS7-D1 ~]# chown root:system /usr/bin/NNT_FILEHASH_LINUX_X64
   > ```

3. Once the above is completed, run the **FILEHASH Binary** from the command prompt. This will hash the `/etc` directory.

   > **NOTE:** 
   >
   > ```plaintext
   > [root@Netwrix-LINUX-CENTOS7-D1 ~]# /usr/bin/NNT_FILEHASH_LINUX_X64 -l10 -r -t -x /etc/*
   > ```

4. Once completed, you should be able to monitor all directories, as you have just given the **FILEHASH** root permissions. Go ahead and log into your **Change Tracker** interface, and press the **Start Tracker** button from the devices tab on the agentless device you have specified.