---
description: >-
  This article provides a solution for the issue where the Netwrix Gen 7 Agents ProxiedDevices.json file does not update with the configured proxy device, leading to credential retrieval failures.
keywords:
  - Netwrix Gen 7
  - ProxiedDevices.json
  - remote platform discovery
  - Change Tracker
  - troubleshooting
sidebar_label: Rolling-Log Fix
tags: []
title: Rolling-Log Fix: "Couldn't Get Credentials for Remote Platform Discovery"
knowledge_article_id: kA04u0000000JcUCAU
products:
  - change-tracker
---

# Rolling-Log Fix: "Couldn't Get Credentials for Remote Platform Discovery"

## Overview

This problem can occur if the Netwrix Gen 7 Agents ProxiedDevices.json file does not automatically update its fields with the proxy device you have configured on the console.

### Example Message:

```
2019-11-19 09:40:54,551 [9] INFO  Message - Hub connection failed  (403 Server message: Invalid Permission)
2019-11-19 09:40:54,551 [9] INFO  Message - Couldn't get credentials for remote platform discovery on 1,28 HostNameOrIp: ORCL. Returning a default platform with OSType.Unspecified
2019-11-19 09:40:54,552 [9] INFO  Message - task 370 - DeviceConfigTask-28 cannot execute, cannot discover proxied device platform details: 1,28 HostNameOrIp: ORCL
2019-11-19 09:40:54,559 [9] INFO  Message - Entering configuration problem state for 28. Retry at: 19/11/2019 09:43:24
```

## How to Fix

1. Remote onto the Netwrix Gen 7 Agent device you are using to proxy.
2. Navigate to:

   **Windows:** `C:\ProgramData\NNT\gen7agent.service`

   **Linux:** `/var/nnt/gen7agent.service`

3. Stop the **nntgen7agent** service from running on the server.
4. Edit the **ProxiedDevices.json** file.
5. Within the `[]` brackets, manually fill in the proxy device details. Please view the example below:

   On the Change Tracker Console, edit the proxy device in question to view its details:

   ![Proxy Device Details](image-20191119-100938.png)

   Now looking at the console, you can fill out the details as seen below:

   > **NOTE:** The AgentID & DeviceID of the proxy device can be found in the rolling log file.

   ```
   [{ "AgentId": "1", "DeviceId": "28", "DeviceName": "ORCL", "PollPeriodSeconds": 30, "PingTimeoutSeconds": 15, "HostType": "Database", "HostNameOrIp": "ORCL" }]
   ```

6. Once you have entered the details of the proxy device manually, save the file.
7. Start the **nntgen7agent** service.
8. Now, check to see if the proxy device appears online on the Change Tracker Console and operates as expected.

## Related Articles

- [How to Backup / Restore / Move your MongoDB Database](#)
- [Monitoring Oracle Databases Using Change Tracker](#)
- [How to Configure The FAST Cloud Integration With Proxy Internet Settings](#)
- [How to Move Your Linux Server MongoDB Database to a Windows Server?](#)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](#)

**Attachments:**

- [image-20191119-100938.png](#)