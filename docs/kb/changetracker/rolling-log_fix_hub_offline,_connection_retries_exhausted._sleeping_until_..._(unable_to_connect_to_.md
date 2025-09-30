---
description: >-
  This article explains the "Hub Offline, connection retries exhausted" error message, its causes, and how to resolve it.
keywords:
  - Hub Offline
  - connection retries exhausted
  - Netwrix Server
sidebar_label: Rolling-Log Fix
tags: []
title: Rolling-Log Fix: "Hub Offline, connection retries exhausted"
knowledge_article_id: kA04u0000000Ja1CAE
products:
  - change-tracker
---

# Rolling-Log Fix: "Hub Offline, connection retries exhausted"

## Example Error Message

```plaintext
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                                                                                      Example Message:								                                         	                                                                  #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

2017-11-25 09:22:56,446 [10] INFO  Message - Hub Offline, connection retries exhausted. Sleeping until 11/25/2017 2:24:31 PM (Unable to connect to the remote server - No connection could be made because the target machine actively refused it 192.168.1.1:443)
```

## What Does It Mean?

This error occurs when your agent cannot reach the Netwrix Server. There are many things that can cause this issue, including but not limited to:

1. Your Netwrix Server may actually be powered off, **IIS** is not running, or **MongoDB** is not running.
2. Your Netwrix Server may not be on the domain, does not have a network connection, or is in the wrong subnet.
3. The port the agent is using is currently being used by another application, causing a clash.
4. Your firewall is not allowing connection to the Netwrix Server over the specified port.
5. Your routes are not configured to allow communication between the Netwrix Server and the Agent.
6. If you configured the agent using a Fully Qualified Domain Name instead of an IP Address, the issue could be DNS related.
7. If your agent is on a WAN or a different LAN, you may have to configure port forwarding.
8. If your agent is on a WAN or a different LAN, you may need to modify NAT settings to allow communication.
9. If your agent is on a WAN or a different LAN, you may need to modify proxy settings if you have a Web or other proxy.
10. If your agent is on a Cloud Provider Network, you may need to modify the Cloud Provider's traffic variables to allow communication.

## How Can I Fix This / Should I Worry?

If you are receiving this error, this means the agent is currently not sending any logs to the Netwrix Server! To fix this error, check the above items and verify that everything is functioning properly.

> **IMPORTANT:** In most cases, if it is one of the above items causing the issue, simply resolving that problem will fix the issue. If not, please restart the agent service.

## Related Articles

- [How to fix the "Check Log for Details" message in the event details](https://kb.netwrix.com/8133)
- [Support for TLS 1.2 in the .NET Framework 3.5.1](https://kb.netwrix.com/8302)
- [MongoDB - Pre-allocated Log Files Accumulate & Result to Disk Space Errors](https://kb.netwrix.com/8285)
- [Change Tracker – How to Create a Custom Tracked Attributes Filter Within a Configuration Template](https://kb.netwrix.com/8265)
- [How To Turn Off Bulk Email Notifications (Force Change Tracker to send one email for each change instead of compiling into one email with multiple changes)](https://kb.netwrix.com/8284)