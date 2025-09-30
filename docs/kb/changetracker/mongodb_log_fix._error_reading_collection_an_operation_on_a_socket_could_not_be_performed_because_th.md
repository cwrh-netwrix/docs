---
description: >-
  This article provides troubleshooting steps for resolving the MongoDB dump failure due to a Windows socket error related to insufficient buffer space.
keywords:
  - MongoDB
  - socket error
  - MongoDump
sidebar_label: MongoDB Log Fix
tags: []
title: MongoDB Log Fix: Error Reading Collection Due to Insufficient Buffer Space
knowledge_article_id: kA04u0000000JWnCAM
products:
  - general
---

# MongoDB Log Fix: Error Reading Collection Due to Insufficient Buffer Space

## Question

I try to perform a MongoDump on my Mongo Database. How do I troubleshoot if the MongoDump failed?

### Error Message Example:

```
Failed: error reading collection: WSARecv tcp 127.0.0.1:50290: An operation on a socket could not be performed because the system lacked sufficient buffer space or because a queue was full.
```

## Answer

The error message is linked to a Windows issue rather than a MongoDB issue. This error occurs when a system tries to connect to a TCP port greater than 5000, as indicated in the error message. 

> **NOTE:** For more information about the cause and resolution of this issue, please refer to the following article: [Connect TCP Greater Than 5000 Error: WSAENOBUFS (10055) ⸱ Microsoft 🡥](https://learn.microsoft.com/en-GB/troubleshoot/windows-client/networking/connect-tcp-greater-than-5000-error-wsaenobufs-10055). 

If possible, please implement the steps recommended in that article and then re-run the MongoDump task.