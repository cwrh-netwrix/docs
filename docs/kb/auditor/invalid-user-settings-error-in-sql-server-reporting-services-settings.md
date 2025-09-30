---
description: >-
  You may see the 'Invalid user credentials' error when you modify audit
  database settings in Netwrix Auditor. This article lists causes and
  resolutions.
keywords:
  - SQL Server Reporting Services
  - SSRS
  - Invalid user credentials
  - Netwrix Auditor
  - audit database
  - SSRS account
  - permissions
  - troubleshooting
products:
  - auditor
sidebar_label: Invalid User Settings Error in SQL Server Reportin
tags: []
title: "Invalid User Settings Error in SQL Server Reporting Services Settings"
knowledge_article_id: kA04u000000wnrjCAA
---

# Invalid User Settings Error in SQL Server Reporting Services Settings

## Symptom

You see the following error message when you modify audit database settings in Netwrix Auditor:

```text
Error accessing SQL Server Reporting Services.
Check your SQL Server Reporting Services Settings.
Invalid user credentials. Update your settings if necessary or proceed with current settings.
```

## Causes

- Incorrect permissions granted to the SSRS account.
- Incorrect credentials specified for the SSRS account.

## Resolutions

- Review the permissions granted to the SSRS account − refer to the following article for additional information on the initial setup: /docs/auditor/10.6/auditor/requirements
- Review the credentials specified for the SSRS account.

## Related articles

- /docs/auditor/10.6/auditor/requirements
