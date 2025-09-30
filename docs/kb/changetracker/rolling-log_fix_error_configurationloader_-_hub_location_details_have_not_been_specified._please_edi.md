---
description: >-
  This article addresses the error message related to the Hub location details not being specified in the NNT Agent configuration and provides steps to resolve it.
keywords:
  - NNT Agent
  - HubDetails.xml
  - configuration error
sidebar_label: Rolling-Log Fix
tags: []
title: Rolling-Log Fix: "ERROR ConfigurationLoader - Hub location details have not been specified. Please edit the following file to specify hub location and account details: /var/nnt/gen7agent.service/HubDetails.xml”
knowledge_article_id: kA04u0000000JaBCAU
products:
  - general
---

# Rolling-Log Fix: "ERROR ConfigurationLoader - Hub location details have not been specified. Please edit the following file to specify hub location and account details: /var/nnt/gen7agent.service/HubDetails.xml”

## Overview

This problem can occur when the Agent password being sent to the Hub Server is incorrect.

### Example Error Message

```
2017-07-10 19:49:59,891 [1] ERROR ConfigurationLoader - Hub location details have not been specified. 
Please edit the following file to specify hub location and account details: /var/nnt/gen7agent.service/HubDetails.xml
```

## What Does It Mean?

**This means that the agent could not locate the HubDetails.xml file, which is responsible for telling the agent how to connect to the NNT Hub Server.**

## How Can I Fix This / Should I Worry?

If you are receiving this error, the NNT Agent is **NOT** reporting to your hub. This is a critical error, and for monitoring to continue, it must be resolved. To resolve this error:

1. Stop the **NNT Agent Service**.
2. Run the **NNT Connection Script** by issuing the following command: `sudo sh /opt/nnt/gen7agent/configure-gen7agent.sh` - Complete the requested details.
3. Start the Service.

If the above does not work:

1. Stop the **NNT Agent Service**.
2. Navigate to your **NNT Agent Directory** which contains the Rolling-Log Files - which is defined in this article - [NNT Software Problem? What Info Should I Provide?](https://kb.netwrix.com/8048).
3. Modify the **HubDetails.xml** (A known good HubDetails.XML example is below).
4. Modify the **HubURL** and insert yours in its place.
5. Remove the Tags as they are the agent password which has been encrypted - if there are any.
6. In the place of the Tags, enter the Tags - see example HubDetails below. The default password is used as an example.
7. In between the password entries, enter your Agent Account password as defined on your NNT Hub Server.
8. In between the Thumbprint entries, enter your custom certificate thumbprint if you have one. If you do not have a custom and are using the default, leave it blank.
9. Save the file out, replacing the old one. Note that you may need to save this to the desktop and copy and paste replacing the old file back into the directory.
10. Restart the agent service.

> **NOTE:** When you start the service, the agent will automatically re-encrypt your password, and the E1 tags will replace the password tags. Also, there is a ten-minute cool-off when this happens. Now that the username and password have been corrected, the agent should register after the ten minutes have elapsed. This cool-off period is counted at the NNT Hub server and does not take effect at the agent level. If you have stopped the service, you do not have to wait 10 minutes after restarting it.

## Example HubDetails.xml

```xml
<?xml version="1.0" encoding="utf-8"?>
<HubDetails xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <Url>https://myserver.mydomain.local/api</Url>
    <Username>agent</Username>
    <Password>passWord121</Password>
    <Proxy />
    <ProxyDomain />
    <ProxyUsername />
    <ProxyPassword />
    <UseDefaultProxy>false</UseDefaultProxy>
    <NamePrefix></NamePrefix>
    <NameSuffix></NameSuffix>
    <Thumbprint>BCD1067FBAB59CCED21786657C672F6AB5BE824C</Thumbprint>
</HubDetails>
```