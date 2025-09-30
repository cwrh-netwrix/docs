---
description: >-
  This article provides guidance on Database Compliance Reporting, including how to create database credentials and example connection strings.
keywords:
  - Database Compliance Reporting
  - Connection String
  - Database Credentials
sidebar_label: Database Compliance Reporting
tags: []
title: Database Compliance Reporting
knowledge_article_id: kA04u0000000JUcCAM
products:
  - activity-monitor
---

# Database Compliance Reporting

## Overview

For background, please read the previous section regarding [Agentless Compliance Reporting](https://kb.netwrix.com/8117) and the [Proxy Agent and Credentials Key](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JRdCAM.html) concepts, as Database Compliance reports are all run on an agentless basis.

Use **Add Database Credentials** to create or add a new Credential Key for Database Compliance Reporting. Please follow the notes below to construct your Connection String.

> **IMPORTANT:** Note that the Connection String defines access to the Database Server. The specific Database instance/Name/Oracle SID is defined in the step following the creation of the Database Credential key.

![Connection String Example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJzx&d=%2Fa%2F4u000000LzSb%2FnpB_NH_W8ON2Wikpm9PxAoYE5aquxuzisThTwvHicL0&asPdf=false)

### Example Connection Strings:

| Database Type                      | Connection String Example                                               |
|------------------------------------|-----------------------------------------------------------------------|
| **SQL Server (database credentials):** | `Server=192.168.1.123;Trusted_Connection=False;User Id=bob;Password=password;`* |
| **SQL Server (trusted):**          | `Server=192.168.1.123;Trusted_Connection=True;`*                     |
| **Oracle (direct connection):**    | `Server=192.168.1.123;Port=1521;User Id=bob;Password=password;Direct=True;`* |
| **Oracle (TNS connection):**       | `User Id=bob;Password=password;Data Source=ORCL`*                    |
| **IBM DB2 (database credentials):**| `Server=192.168.11.133:50000;UID=;PWD=;Database=SAMPLE`              |

The specific named Database instance to be reported on is then defined as a Device related to a chosen Proxy Agent in a [similar way to any other agentless device is configured](https://kb.netwrix.com/8119).

Go to **Settings** → **Agents & Devices** and select the Proxy Agent from which you would like to run your database reporting connection.

![Proxy Agent Selection](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK6F&d=%2Fa%2F4u000000LzjH%2FXqndoRbZvP7K7ymXJC.RRDO4_UOhLtP0uDbauS05SZw&asPdf=false)

- **Name** – Database name or any alias can be specified.
- **Host/Database Name** – This is the Database Instance/Oracle SID to be reported on.
- **Device Type** – Select **Database** and assign the Credentials Key created earlier (or select **New Credentials**).

You can then test that the Credentials Key works. Click on the Device Name to go to the Devices home page for the Database, then use the **Run Ad Hoc Report** option to run the **Database Credential Test** report, or just go straight ahead and run one of the pre-packed CIS SQL Server reports.

![Database Credential Test](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK53&d=%2Fa%2F4u000000LzjM%2FqateiISojcKjxIEwpi2uXxMD1oTtU1KXCL9U.G0fGr8&asPdf=false)

**Attachments:**
- [image2017-6-2_16-7-9.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJtn&d=%2Fa%2F4u000000Lzjb%2FeUyZGyc2Vpe.NvG.yF_1qR3GxzRDjXcUFwS6TcDKKZk&asPdf=false)
- [image2017-6-2_16-6-10.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKEX&d=%2Fa%2F4u000000LzRd%2FSrkqwNlzFk834_bPvDBDZU5kUlYoFNZhZK2JXAgiWCI&asPdf=false)
- [image2017-6-2_16-4-31.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK9t&d=%2Fa%2F4u000000Lzjg%2FxSxJX37z.iNUn3_KQWqtyTJ9NoKgqpwTG09u8BU2uWw&asPdf=false)