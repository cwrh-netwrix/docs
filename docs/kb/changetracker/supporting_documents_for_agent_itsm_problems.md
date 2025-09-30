---
description: >-
  This article provides guidance on the necessary information to submit when experiencing issues related to Agents or the ITSM Module.
keywords:
  - Agent issues
  - ITSM Module
  - troubleshooting
sidebar_label: Supporting Documents for Agent Issues
tags: []
title: Supporting Documents for Agent / ITSM Problems
knowledge_article_id: kA04u0000000JbFCAU
products:
  - activity-monitor
---

# Supporting Documents for Agent / ITSM Problems

## General Information to Provide

This document is to assist the end user in providing us with as much information as possible about problems related to Agents or the ITSM Module.

### Information to Provide

This is some of the general information Netwrix would like to know regardless of what the problem is:

1. **A detailed description of the issue that is being experienced. If a screenshot/video can be captured, this will also be useful, as well as when the issue was noticed.**
   
2. **What version of the Netwrix Hub Server are you using?**

3. **Have there been any recent updates or patches to the operating system?**
   - If so, what was updated?
   - How recently did it occur?
   - Can information about what was installed be provided?
   - Was the system rebooted after the patch?

4. **Information about the scope of the problem**
   - Is the issue related to a specific group of devices hosting the same application? Are all agents of this group impacted or is it only a few of them?
   - Is the issue related to a specific group of devices hosting the same operating system? Are all agents of this group impacted or is it only a few of them?
   - How many agents are impacted?

5. **If all agents are offline, were any of the following network settings changed?**
   - SSL/TLS Version
   - Microsoft IIS Services
   - IIS Certificate
   - IIS Website Port Binding
   - MongoDB Version
   - .NET Framework / Mono Runtime Version

## Linux Gen7Agent / ExpressAgent Information and Attachments

If the issue is related to a Linux Agent, here is the information that needs to be provided in addition to the general information:

1. **Compress and Attach `/var/messages` file to the ticket.**

2. **Compress and Attach `/var/nnt/` folder to the ticket.**

3. **Compress and Attach `/opt/nnt` folder to the ticket.**

4. **Output of `uname -a`**
   ```
   Example Output:
   [root@Netwrix-LINUX-CENTOS7-D3 ~]$ uname -a
   Linux Netwrix-LINUX-CENTOS7-D3 3.10.0-327.el7.x86_64 #1 SMP Thu Nov 19 22:10:57 UTC 2015 x86_64 x86_64 x86_64 GNU/Linux
   ```

5. **Output of `ps aux | grep nnt-`**
   ```
   Example Output:
   [root@Netwrix-LINUX-CENTOS7-D3 ~]$ ps aux | grep nnt
   root+ 1118 0.0 0.1 112648 968 pts/0 S+ 11:06 0:00 grep --color=auto nnt
   root 2216 0.1 0.9 47684 4796 ? S Aug28 21:52 /usr/bin/sysdig --unbuffered -c /tmp/tmp4ce2ccea.tmp NNT_AGENT_FILE_TRACER /etc/|/opt/nnt/test/|/var/nnt/test/
   root 29339 0.0 22.4 863768 112640 ? Sl Aug08 31:14 /opt/mono/bin/mono /opt/mono/lib/mono/4.5/mono-service.exe -d:/opt/nnt/gen7agent/bin -l:/var/run/nntgen7agent.pid /opt/nnt/gen7agent/bin/Gen7Agent.Service.exe
   ```

6. **Output of `rpm -qa | grep nnt-`**
   ```
   Example Output:
   [root@Netwrix-LINUX-CENTOS7-D3 ~]$ rpm -qa | grep nnt-
   nnt-changetracker-gen7agent-7.0.0.29-82.noarch
   nnt-mono-5.2.0.224-5.x86_64
   ```

## Windows Gen7Agent / ITSM Information and Attachments

If the issue is related to a Windows Agent, here is the information that needs to be provided in addition to the general information:

1. **Compress and Attach `C:\ProgramData\NNT` folder to the ticket.**
   
   If the issue is related to an ITSM Module, please attach the following file as well:
   ```
   C:\Program Files\NNT Change Tracker Suite\Gen7SyncService\gen7syncservice.exe.config
   ```

2. **Text output of System Information (`msinfo32`)**
   Here is how to gather this information:
   1. Go to **Start** > **Run**, type `msinfo32.exe`, and hit **Enter**.
   2. Select **File** > **Save**.
   3. Browse to an appropriate location to save the file.
   4. Set the filename and ensure the save as type is **System Information File (*.NFO)**.
   5. Click the **Save** button.
   6. Provide the file in the ticket.

3. **Windows Event Logs (Windows Logs > Application & Windows Logs > System)**
   Here is how to gather this information:
   1. Go to **Start** > **Run**, type `eventvwr`, and hit **Enter**.
   2. Click on **Action** > **Create Custom View**.
   3. In the custom view filter, dial in the time by going to **Logged** > **Custom Range**.
   4. After selecting your range, select **By Log** and select **Event Logs** as **Application, System**.
   5. Click **OK** and name the view as you would like. Click **OK** again.
   6. Select the created view in the left side panel and click on **Action** > **Save All Events in Custom View As**.
   7. Set the filename and ensure the save as type is **Event Files (*.evtx)** > Click **OK**.
   8. For Display Information, select **Display Information For These Languages** > **English**.
   9. Provide the file in the ticket.

4. **IIS Server Logs (If Enabled)**
   If this is enabled, the default location is `C:\inetpub\logs\LogFiles`.

5. **Windows Firewall Logs (If Enabled)**
   If this is enabled, the default location is `%systemroot%\system32\LogFiles\Firewall\pfirewall.log`.

## Related Articles

- [How to Configure The FAST Cloud Integration With Proxy Internet Settings](https://kb.netwrix.com/8295)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://kb.netwrix.com/8164)
- [Supporting Documents for Hub Server Problems](https://kb.netwrix.com/8273)
- [Change Tracker Gen 7 Change Log / Update Log / ReadMe.txt Documents for Agent/Hub](https://kb.netwrix.com/8368)
- [Rolling-Log Fix: "Hub Offline, connection retries exhausted (The remote server returned an error: (403) Forbidden.)"](https://kb.netwrix.com/8307)