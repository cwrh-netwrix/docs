---
description: >-
  This article discusses the various types of authentication methods available in Log Tracker, emphasizing their importance for data security and user access management.
keywords:
  - Log Tracker
  - authentication
  - user access
sidebar_label: Types of Authentication
tags: []
title: Log Tracker - Types of Authentication
knowledge_article_id: kA04u0000000Je3CAE
products:
  - activity-monitor
---

# Log Tracker - Types of Authentication

## Overview

Internal security of your Log Tracker data, and the permissions granted to access this data, are both important topics that should be considered by all Log Tracker administrators. Log Tracker server potentially contains private data, especially with regard to user activity, and the Log Tracker data should be protected to prevent user privacy and other concerns.

Log Tracker Server provides multiple types of logon authentication, documented in the Log Tracker manuals, and summarized here.

## Types of Authentication

- **HTTP Authentication**: The out-of-box authentication used by Log Tracker is HTTP Authentication, which is a tried and true form of authentication used by the web browser. The Log Tracker administrator updates a local database of users and permissions via the **System > Logins > Users** screen. This type of authentication has many benefits: it is verifiable, it is an industry standard method, and it is very convenient. The only disadvantage to this type of authentication is that HTTP authentication does not provide a "Logout" mechanism. To log out of the server (once logged in), you need to close all instances of your browser.

- **Web Screen Authentication**: An alternate form of authentication is **Web Screen Authentication**, which is set by the **System > Logins > Security** tab. To switch to this type of authentication, set the **Security Enhanced Functions** to **Enabled**, and set the **Login Authentication Method** to **Web Screen**. This type of authentication provides a traditional login screen, requires cookies in your browser to be enabled, and provides a "Logout" link. This type of authentication is quite popular and has the benefit of easily permitting the user to switch logons.

- **HTTP Auth + Web Screen**: This is simply a combination of both HTTP and Web Screen. The user must log on once using HTTP authentication and then can log on again under the same user name (or switch user names). This is probably not required except at those sites that need to demonstrate and prove verifiable security.

- **Active Directory User Authentication**: This type of logon uses "Active Directory" logons. It works only for the **Web Screen** type of Login authentication. The user simply sets the **User Active Directory Authentication** value to **True** on the **System > Logins > Security** screen. Then, when a user logs into the system using one of the names specified on the **System > Logins > Users** screen, the user's password can be authenticated against Active Directory (instead of the local login database).

- **Active Directory Group Authentication**: This type of logon is similar to the above, except the user name does not have to be configured in the **System > Logins > Users** screen. The permissions of the user are assigned via the **System > Logins > Group Mapping** tab. To use this type of authentication requires installation of the ADGM (Active Directory Group Mapping) adapter, available from Log Tracker.

The precise method of authentication is fairly arbitrary. Any of the above techniques can provide sound security of your data. The particular technique employed by an end-user depends largely on convenience, the need to verify the security (such as proving to auditors the data is secure), and how paranoid an organization may be in protecting the Log Tracker data.