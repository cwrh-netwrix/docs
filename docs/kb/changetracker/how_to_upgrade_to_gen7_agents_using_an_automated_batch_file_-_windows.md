---
description: >-
  This article provides step-by-step instructions on upgrading Netwrix Change Tracker 6.5 Agents to Gen7 Agents on Windows operating systems using a batch file and a shared directory.
keywords:
  - Netwrix Change Tracker
  - Gen7 Agents
  - batch file
  - Windows upgrade
  - installation guide
sidebar_label: Upgrade to Gen7 Agents
tags: []
title: How to Upgrade to Gen7 Agents Using an Automated Batch File - Windows
knowledge_article_id: kA04u0000000JXWCA2
products:
  - change-tracker
---

# How to Upgrade to Gen7 Agents Using an Automated Batch File - Windows

## Overview

This document will show you how to upgrade your **Netwrix Change Tracker 6.5 Agents** to the **Netwrix Gen7 Agents** in Windows-based operating systems using a batch file and a shared directory.

## Pre-Staging Guide

You will need to configure the following prior to attempting this:

1. Create a shared directory with a folder in it named **Netwrix Change Tracker**.

2. Download the following zip file, and extract it. Copy the **gen7upgrade-windows-new** folder into the **Netwrix Change Tracker** shared folder created above.  
   **NOTE:** This folder contains all installers, batch files, and required files for the installation. Please copy its entirety to the created drive.

   Here is the Zip Folder containing the upgrade files and script:  
   **NOTE - THE NPP EXE INSTALLERS ARE FOR NOTEPAD++ NOT CHANGE TRACKER. THE CHANGE TRACKER FILES ARE IN THE .ZIP FILE.**

   ![ZIP Folder to Download](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJrz&d=%2Fa%2F4u000000Lzsd%2FBurJF_bIoNw3JzJwCGWLeAlup_tkmAgHLN1IPXnwX_M&asPdf=false)

   ![Notepad++ Installer](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKNF&d=%2Fa%2F4u000000LzTh%2FZTzAI3OK607reHMqz1LqP8NvNZBhO.B0tWayN5Mq10M&asPdf=false)

   ![Notepad++ Installer x64](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKNF&d=%2Fa%2F4u000000LzTh%2FZTzAI3OK607reHMqz1LqP8NvNZBhO.B0tWayN5Mq10M&asPdf=false)

3. Once you have copied the folder to the share drive, exploring the folder you will discover the following sub-directories:

   - **Installers** - This contains the latest Gen7 Agent Installer and the required Microsoft C++ Redistributable installation files.
   - **update-logs** - The batch file has a built-in logging mechanism. The devices the script is run on will create a log file within this directory. That file's name will be whatever the device's computer name is. Example: **MyComputerName.log**. This can help troubleshoot in case an upgrade doesn't start or complete correctly.

## Modifying the Batch File Guide

Once you have completed the above steps, you can now move on to editing the batch file.

1. We highly recommend using a third-party text editor to do this to make the process easier. This application is called **Notepad++** and can be downloaded from its official home page - [https://notepad-plus-plus.org](https://notepad-plus-plus.org) or in the above downloads section.

2. Within the **gen7upgrade-windows-new** folder, right-click the **agent-gen7upgrade-windows.bat** file and click on **Edit with Notepad++**. If you are using the standard Microsoft Notepad, just click on **Edit**.

3. There are several things that need to be changed:
   - You will need to change the share folder location for all of the paths containing `\\mysharefolder` to your shared location.
   - You will need to change the installer switches to match your environment:  
     `/UseNewHub=true /HUBURL=https://localhost/api /HUBUSERNAME=agent /HUBPASSWORD=passWord121 /SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART`

4. Using Windows Notepad, you will have to do the above steps manually. We can make this process a lot faster using Notepad++. However.

5. To complete Step 3-a above, we can do a **Ctrl+F** in Notepad++ and go to the **Replace** tab.

   ![Replace Tab](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKNK&d=%2Fa%2F4u000000LzcT%2Ff0nMeeXKFKrw3nHCQXH53WslMaTewNsxanWBJOw78tc&asPdf=false)

6. In the **Find What** field, type in `\\mysharefolder\NNT Change Tracker\` and in the **Replace with** field, type in your share location and then click the **Replace All** button - Example: `\\CHGTRKSRV01\DATA\NNT Change Tracker\`.

   ![Replacing Default Text](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKNP&d=%2Fa%2F4u000000LzRu%2Fs0.kBTGPEJCva3.8s6HK2k4O1f_xXkMO7.6mS1f.C2A&asPdf=false)

7. This should have replaced all of the directory locations as you specified.

8. Next, you will have to modify the installer properties for the following information:
   - **/HUBURL** - This is the location of your Netwrix Server - you can use Fully Qualified Domain Name or IP Address.
   - **/HUBUSERNAME** - This is the username defined in Change Tracker for the agents to use to authenticate to the hub. By default, this is **agent** and in the script can be left alone if you have not changed it on the Change Tracker Hub.
   - **/HUBPASSWORD** - This is the password for the Change Tracker Agent account to authenticate to the hub; by default, this is **passWord121** and in the script can be left alone if you have not changed it on the Change Tracker Hub.
   - **/THUMBPRINT** - If you have a custom IIS - SSL certificate, you will need to add this option and input your custom certificate **Thumbprint** here.

9. Again, we can use Notepad++ to modify these using the replace tab; if you are using Windows Notepad, you will need to manually modify this.

10. In the script, these values are currently set to the following:
    ```
    "\\mysharefolder\NNT Change Tracker\gen7upgrade-windows\Installers\nnt-changetracker-Gen7Agent-7.0.0.29-98.exe" /UseNewHub=true /HUBURL=https://localhost/api /HUBUSERNAME=agent /HUBPASSWORD=passWord121 /SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
    ```

11. If you need to add a thumbprint, please remember to add it after the password - Example:  
    `/HUBPASSWORD=passWord121 /THUMBPRINT=a3e3f5e15e48e7e7e7e8e89e5e`.

12. To do this using the replace, copy and paste the current script options, and modify them as I have in the example below. My server had the following settings:  
    `/HUBURL=https://192.168.2.50/api /HUBUSERNAME=agent /HUBPASSWORD=n3Wp@ssw0rd121`.

    **Note:** Since I didn't have a thumbprint, I did not add the **/THUMBPRINT** options.

13. Once you click **Replace All**, you are all set. Make sure you save your work and you can proceed with the deployment.

## Deployment Options

From this point, you can deploy this using one of many ways; however, here are some ways our other clients have deployed it:

1. Using Group Policy, have the script run at startup to the correct group of computers.
2. Using Group Policy, have the **agent-gen7upgrade-windows.bat** file be placed in a specific directory, then have someone manually run the file as administrator on each device.
3. Deploy using other management tools.

## Understanding the Script Logic

This section will help you understand the actual logic in the script.

### Section 1 - The Beginning of the Script

The script begins by doing an echo, which is used as the logging mechanism. It then checks to see if the **Gen7Agent** executable is on the system. This is to make sure it doesn't run on a system that already has it.

If the system does not have the executable, it will go to the **START** section. If it does have the executable, it will go to the **END** section.

### Section 2 - The START Section

This section does all the installations once the system determines that the agent is not already installed. It first disables the old agent service, installs the C++ Redistributable, installs the Gen7 Agent with the custom hub variables discussed above, starts the Redis service, then starts the **gen7agent** service. At the end, it will go to the **Finished** section, which just skips the **END** section described below, and exits the script.

### Section 3 & 4 - The END Section and FINISHED Section

The end section simply writes within the agent log in the share folder where the log directory resides that was prepackaged in the Zip file that the agent service already exists, and then exits the script. The **Finished** section skips the **END** section so that when new installations occur, you will not get the **agent already exists** message. The script will then exit.

## Related Articles

- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://kb.netwrix.com/8164)
- [Supporting Documents for Hub Server Problems](https://kb.netwrix.com/8273)
- [Change Tracker Gen 7 Change Log / Update Log / ReadMe.txt Documents for Agent/Hub](https://kb.netwrix.com/8368)
- [Rolling-Log Fix: "Hub Offline, connection retries exhausted (The remote server returned an error: (403) Forbidden.)"](https://kb.netwrix.com/8307)
- [Rolling-Log Fix: ERROR "HubDetails - Crypto error. Has the agent process account changed since the password data was entered?"](https://kb.netwrix.com/8287)

**Attachments:**

- [8.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKNj&d=%2Fa%2F4u000000LzcX%2FsSCoksDFxiuNC5xtlWxYMdjJ94_XbC7zcPxJjbBA1oI&asPdf=false)
- [5.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKNo&d=%2Fa%2F4u000000LzpM%2FpH_3Bl990_yGjc58.i66Sbq3vZzJetZ64rSZDFVFJoA&asPdf=false)
- [4.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKNt&d=%2Fa%2F4u000000Lzt7%2FT47BKbdklSkjk0gGP8_KWGmmX9LHIG2J1d9R5M5DYIs&asPdf=false)
- [npp.7.5.1.Installer.x64.exe](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK6f&d=%2Fa%2F4u000000Lzli%2FFis.mBu0Qk_xIj38HGEiLkf6KdcI.1tx_fPYkHp_GGY&asPdf=false)
- [npp.7.5.1.Installer.exe](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKNy&d=%2Fa%2F4u000000LzSo%2F.3i2rL5mSMJXaWZF_QE6Rv6itJknhu6LTRmkxQaTRVA&asPdf=false)
- [3.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJsP&d=%2Fa%2F4u000000Lzh7%2FYe0KQER6MjghmC67U0W0wmx7OgIqZnqbAv_1gDGZndw&asPdf=false)
- [2.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJtx&d=%2Fa%2F4u000000LztC%2FflSzyIuom8flB8lt_I8HIk_UlAXYbzLtwlM5cI56UYU&asPdf=false)
- [1.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKLU&d=%2Fa%2F4u000000LzZi%2FJ5kM0eIDWL4lV7sf9ta8vaN95GwFEVvmJyZP2ZA34xs&asPdf=false)
- [gen7upgrade-windows-new.zip](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK5m&d=%2Fa%2F4u000000LztH%2Fd0ypdtCnvfBvvD1Sc7FrRGnXuU8JPnOJ7DzaUPVzGZk&asPdf=false)