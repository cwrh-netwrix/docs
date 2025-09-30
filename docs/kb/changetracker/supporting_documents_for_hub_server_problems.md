---
description: >-
  This article provides guidance on the information and documents needed to troubleshoot issues related to the Netwrix Hub Server.
keywords:
  - Netwrix Hub Server
  - troubleshooting
  - support documentation
sidebar_label: Hub Server Support Documents
tags: []
title: Supporting Documents for Hub Server Problems
knowledge_article_id: kA04u0000000JdtCAE
products:
  - change-tracker
---

# Supporting Documents for Hub Server Problems

## General Information to Provide

This document aims to assist the end user in providing us with as much information as possible about problems related to the Netwrix Hub Server. This is some of the general information [Netwrix Technical Support](https://www.netwrix.com/sign_in.html?rf=tickets.html#/open-a-ticket) would like to know regardless of what the problem is.

1. **A detailed description of the issue that is being experienced. If a screenshot/video can be captured, this will also be useful, as well as when the issue was noticed.**
2. **What version of the Netwrix Hub Server are you using?**
3. **Have there been any recent updates, or patches to the operating system?**
   - If so, what was updated?
   - How recently did it occur?
   - Can information about what was installed be provided?
   - Was the system rebooted after the patch?
4. **Is the issue related to a hub component (such as saved queries, compliance reports, or configuration templates)? If so, please answer the following:**
   - Was that hub component previously working properly?
5. **Is the issue related to the performance of the hub server (such as the interface is responding slowly, event filters are taking a long time to show results)? If so, please answer the following:**
   - What was the last action or change made to the system prior to experiencing this type of performance?
   - How many agents are currently reporting to the system?
   - How long has the server been displaying this behavior?
6. **Is the issue related to the Netwrix Hub Server being down or unreachable? If so, which of the following is being experienced?**
   - Cannot Log In
   - Cannot Start IIS/MongoDB Services
   - Cannot Reach Web Console
   - The Server Itself is Unreachable via RDP or SSH
7. **Were any of the following network settings changed recently?**
   - SSL/TLS Version
   - Microsoft IIS Services
   - IIS Certificate
   - IIS Website Port Binding
   - MongoDB Version
   - .NET Framework / Mono Runtime Version

## Key Information and Attachments

These are the key log files we will need to view for the Netwrix Hub Server in addition to the General Information. In addition to these items, please also attach the items below which are requested based on the platform your Netwrix Hub Server is installed on.

1. **Compress / Zip and Send the following folder containing the Netwrix Hub Log**
   - Default Linux Hub Location:  
     `/opt/nnt/hubservice/log/`
   - Default Windows Hub Location:  
     `C:\inetpub\wwwroot\Change Tracker Generation 7 Hub\log\`
2. **Compress / Zip and Send the following folder containing the MongoDB Log**
   - Default Linux Hub Location:  
     `/var/log/mongodb`
   - Default Windows Hub Location:  
     `C:\ProgramData\Change Tracker Generation 7\MongoDB\log`

## Windows Based Platform Hub Attachments

These are the key files we will need to view for the Netwrix Hub Server in addition to the General Information and Key Information for a Windows based platform.

1. **Text output of System Information (msinfo32)**

   Here is how to gather this information:

   1. Go to **Start > Run**. Type `msinfo32.exe` and hit **Enter**.
   2. Select **File > Save**
   3. Browse to an appropriate location to save the file
   4. Set the filename and ensure the save as type is **System Information File (*.NFO)**
   5. Click **Save**
   6. Provide the file in the ticket

2. **Windows Event Logs (Windows Logs > Application & Windows Logs > System)**

   Here is how to gather this information:

   1. Go to **Start > Run**. Type `eventvwr` and hit **Enter**.
   2. Click **Action > Create Custom View**
   3. In the custom view filter, dial in the time frame by going to **Logged > Custom Range**
   4. After selecting your range, select **By Log** and select **Event Logs** as **Application**, **System**
   5. Go ahead and click **OK** and **Name The View** as you would like. Click **OK** again.
   6. Select the created view in the left side panel and click on **Action > Save All Events in Custom View As**
   7. Set the filename and ensure the save as type is **Event Files (*.evtx)**. Click **OK**
   8. **For Display Information > Display Information For These Languages > English**
   9. Provide the file in the ticket

3. **IIS Server Logs (If Enabled)**

   If this is enabled, the default location is `C:\inetpub\logs\LogFiles`

4. **Windows Firewall Logs (If Enabled)**

   If this is enabled, the default location is `%systemroot%\system32\LogFiles\Firewall\pfirewall.log`

## Linux Based Platform Hub Attachments

These are the key files we will need to view for the Netwrix Hub Server in addition to the General Information and Key Information for a Linux based platform.

1. **Compress and Attach `/var/messages` file to the ticket**
2. **Compress and Attach the Netwrix Mono log directory**
   - Default location:  
     **INSERT LOCATION HERE**
3. **Compress and Attach the Netwrix NGINX log directory**
   - Default Location:  
     `/var/log/nginx`
4. **Attach the Output of `uname -a`**
5. **Attach the Output of `ps aux | grep nnt-`**
6. **Attach the Output of `rpm -qa | grep nnt-`**