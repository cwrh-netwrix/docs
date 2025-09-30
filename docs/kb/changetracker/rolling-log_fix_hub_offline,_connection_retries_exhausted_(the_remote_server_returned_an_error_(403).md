---
description: >-
  This article addresses the "Hub Offline, connection retries exhausted" error, detailing the steps to resolve authentication issues with the Netwrix Gen 7 Agent service.
keywords:
  - Netwrix Gen 7 Agent
  - authentication error
  - connection retries
  - Hub Server
  - troubleshooting
sidebar_label: Rolling-Log Fix
tags: []
title: Rolling-Log Fix: "Hub Offline, connection retries exhausted (The remote server returned an error: (403) Forbidden.)"
knowledge_article_id: kA04u0000000JfHCAU
products:
  - change-tracker
---

# Rolling-Log Fix: "Hub Offline, connection retries exhausted (The remote server returned an error: (403) Forbidden.)"

## Overview

This problem occurs when the Netwrix Gen 7 Agent service is unable to authenticate or communicate with the Change Tracker Server due to insufficient privileges assigned to the service user.

### Example Message:

```
2019-12-03 14:48:31,110 [10] INFO Message - Hub Offline, connection retries exhausted. Sleeping until 03/12/2019 13:49:53 (The remote server returned an error: (403) Forbidden.)
```

## Instructions

1. Remote onto the agent device raising this error.
2. Stop the **Netwrix Gen 7 Agent** service and access the properties of the service.
3. Click on the **Log On** tab.
4. Select **This account** and assign a user with more privileges, such as an administrator, and press **OK**.
5. Navigate to your Netwrix Agent Directory, which contains the Rolling-Log Files, as defined in this article - [Netwrix Software Problem? What Info Should I Provide?](http://supportnntws.atlassian.nethttps://kb.netwrix.com/8048).
6. Right-click and edit the **Hubdetails.xml** file.
7. Remove the `<password>` tags as they contain the agent password, which has been encrypted.
8. Replace the `<password>` tags with the following format - see the example **hubdetails** below. The default password is used as an example.
9. In between the password entries, enter your Agent Account password as defined on your Netwrix Hub Server.
10. Save the file, replacing the old one.
11. Start the **Netwrix Gen 7 Agent** service.

### Example HubDetails.xml file:

```xml
<configuration xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.w3.org/2001/XMLSchema">
    <url>https://myserver.mydomain.local/api</url>
    <agent>agent</agent>
    <password>passWord121</password>
    <enabled>false</enabled>
</configuration>
```

## Related Articles

- [How to Backup / Restore / Move your MongoDB Database](https://kb.netwrix.com/8150)
- [How to Configure The FAST Cloud Integration With Proxy Internet Settings](https://kb.netwrix.com/8295)
- [How to move your Linux Server MongoDB Database to a Windows server?](https://kb.netwrix.com/8283)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://kb.netwrix.com/8164)
- [Supporting Documents for Hub Server Problems](https://kb.netwrix.com/8273)