---
description: >-
  This article explains the functionality of the "Netwrix Log Tracker Tunnel Sender Service" and provides guidance on how to set it up for monitoring devices in a DMZ/PCI zone.
keywords:
  - Netwrix Log Tracker
  - Tunnel Sender Service
  - DMZ monitoring
sidebar_label: Log Tracker Tunnel Sender Service
tags: []
title: Log Tracker - What is the "Netwrix Log Tracker Tunnel Sender Service" and how does it work?
knowledge_article_id: kA04u0000000JdACAU
products:
  - log-tracker
---

# Log Tracker - What is the "Netwrix Log Tracker Tunnel Sender Service" and how does it work?

## Overview

Do you need to monitor devices in a DMZ/PCI zone that is isolated from the internet or has limited access to the network where your Log Tracker software is installed? Is there a single server within the PCI zone that has access to the internal/unsecure network, which can be used to feed all of the logs from your monitored devices to your Log Tracker server? If so, read on because this is the guide for you.

In order to achieve what has been described above, you can utilize the **Netwrix Log Tracker Tunnel Sender Service**.

## Instructions

The Tunnel Sender is easy to get up and running. You set up a tunnel **Receiver** on the Log Tracker Server, and then set up a tunnel **Sender** on the secondary server you have configured (the secondary server will act as your feed to the internal/unsecure network). The tunnel **Sender** listens for messages on UDP port 514 and then sends these messages via TCP (with optional encryption) to the tunnel **Receiver** on the Log Tracker server. Log Tracker receives the TCP messages where they are then resent to Log Tracker using standard UDP.

The Tunnel process uses TCP port 51462 by default, but this port number can be easily modified.

We’ve listed below how it would be configured in a production environment and we’ve also provided a diagram to show how the monitored devices, tunnel sender, tunnel receiver, and Log Tracker server will communicate together.

### Inside the PCI Zone:

1. A Tunnel sender would be installed on a random Windows server which has access to the **Internal zone**.
2. Other Windows servers, Linux servers, and network devices within the PCI Zone would be configured to send their syslog messages to the Tunnel Sender using UDP port 514.
3. The Tunnel Sender will listen for the syslog messages and then send them via TCP port 51462 to the Tunnel Receiver in the **Internal zone**. This port number can be easily modified.

### Inside the Internal Zone:

1. A Tunnel Receiver would be installed on the server which hosts the Log Tracker software.
2. The Tunnel Receiver will listen for the TCP messages sent by the Tunnel Sender.
3. Once TCP messages are received, they will be resent to the Log Tracker server as a syslog message using UDP port 514.

![Tunnel Sender and Receiver Configuration](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKTn&d=%2Fa%2F4u000000LzlJ%2F46oongoDXXSl5nyEjHLsjvtyvEJ6kYjb4PSUWC1CBJU&asPdf=false)

Information on the Tunnel Sender and Tunnel Receiver is in the **Netwrix Windows Tool Set Manual**, available from the **Home** screen of Log Tracker.

For more information on the **Netwrix Log Tracker Tunnel Sender Service** and instructions or assistance with configuring it, please open a support ticket through the **Jira HelpDesk**.