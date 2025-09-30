---
description: >-
  This article addresses the HTTP Error 500.19, detailing its causes related to the XPress compression schema module and providing step-by-step instructions for resolution.
keywords:
  - HTTP Error 500.19
  - Internal Server Error
  - XPress compression
sidebar_label: HTTP Error 500.19 Resolution
tags: []
title: HTTP Error 500.19 - Internal Server Error - Error Code 0x8007007e
knowledge_article_id: kA04u0000000JfkCAE
products:
  - general
---

# HTTP Error 500.19 - Internal Server Error - Error Code 0x8007007e

## Problem and Cause

The requested page cannot be accessed because the related configuration data for the page is invalid. This problem is related to the XPress compression schema module (`suscomp.dll`), which gets installed with WSUS. Compression schemes are defined globally and they try to load in every Application Pool. It will result in this error when the 64-bit version of `suscomp.dll` attempts to load in an Application Pool that is running in 32-bit mode (`enable32BitAppOnWin64`). 32-bit mode is needed for **SafeGuard Enterprise Server** to run.

![500.19 ERROR](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka04u000000Qmbn&feoid=00N0g000004CA0p&refid=0EM4u000007cew7)

**Operating Systems:**
- Windows Server 2008 (R2)
- Windows Server 2012 (R2)

## Resolution

1. Navigate to `%WINDIR%\system32\inetsrv\config\`
2. Create a backup copy of the file **applicationhost.config** and save it to a different location.
3. Open the **applicationhost.config** in **Notepad**.
4. Search for the following entry:
5. Remove / Disable the XPress compression schema line from the configuration file.
6. Save the **applicationhost.config** and restart IIS services.

For more information, read the [Troubleshooting HTTP 500.19 Errors in IIS 7 ⸱ Microsoft 🡥](https://learn.microsoft.com/ru-ru/archive/blogs/webtopics/troubleshooting-http-500-19-errors-in-iis-7) article.

### Related Articles

- [How to Backup / Restore / Move your MongoDB Database](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JWTCA2.html)
- [How to Configure The FAST Cloud Integration With Proxy Internet Settings](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JfVCAU.html)
- [How to move your Linux Server MongoDB Database to a Windows server?](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JemCAE.html)
- [How to Change the Admin Password of your Mongo Database](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JgJCAU.html)