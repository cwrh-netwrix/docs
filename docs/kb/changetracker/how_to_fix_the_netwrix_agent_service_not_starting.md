---
description: >-
  This article provides a step-by-step guide to resolve issues with the Netwrix Agent Service not starting after installation.
keywords:
  - Netwrix Agent
  - service not starting
  - troubleshooting
sidebar_label: Fix Netwrix Agent Service Not Starting
tags: []
title: How to Fix The Netwrix Agent Service Not Starting
knowledge_article_id: kA04u0000000JYFCA2
products:
  - change-tracker
---

# How to Fix The Netwrix Agent Service Not Starting

## Overview

On completion of the Netwrix Agent installation, the agent's service should start automatically. If you find that the service has not started and manual attempts to start the service timeout, the following may be the cause.

The agent's files are signed with a certificate, and therefore Windows will attempt to confirm the validity of the certificate as the service starts. If the Windows server can reach a certificate server or if access to a certificate server is rejected, then the agent service will start as normal. If, for whatever reason, a certificate server cannot be reached or **the attempt to reach the certificate server does not timeout within 30 seconds**, the default time allowed for a Windows service to start, then the service will fail with an error.

## Step-by-Step Guide

Consider the following steps to eliminate the problem. The configuration below will prevent the certificate lookup when the agent's service starts.

1. Add the highlighted lines to the file **NNTAgentService.exe.config** found in this location: **C:\Program Files\NNT Change Tracker Suite\Agent**.

## Related Articles

- [How to Backup / Restore / Move your MongoDB Database](https://kb.netwrix.com/8150)
- [Monitoring Oracle Databases using Change Tracker](https://kb.netwrix.com/8282)
- [How to Configure The FAST Cloud Integration With Proxy Internet Settings](https://kb.netwrix.com/8295)
- [How to Move Your Linux Server MongoDB Database to a Windows Server?](https://kb.netwrix.com/8283)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://kb.netwrix.com/8164)

**Attachments:**
- [image2017-12-4_18-32-45.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKMh&d=%2Fa%2F4u000000LzY1%2F9TmGc30hA1WjaKoMt0TaW88BjFS60e_08cY2mHZofI8&asPdf=false)
- [image2017-12-4_18-32-19.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKP7&d=%2Fa%2F4u000000LzuZ%2FQZ3eX0pbeqwDNpGUamx9XLixTFGs_7RxRO4mSqBufZ0&asPdf=false)