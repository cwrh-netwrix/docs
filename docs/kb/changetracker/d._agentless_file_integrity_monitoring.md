---
description: >-
  This article explains how to implement agentless file integrity monitoring by deploying the NNT_FILEHASH binary to target hosts across various platforms.
keywords:
  - file integrity monitoring
  - NNT_FILEHASH
  - Change Tracker
sidebar_label: Agentless File Integrity Monitoring
tags: []
title: Agentless File Integrity Monitoring
knowledge_article_id: kA04u0000000JTGCA2
products:
  - activity-monitor
---

# Agentless File Integrity Monitoring

## Overview

In order to facilitate system-wide file integrity monitoring, tracking both file attributes and a cryptographic hash value for each file, it is necessary to deploy the `NNT_FILEHASH` binary to the target host. There is a library of `NNT_FILEHASH` binary files for a wide range of Linux, Unix, and Windows platforms pre-packed within your Change Tracker Gen 7 installation, accessible via the [Settings → System Settings page](https://kb.netwrix.com/8098).

![NNT_FILEHASH Binary Files](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK6V&d=%2Fa%2F4u000000Lzii%2FSIm7VrDo7nrwJEi3eYYe8zDljZxZa99kHpxDitM2Ubo&asPdf=false)

Download the appropriate binary and copy the file to your target host. General best practice for Linux/Unix is to deploy the file to the `/usr/bin` folder and set execute permissions for an assigned Change Tracker user account/group. For Windows, best practice is to create a Program Files folder `C:\Program Files\NNT Change Tracker Suite\Filehash` and place the `NNT.Filehash.exe` within it. The NNT ProxyAgent service will also need to be granted suitable permissions to operate beyond the bounds of the ProxyAgent platform - **_See Appendix I: Agentless FIM for Windows in the Change Tracker Gen 7 Admin Guide_**.

The path for the `NNT_FILEHASH` binary needs to be specified within the Credentials Key used for the host using the attribute `FileHashPath`.

![NNT_FILEHASH Configuration](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJyD&d=%2Fa%2F4u000000Lzin%2FvOYRbFVYIm_NxFqXbuidkGP.UjwwjVxMkbhBTAGFZEU&asPdf=false)

Agentless FIM Configuration Templates are then constructed in the same way as Agent-based Configuration Templates.

![Agentless FIM Configuration Templates](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJzk&d=%2Fa%2F4u000000Lzis%2FvDjTb9QFyqO7a_e057DcPxx3XZ9TkngtDxSCENrfoRY&asPdf=false)

**Attachments:**

- [image2017-6-2_16-0-49.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK2S&d=%2Fa%2F4u000000LzQg%2FCod9skLRRvfswOQ_r5BhQ81k0xDw3lkI8IjfSiXYU10&asPdf=false)
- [image2017-6-2_15-59-0.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKEI&d=%2Fa%2F4u000000LzjC%2FMWa4V_F0kK.7hqvFiJvS0iVYkGfP7vKpbWjQ9C1iR.c&asPdf=false)
- [image2017-6-2_15-58-15.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKEN&d=%2Fa%2F4u000000LzfV%2FnsGIyGbWh8WEdqRR6VtraR_62A5a.B4o5XFBpwsBNz4&asPdf=false)