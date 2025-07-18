---
title: "Get Logs"
description: "Get Logs"
sidebar_position: 100
---

# Get Logs

GroupID generates logs for its services, clients, and Windows events, which are saved at different
locations on the network. Rather than locating these log files in their respective folders, you can
collect and dump your required logs to a desired location.

What do you want to do?

- [Get Log Files](#get-log-files)

## Get Log Files

1. In Admin Center, click **Settings** at the bottom of the left navigation pane.
2. On the **GroupID Settings** page, click the **Logs** tab.
3. On the **Logs** tab:

- On the **Applications** card, select the check boxes for the GroupID services and portals that you
  want to fetch the logs for. To select all options, select the **Select All** check box on the
  card.  
  Each application has a _file logging_ level set for it. Log files generated against file logging
  will be fetched.

    - For applications deployed in native IIS, logs will be fetched from the GroupID server.
    - For applications deployed in remote IIS, logs will be fetched from the remote IS machine.
    - For applications deployed in Docker, logs will be fetched from the machine running Docker
      daemon.

- On the **Tools & Management Shell** card, select the check boxes for Management Shell and the
  GroupID tools that you want to fetch the logs for. To select all options, select the **Select
  All** check box on the card. Logs will be fetched from the local machine. If you have not used
  Management Shell or a tool on the machine, its respective logs will not be available.
- On selecting the **Event Viewer** check box on the **Event Viewer** card, the **Logs** button is
  enabled. Click it to launch the **Select Event Viewer Logs** dialog box, that displays all logs
  maintained by Windows Event Viewer on the local machine. Select the check boxes for the required
  logs and click **OK**.

4. Click **Download**.  
   GroupID creates a zipped file containing the selected logs and saves it to the download location
   set in browser settings.

**See Also**

- [Event Logging](/docs/directorymanager/11.0/admincenter/identitystore/view/eventlogging.md)
- For a Portal -
  [Manage Log Settings](/docs/directorymanager/11.0/admincenter/applications/portal/server/log.md)
