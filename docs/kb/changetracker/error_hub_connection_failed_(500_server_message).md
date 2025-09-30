---
description: >-
  This article addresses the "Hub Connection Failed" error encountered when connecting a device to the Netwrix Change Tracker, detailing its causes and resolutions for both Windows and Linux systems.
keywords:
  - Hub Connection Failed
  - Netwrix Change Tracker
  - agent.id file
sidebar_label: Hub Connection Failed
tags: []
title: Error: Hub Connection Failed (500 Server Message)
knowledge_article_id: kA04u0000000JWsCAM
products:
  - activity-monitor
---

# Error: Hub Connection Failed (500 Server Message)

## Symptom

When attempting to connect a device to the **Netwrix Change Tracker**, the following error message may appear in the rolling log:

```
2017-08-15 16:29:41,627 [10] INFO Message - Hub connection failed (500 Server message: Error, requested Agent name is in use by device with uniqueId: 123456a6-ffee-78a9-927e-34921d59ce64)
```

## Cause

This problem occurs when a device that has the same name as an already registered agent attempts to connect to the **Netwrix Change Tracker**. When an agent connects, it receives an identifier called the **agent.id** file, which contains an alphanumeric ID for identification purposes. If the `.id` file is not located in the Agent Directory (`%ProgramData%\NNT\gen7agent.service` or `/var/nnt/gen7agent.service`), you will see an error in the Agent's **Rolling-log.txt** similar to the one above.

> **IMPORTANT:** This method should only be used to resolve this problem if the Agent you are trying to connect is the same device or a re-imaged variant of the older device. Contact [Netwrix Change Tracker Support](https://www.netwrix.com/sign_in.html?rf=tickets.html#/open-a-ticket) before attempting this fix.

## Resolution

### For Windows-Based OS

Follow these steps:

1. Stop the **Netwrix Change Tracker gen7agent** Service.
2. Open the rolling log and copy the Agent ID that is listed. Example: Hub connection failed (500 Error, requested Agent name is in use by device with uniqueId: 123456a6-ffee-78a9-927e-34921d59ce64).
3. Edit the **agent.id** file in `%ProgramData%\NNT\gen7agent.service` using Notepad.
4. Erase the ID that is currently in that file and paste in the ID copied from the rolling log above. Ensure there are no spaces at the beginning or end of the text string.
5. Delete all files within the `%ProgramData%\NNT\gen7agent.service` folder except the **Hubdetails.xml** and **agent.id** file.
6. Edit the **Hubdetails.xml** file and erase the `<E1>` tags and everything in between them.
7. Replace the `<Password />` entry in the hubdetails with `<Password>passWord121</Password>`.

   > **NOTE:** **passWord121** is the default agent password. If you have changed the default password, use the updated password instead.

8. If you have specified a Prefix or Suffix and would like to remove it, replace `<NamePrefix>MyPrefix</NamePrefix>` with `<NamePrefix />`.
9. Save the **Hubdetails.xml**. You may need to save it to your desktop and copy it back to the original location due to hardened permissions.
10. Start the **gen7agent** Service. The new device should now be registered using its original device name.

### For RHEL/CentOS Linux-Based OS

Follow these steps:

1. Stop the **Netwrix Change Tracker gen7agent** Service.
2. Open the rolling log using `cat`, `nano`, or `vi` (`cat/vi/nano /var/nnt/gen7agent.service/rolling-log.txt`). Copy the Agent ID that is listed.
3. Edit the **agent.id** file in `/var/nnt/gen7agent.service/agent.id` using `nano` or `vi`.
4. Erase the ID that is currently in that file and paste in the ID copied from the rolling log above. Ensure there are no spaces at the beginning or end of the text string.
5. Delete all files except the **Hubdetails.xml** and **agent.id** file within the `/var/nnt/gen7agent.service` folder.
6. Edit the **Hubdetails.xml** file and erase the `<E1>` tags and everything in between them.
7. Replace the `<Password />` entry in the hubdetails with `<Password>passWord121</Password>`.

   > **NOTE:** **passWord121** is the default agent password. If you have changed the default password, use the updated password instead.

8. If you have specified a Prefix or Suffix and would like to remove it, replace `<NamePrefix>MyPrefix</NamePrefix>` with `<NamePrefix />`.
9. Save the **Hubdetails.xml**.
10. Start the **nntgen7agent** Service. The new device should now be registered using its original device name.

## Related Articles

- [How to Configure The FAST Cloud Integration With Proxy Internet Settings](https://kb.netwrix.com/8295)
- [How to Move Your Linux Server MongoDB Database to a Windows Server](https://kb.netwrix.com/8283)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://kb.netwrix.com/8164)
- [How to Change the Admin Password of Your Mongo Database](https://kb.netwrix.com/8310)