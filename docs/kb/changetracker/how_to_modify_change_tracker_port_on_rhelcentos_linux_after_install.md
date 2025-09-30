---
description: >-
  This article provides step-by-step instructions for modifying the Change Tracker port on RHEL/CentOS Linux after installation.
keywords:
  - Change Tracker
  - RHEL
  - CentOS
  - port modification
  - Linux
sidebar_label: Modify Change Tracker Port
tags: []
title: How to Modify Change Tracker Port on RHEL/CentOS Linux after Install
knowledge_article_id: kA04u0000000JZXCA2
products:
  - activity-monitor
---

# How to Modify Change Tracker Port on RHEL/CentOS Linux after Install

## Overview

This article can be used when you've already installed Change Tracker on a RHEL/CentOS Linux OS and need to change the port it uses.

> **NOTICE:** THIS CHANGE REQUIRES A REBOOT OF YOUR NNT SERVER!

## Instructions

These steps will help you change the port:

1. **Stop the nnt-hubservice**

   ```bash
   # service nnt-hubservice stop
   ```

   or

   ```bash
   # systemctl stop nnt-hubservice
   ```

2. **Stop the nginx service**

   ```bash
   # service nginx stop
   ```

   or

   ```bash
   # systemctl stop nginx
   ```

3. **Stop the mongodb service**

   ```bash
   # service mongod stop
   ```

   or

   ```bash
   # systemctl stop mongod
   ```

4. **Edit `/etc/nginx/conf.d/nnt.conf` using a text editor (This requires root permissions)**

   ```bash
   # sudo vi /etc/nginx/conf.d/nnt.conf
   ```

   or

   ```bash
   # sudo nano /etc/nginx/conf.d/nnt.conf
   ```

5. **Edit the portion of the file that looks like this below:**

   ```
   server {
       listen 443 ssl;
   }
   ```

6. **Change the number to the desired port (In our example, we are changing port 443 to port 3443)**

   ```
   server {
       listen 3443 ssl;
   }
   ```

7. It is likely that you will also need to update SELinux settings to allow this new port to be used. To do this, run the following command with your new port number being specified:

   ```bash
   # semanage port -a -t http_port_t -p tcp 3443
   ```

8. **You will need to reboot your Linux server for these changes to take effect. To do so, run the following command:**

   ```bash
   # reboot
   ```

When your server has finished rebooting, you may need to start the services stopped above. Simply use the same command, but replace "stop" with "start".

## Related Articles

- [How to move your Linux Server MongoDB Database to a Windows server?](https://kb.netwrix.com/8283)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://kb.netwrix.com/8164)
- [How to Change the Admin Password of your Mongo Database](https://kb.netwrix.com/8310)
- [Supporting Documents for Hub Server Problems](https://kb.netwrix.com/8273)