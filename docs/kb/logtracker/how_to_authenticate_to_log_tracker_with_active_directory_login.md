---
description: >-
  This article provides step-by-step instructions on how to authenticate to Log Tracker using Active Directory login credentials.
keywords:
  - Active Directory
  - Log Tracker
  - authentication
sidebar_label: Authenticate to Log Tracker
tags: []
title: How to Authenticate to Log Tracker with Active Directory Login
knowledge_article_id: kA04u0000000JdFCAU
products:
  - log-tracker
---

# How to Authenticate to Log Tracker with Active Directory Login

## Overview

Log Tracker allows you to log in to the system using Active Directory authentication by configuring the **System > Logins > Security** screen. This lets you use your Active Directory password when logging into Log Tracker and provides additional benefits.

To use this function, the Log Tracker Server needs to be part of the Active Directory domain. The Log Tracker Server authenticates the login user to the host platform, and if the platform is part of the domain, you can then use your Active Directory password or a local password configured for the host platform.

## Instructions

Here is a configuration procedure.

1. First, verify that the Log Tracker Server is part of the domain. You can find out if this is true by successfully logging into the platform (not the web interface, but the actual platform running Log Tracker) with your Active Directory username and password.

2. After verifying the above, log in to the Log Tracker Server web interface with an "admin" type login and execute the following steps:

   1. Navigate to the **System > Logins > Users** screen, and add an "admin" type user to the system.  
      _The username should be your precise "Active Directory" logon name without any slash or @ characters. For example, if your fully qualified logon domain, which you used to access the host platform, is "LOGTRACKER\Joe.Smith", then you will enter "joe.smith" as the username. Note that you can enter a local password, but that password will generally be ignored. It can be used as a backup password to permit you access should Active Directory not be available during the logon process._

   2. Navigate to the **System > Logins > Security** screen, and click **Edit**. On the **Security** edit screen, set the following parameters:
      - Set **Security Enhanced Functions** to **Enabled**.
      - Set **Login Authentication Method** to **Web Screen**.
      - Set **Authenticate Using AD / SSPI** to **True**.
      - Set **NetBIOS Logon Domain** to be the name of the NetBIOS domain. When finished, click **Commit**.  
      _Note that the **NetBIOS Logon Domain** is the domain used to access the platform without any slash or @ characters. For example, if your fully qualified logon domain, which you use to access the host platform, is "LOGTRACKER\Joe.Smith", then the **NetBIOS Logon Domain** is "LOGTRACKER"._

   3. When you save the security settings, the system will generally log you out when you change these settings, returning you to the login screen. (This depends on your current username.) If you are not automatically logged out, click the **Logout** link in the upper right of the display.

   4. After logout, you will be presented with a login screen. Enter the username configured in step 1 above and your Active Directory password. Note that, on the login screen, a drop-down menu appears that will let you log in to the system using your Active Directory login name and password, or the password configured for you on the local platform (if any), or using the internal password configured in step 1 above.

You can now add additional users by following step 1 above. Note that, to have access to the Log Tracker Server, the Active Directory username MUST be configured in the **System > Logins > Users**, and the permission to the Log Tracker server must be set on that screen.

For example, an average Active Directory user can be assigned "admin" rights at the Log Tracker Server (or an Active Directory administrator may only have "guest" access to the Log Tracker Server).

Generally, the above steps are all that is necessary to configure the Active Directory interface. Various other options also exist, such as the ability to authenticate a user based upon an Active Directory group name, and the ability to disable any local logins using a password configured within Log Tracker.