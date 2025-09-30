---
description: >-
  Explains causes and resolutions for the 403 Forbidden error when Netwrix
  Auditor fails to collect Azure (Microsoft Entra) Logons audit data for a
  Microsoft Entra ID monitoring plan.
keywords:
  - Microsoft Entra ID
  - Azure AD
  - 403 Forbidden
  - logons
  - monitoring plan
  - Netwrix Auditor
  - audit data
  - permissions
  - Microsoft 365
  - failed to collect
products:
  - auditor
sidebar_label: Failed to Collect Logons — Forbidden Error in Entr
tags: []
title: "Failed to Collect Logons — Forbidden Error in Entra ID Monitoring Plan"
knowledge_article_id: kA04u000001116gCAA
---

# Failed to Collect Logons — Forbidden Error in Entra ID Monitoring Plan

## Symptom

The following error is prompted in Health Log for your Microsoft Entra ID monitoring plan (formerly Azure AD monitoring plan):

```text
Source:Azure AD Audit Service
Event ID:2002
Computer: %Auditor_server_name%
User:N/A
Description:Monitoring Plan: %Azure_AD_monitoring_plan_name% 
    
The following error has occurred while processing %tenant%:   
    
Failed to collect Azure Logons audit data due to the following error: The remote server returned an error: (403) Forbidden.
```

## Causes

- App was incorrectly configured.
- Admin consent was not granted to the Azure app.
- API permissions were not granted neither manually, nor via the app manifest.
- Logon activity collection is enabled without a purchased Premium Plan (P1 or P2) license for the Microsoft Entra ID tenant.

## Resolutions

- Review the app setup procedure for your monitoring plan. Refer to the following articles for additional information on Microsoft Entra ID, SharePoint Online, Exchange Online, and Teams correspondingly:
  - /docs/auditor/10.6/auditor/configurationuration/microsoft365/microsoftentraid (Permissions for Microsoft Entra ID Auditing ⸱ v10.6)
  - /docs/auditor/10.6/auditor/configurationuration/microsoft365/sharepointonline (SharePoint Online — Permissions for SharePoint Online Auditing ⸱ v10.6)
  - /docs/auditor/10.6/auditor/configurationuration/microsoft365/exchangeonline (Exchange Online — Permissions for Exchange Online Auditing ⸱ v10.6)
  - /docs/auditor/10.6/auditor/configurationuration/microsoft365/teams (Teams — Permissions for Teams Auditing ⸱ v10.6)

- Disable logon activity for your monitored Microsoft 365 (Office 365) tenant:
  1. In the main **Netwrix Auditor** menu, click **Monitoring Plans**.
  2. In the left pane, select your Microsoft Entra ID monitoring plan, and click **Edit**.
  3. In the right pane, click **Edit data source** under the **Data source** section.
  4. Uncheck **Failed logons** and **Successful logons** under the **Monitor Microsoft Entra ID logon activity** section.
  5. Save the changes.

> **NOTE:** Learn more about Microsoft Entra ID licenses in Sign up for Microsoft Entra ID P1 or P2 Editions ⸱ Microsoft: https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/get-started-premium

## Related articles

- /docs/auditor/10.6/auditor/configurationuration/microsoft365/microsoftentraid
- /docs/auditor/10.6/auditor/configurationuration/microsoft365/sharepointonline
- /docs/auditor/10.6/auditor/configurationuration/microsoft365/exchangeonline
- /docs/auditor/10.6/auditor/configurationuration/microsoft365/teams
- https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/get-started-premium
