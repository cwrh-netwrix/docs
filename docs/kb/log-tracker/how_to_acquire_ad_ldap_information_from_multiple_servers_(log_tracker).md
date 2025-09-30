---
description: >-
  This article provides a step-by-step guide on how to acquire Active Directory (AD) and LDAP information from multiple servers using the Log Tracker.
keywords:
  - LDAP
  - Active Directory
  - Log Tracker
sidebar_label: Acquire AD / LDAP Information
tags: []
title: How to Acquire AD / LDAP Information From Multiple Servers (Log Tracker)
knowledge_article_id: kA04u0000000Jd0CAE
products:
  - log-tracker
---

# How to Acquire AD / LDAP Information From Multiple Servers (Log Tracker)

## Overview

As of Version 5-7-2, the LDAP adapter is a standard component of all Log Tracker Server installations and can be found in the **System > Tools > Auto-Update > LDAP** tab of the web interface. This adapter periodically gathers and synchronizes user information from an Active Directory Server, which is useful for forensics, automatic creation of user lists, and other applications.

Normally, the operator configures the LDAP adapter to obtain data from one of the replicated AD servers at the operator's site. However, for sites that may have multiple domains, it is also possible to gather data from multiple sites, as described in this note.

## Instructions

To modify the system to gather LDAP server information from multiple sites, the administrator modifies the `C:\Program Files (x86)\NNT Log Tracker Suite\net-user\gen-ldap.bat` using Notepad or another text editor.

*The `gen-ldap.bat` file is the batch file that actually acquires data from Active Directory, launched via the **System > Tools > Auto-Update > LDAP** tab and scheduled to run periodically via the **System > Tools > Schedule** screen. The user modifies the batch file to generate a standard "ldif" listing from multiple servers, using the MS `ldifde.exe` program.*

### Step-by-step Guide

1. On the Log Tracker Server, verify that the `ldifde.exe` program is in the standard search path of processes. This is a standard MS program that is built into Windows 2008 platforms and later.  
   *If the `ldifde.exe` program is not in the user's path or not found on the platform, obtain a copy of the program and copy it to the `C:\Program Files (x86)\NNT Log Tracker Suite\system` folder.*

2. On the Log Tracker Server, edit the `C:\Program Files (x86)\NNT Log Tracker Suite\net-user\gen-ldap.bat` file. (You can use **Notepad** or another text editor.)

3. Replace the contents of the above file (beneath the file comments) with the following specific commands, substituting "server1" and "server2" with the actual names of the AD servers at your site:

   ```plaintext
   REM: # # # # # # # # # #
   del /f ..\temp\ldap_tmp1.txt 2> NUL
   del /f ..\temp\ldap_tmp2.txt 2> NUL
   del /f %LDAP_OUTPUT_FILE% 2> NUL

   exe -s server1 -f ..\temp\ldap_tmp1.txt
   ldifde.exe -s server2 -f ..\temp\ldap_tmp2.txt

   type ..\temp\ldap_tmp1.txt >> %LDAP_OUTPUT_FILE%
   type ..\temp\ldap_tmp2.txt >> %LDAP_OUTPUT_FILE%
   REM: # # # # # # # # # #
   ```

4. After making the above changes and saving the `gen-ldap.bat` file, get a new LDAP listing via the **System > Tools > Auto-Update > LDAP** screen. Note that this may take several minutes to execute to completion.

5. After the program has executed to completion, check the process log and other log files available via links at the top of the screen. You can also look at the `C:\Program Files (x86)\NNT Log Tracker Suite\temp` folder to see the temporary files that were created by the process.

Note that online help for the `ldifde.exe` program is available, and other parameters may be necessary, such as a full username and password and domain. Also, note that you can add multiple different servers to the list (more than just two).

The `ldifde` program creates standard "ldif" formatted files, required and used by the Log Tracker Server. If errors occur, you can try executing the `gen-ldap.bat` file (after first setting the `LDAP_OUTPUT_FILE` environmental variable to a temporary file location) using an Administrative command prompt. This will display any errors encountered by the batch file to the console.

## Related Articles

- [How to Backup / Restore / Move your MongoDB Database](#)
- [How to move your Linux Server MongoDB Database to a Windows server?](#)
- [Supporting Documents for Hub Server Problems](#)
- [Rolling-Log Fix: "Hub Offline, connection retries exhausted (The remote server returned an error: (403) Forbidden.)"]( #)
- [Support for TLS 1.2 in the .NET Framework 3.5.1](#)