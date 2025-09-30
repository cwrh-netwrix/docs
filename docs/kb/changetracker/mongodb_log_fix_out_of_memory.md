---
description: >-
  This article addresses the "Out of Memory" error in MongoDB, detailing its symptoms, causes, and step-by-step resolution instructions.
keywords:
  - MongoDB
  - Out of Memory
  - Virtual Memory
  - Change Tracker
  - Performance
sidebar_label: MongoDB Log Fix
tags: []
title: MongoDB Log Fix: Out of Memory
knowledge_article_id: kA04u0000000JaLCAU
products:
  - change-tracker
---

# MongoDB Log Fix: Out of Memory

## Symptoms

```
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# 				Example Message				                     #  
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

2017-10-27T10:23:48.348-0400 F - [conn3080] out of memory.
```

## Cause

This means that your MongoDB service has crashed because the system ran out of physical and virtual memory. Typically, this is due to misconfigured Page File settings.

## Resolution

If you are receiving this error, the Netwrix Change Tracker Database and Hub Server are **NOT** functioning. This is a critical error, and for monitoring to continue, it must be resolved. To resolve this error:

1. Open **Run** by typing the **Windows+R** key on your keyboard.
2. Type in `SYSDM.CPL` and hit **Enter**.
3. This will open up **Advanced System Settings**. Click on the **Advanced** tab.
4. Under Performance, click on **Settings...**.
5. In the Performance Options Menu, click the **Advanced** tab.
6. Under Virtual Memory, click on **Change**.
7. Verify that Virtual Memory is set to **System managed**.

   ![Virtual Memory Settings](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKTX&d=%2Fa%2F4u000000Lzy8%2FZ4TQ69RPcbUmYncZ08VRuCW1fgBEvU.h8np.eqYpJTU&asPdf=false)

8. If it is not set to **System managed**, please configure that by selecting the **System managed size** radio button.
9. Click **OK**.
10. In some scenarios, it may be best to reboot the server.

> **NOTE:** MongoDB has garbage collection that cleans up physical and virtual memory. MongoDB tries to reserve as much memory as possible, even though it is not using it. It will gladly give up this memory to the systems that need it. Any queries run get stored into the page file for easy access. If this is not system managed, when it reaches the limit, it will crash the MongoDB database service. Having the C drive set to system managed is the best way to ensure excellent performance from both the system and the database itself.

## Related Articles

- [How to Backup / Restore / Move your MongoDB Database](https://kb.netwrix.com/8150)
- [Monitoring Oracle Databases using Change Tracker](https://kb.netwrix.com/8282)
- [How to move your Linux Server MongoDB Database to a Windows server?](https://kb.netwrix.com/8283)
- [How to Change the Admin Password of your Mongo Database](https://kb.netwrix.com/8310)
- [How to fix the "Check Log for Details" message in the event details](https://kb.netwrix.com/8133)