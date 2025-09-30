---
description: >-
  This article provides a step-by-step guide on how to send Log Tracker messages to UNIX Rsyslog, including configuration and testing procedures.
keywords:
  - Log Tracker
  - Rsyslog
  - UNIX
  - syslog
  - message forwarding
sidebar_label: Send Log Tracker Messages to UNIX Rsyslog
tags: []
title: How to Send Log Tracker Messages to UNIX Rsyslog
knowledge_article_id: kA04u0000000JRACA2
products:
  - change-tracker
---

# How to Send Log Tracker Messages to UNIX Rsyslog

## Step-by-step Guide

Log Tracker Windows Agents can easily forward messages to the UNIX `rsyslogd` processes (and other syslog receivers) running on UNIX or Linux platforms. This is accomplished rather simply, as described here:

1. First, the UNIX administrator configures the `/etc/rsyslog.conf` file to permit UDP syslog message reception and logging to a file. The following directives are used in the `rsyslog.conf` configuration file:

   ```plaintext
   # Provides UDP syslog reception
   $ModLoad imudp
   $UDPServerRun 514
   ```

   These directives frequently exist in the file within the "GLOBAL DIRECTIVES" section, and the administrator can simply uncomment these directives to have the `rsyslogd` process listen for messages at UDP port 514. Alternatively, the UNIX administrator can add these directives in the "GLOBAL DIRECTIVES" section of the file.

2. Next, the UNIX administrator configures (if needed) `rsyslogd` logging to a file using the RULES section of the `rsyslog.conf` file. The following directives are sufficient to log all messages received by the `rsyslogd` process to the `/var/log/all.log` file:

   ```plaintext
   # Log all messages
   *.* /var/log/all.log
   ```

3. When finished with the above configuration, the UNIX administrator restarts the `rsyslogd` process. Note that it may or may not be sufficient to execute a `kill -HUP` command; the administrator should actually restart the process for these particular changes to take effect. Once the `rsyslogd` process has resumed execution, it should create the `/var/log/all.log` file as configured in step 2.

4. At a Windows platform that is running the Log Tracker Windows Agent program, the MS Windows administrator can test the message reception of the `rsyslogd` process using the `sendlog.exe` program. The `sendlog.exe` program is a standard command line utility that comes with the Log Tracker Windows Tool Set (WTS) programs. The `sendlog.exe` program can be used to send arbitrary test messages to the `rsyslogd` process. These messages will then appear in the `/var/log/all.log` file on the UNIX platform configured above.

   > **NOTE:** If no messages are received at the UNIX platform, check for the existence of firewalls between the client and the `rsyslogd` process, and verify that the `rsyslogd` process is listening on UDP port 514. Also, check the `all.log` file for any other messages that may indicate an incorrect configuration of the `/etc/rsyslog.conf` file. Finally, note that AV software can block the transmission of messages.

5. Finally, the MS Windows administrator configures the Log Tracker client software to send messages to the IP address where the `rsyslog` process is executing. This can be accomplished by specifying the `DestinationAddress` value (or `AuxAddress` value) within the Windows agent `CO-sysmsg.cnf` file, and then restarting the `CO-sysmsg.exe` program.

   > **IMPORTANT:** In addition to having the agent program send messages to the `rsyslogd` process, the Log Tracker Server itself has multiple ways of forwarding messages to the process, such as via the **Messages** > **Config** > **Forwarding** screen, or via **Ticket Actions** or **Correlation Actions** configured at the server. Also, note that the above procedure applies to the Log Tracker UNIX Tool Set (UTS) programs, which can send syslog messages to Log Tracker Server or the `rsyslogd` process as described above.

## Related Articles

- [How to Delete a Device in Log Tracker](#)
- [How to Turn Off Bulk Email Notifications](#)
- [Log Tracker - Types of Authentication](#)
- [Log Tracker Tags Facility](#)
- [How to Use CloseTicket.exe to Immediately Close Log Tracker Tickets](#)