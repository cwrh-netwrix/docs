---
title: "Permissions for Azure Files Auditing"
description: "Permission Requirements for Netwrix Auditor 10.8 in Azure Files"
sidebar_position: 2
---
To enable auditing of Azure Files, the registered Microsoft EntraID application must be granted the following **permissions**:

## [Microsoft Graph API permissions](/docs/auditor/10_8/configuration/azurefiles/overview#configure-api-permissions)
| Permission | Purpose |
|------------|---------|
| `User.Read` | Basic user information |
| `User.Read.All` | Read all users' profiles |


**User.Read.All - required to resolve SIDs into usernames in reports

## [Azure IAM roles](/docs/auditor/10_8/configuration/azurefiles/overview#assign-iam-roles-to-the-app)
| Role | Scope | Purpose |
|------|--------|---------|
| `Reader` | Resource Group | List storage accounts |
| `Storage File Data Privileged Reader` | Storage Account | Read file share data |
| `Storage Blob Data Reader` | Log Storage Account | Access audit logs |

- **Reader** on the **Resource Group** that contains the Data Storage Account
- **Storage File Data Privileged Reader** on the **Data Storage Account** (file shares)
- **Storage Blob Data Reader** on the **Log Storage Account** (audit logs)



These permissions are required for Netwrix Auditor to collect logs, read file share metadata, and present activity with resolved user identities.
