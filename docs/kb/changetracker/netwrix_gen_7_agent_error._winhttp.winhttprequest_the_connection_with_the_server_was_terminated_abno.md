---
description: >-
  This article addresses the error encountered when running the Netwrix Gen 7 Agent installer on a Windows system, specifically the issue of the connection with the server being terminated abnormally.
keywords:
  - Netwrix Gen 7 Agent
  - installation error
  - Hub connection
sidebar_label: Netwrix Gen 7 Agent Error
tags: []
title: Netwrix Gen 7 Agent Error: WinHttp.WinHttpRequest: The Connection With the Server Was Terminated Abnormally
knowledge_article_id: kA04u0000000Je8CAE
products:
  - change-tracker
---

# Netwrix Gen 7 Agent Error: WinHttp.WinHttpRequest: The Connection With the Server Was Terminated Abnormally

## Problem

Running the **Netwrix Gen 7 Agent** installer on a Windows system and entering the correct Hub credentials results in an error when testing the hub connection before proceeding with the full setup:

![Error Message](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka0Qk000000DZWD&feoid=00N0g000004CA0p&refid=0EM4u000007cexF)

## Resolution

1. Download the Easy Fix tool [here](https://support.microsoft.com/en-us/topic/update-to-enable-tls-1-1-and-tls-1-2-as-default-secure-protocols-in-winhttp-in-windows-c4bd73d2-31d7-761e-0178-11268bb10392).
2. Run through the installation of the hotfix.
3. Close the **Netwrix Gen 7 Agent** installer if it is still open.
4. Try to install the **Netwrix Gen 7 Agent** again and test the **Hub connection**.

## Related Articles

- [How to Configure The FAST Cloud Integration With Proxy Internet Settings](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JfVCAU.html)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JXHCA2.html)
- [Supporting Documents for Hub Server Problems](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JdtCAE.html)
- [How to fix the "Check Log for Details" message in the event details](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JVQCA2.html)
- [Change Tracker Gen 7 Change Log / Update Log / ReadMe.txt Documents for Agent/Hub](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JkGCAU.html)