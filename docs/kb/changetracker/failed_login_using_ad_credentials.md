---
description: >-
  This article provides troubleshooting steps for users experiencing failed login attempts using Active Directory credentials in Change Tracker.
keywords:
  - Active Directory
  - Change Tracker
  - login failure
sidebar_label: Failed Login Using AD Credentials
tags: []
title: Failed Login Using AD Credentials
knowledge_article_id: kA04u0000000JcwCAE
products:
  - change-tracker
---

# Failed Login Using AD Credentials

## Symptoms

Have you configured your Change Tracker web console to use an Active Directory server? Have you configured a user account as an **AD Login** on Change Tracker? Is the user unable to log in using their domain login credentials? If so, please read the guide below to troubleshoot the issue further.

## Resolution

If a user is unable to log in to the Change Tracker server using their domain login credentials, Change Tracker will log the response we receive from the AD server, and these logs will help you identify where the issue lies. The log that contains this information is the Change Tracker **hubservice-log.txt** file. This log can be found in the following locations:

- Windows Installation: `C:\inetpub\wwwroot\Change Tracker Generation 7 Hub\log`
- Linux Installation: `/opt/nnt/hubservice/log`

After an unsuccessful login, if you review the contents of the log, you may see entries that look like the example below:

```
2018-01-01 00:00:00,000 [35] ERROR NNT.Hub.Service.Authentication.CustomCredentialsAuthProvider - AD Login failure for: administrator
Message: The username or password is incorrect.
Extended Message: 8009030C
LdapErr: DSID-0C090579
Comment: AcceptSecurityContext error - data 531 - v3839
System.DirectoryServices.DirectoryServicesCOMException (0x8007052E): The user name or password is incorrect.

at System.DirectoryServices.DirectoryEntry.Bind(Boolean throwIfFail)
at System.DirectoryServices.DirectoryEntry.Bind()
at System.DirectoryServices.DirectoryEntry.get_NativeObject()
at NNT.Hub.Service.Authentication.CustomCredentialsAuthProvider.LoginActiveDirectoryInternal(String ldapPath, String user, String password) in C:\TeamCity\buildAgent\work\5e46fbf5785c9042\Agent\NNT.Hub.Service\Authentication\CustomCredentialsAuthProvider.cs:line 279
```

To help identify why the user is unable to log in, you will need to review the line which states the **AcceptSecurityContext** error and in particular, the number that follows. From the example log, we can see that the error and number we have received in this scenario was:

```
Comment: AcceptSecurityContext error - data 531 - v3839
```

Using the information listed in the grid below, we can see what each error code means and what steps you can take to resolve the issue:

| **Code**   | **Description**                                                | **Resolution**                                                                                       |
|------------|---------------------------------------------------------------|------------------------------------------------------------------------------------------------------|
| Data 525   | The user could not be found                                   | Ensure the correct username has been specified for the bind account.                               |
| Data 52e   | The credentials (username and password) are invalid          | Ensure the credentials are correct, and that the correct server is being used.                      |
| Data 530   | The user is not permitted to logon at this time              | Remove any Log on Hours from the user's **Account** tab in Active Directory.                       |
| Data 531   | The user is not permitted to logon at this workstation        | Allow the application server as a permitted log on workstation from the user's **Account** tab in Active Directory. |
| Data 532   | The user's password has expired                                | Reset the user's password. If necessary, update your application(s) with the new password.          |
| Data 533   | The user's account has been disabled                           | Enable the user account in Active Directory.                                                         |
| Data 701   | The user's account has expired                                 | Ensure that **Never** is set as the account expiration option in Active Directory.                   |
| Data 773   | The user account must have its password reset                 | Reset the user's password. If necessary, update your application(s) with the new password.          |
| Data 775   | The user account is locked                                     | Unlock the user account from the user's **Account** tab in Active Directory.                        |

If you find that the error code that you receive is not included in the above list, you can [download](https://www.microsoft.com/en-us/download/details.aspx?id=100432) **Microsoft Error Code Look-up** application to troubleshoot further. Once the application has been downloaded, please run it, extract the files as instructed, and then follow the steps listed below:

1. Open a Command Prompt (ensure that you run this as an administrator).
2. Browse to the folder where the files were extracted to. Example: `cd C:\Err`
3. Run the **Err.exe** along with the **data error code** you receive. Example: `Err.exe 528`
4. Review the output to obtain an error message description:

![Error Code Look-up Application](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJsY&d=%2Fa%2F4u000000LzxZ%2FULqqfDCYSJOJDLILKXBk7a8EfP_H2KM7elty6UBm.jI&asPdf=false)