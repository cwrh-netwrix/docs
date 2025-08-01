---
title: "Define Parameters"
description: "Define Parameters"
sidebar_position: 10
---

# Define Parameters

Before running or scheduling the add-on, you must define connection details: Auditor Server host,
user credentials, etc. Most parameters are optional, the script uses the default values unless
parameters are explicitly defined. You can skip or define parameters depending on your execution
scenario and security policies. See the [Choose Appropriate Execution Scenario](/docs/auditor/10.8/addon/solarwinds/deployment.md) topic
for additional information.

| Parameter                         | Default value            | Description                                                                                                                                                                                                                                                                                                                                                                                          |
| --------------------------------- | ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Connection to Netwrix Auditor** |                          |                                                                                                                                                                                                                                                                                                                                                                                                      |
| NetwrixAuditorHost                | localhost:9699           | Assumes that the add-on runs on the computer hosting the Auditor Server and uses default port 9699. If you want to run the add-on on another machine, provide a name of the computer where Auditor Server resides (e.g., 172.28.6.15, EnterpriseNAServer, WKS.enterprise.local). To specify a non-default port, provide a server name followed by the port number (e.g., WKS.enterprise.local:9999). |
| NetwrixAuditorUserName            | Current user credentials | Unless specified, the add-on runs with the current user credentials. If you want the add-on to use another account to connect to Auditor Server, specify the account name in the _DOMAIN\username_ format. The account must be assigned the Global reviewer role in Auditor or be a member of the Netwrix Auditor **Client Users** group on the computer hosting Auditor Server.                     |
| NetwrixAuditorPassword            | Current user credentials | Unless specified, the script runs with the current user credentials. Provide a different password if necessary.                                                                                                                                                                                                                                                                                      |

## In-Script Parameters
