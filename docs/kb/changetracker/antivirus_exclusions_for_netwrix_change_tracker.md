---
description: >-
  This article provides guidance on which folders, services, and processes related to Netwrix Change Tracker should be excluded from antivirus and endpoint detection solutions to maintain optimal performance.
keywords:
  - Netwrix Change Tracker
  - antivirus exclusions
  - endpoint detection
sidebar_label: Antivirus Exclusions
tags: []
title: Antivirus Exclusions for Netwrix Change Tracker
knowledge_article_id: kA04u00000111HFCAY
products:
  - change-tracker
---

# Antivirus Exclusions for Netwrix Change Tracker

## Question

Should Netwrix Change Tracker folders, services, and processes be excluded from the monitoring scope of your antivirus and endpoint detection and response solutions?

## Answer

Netwrix Change Tracker performance may be negatively affected by antivirus and endpoint detection and response solutions. Refer to the following list of exclusions to avoid potential performance degradation.

> **Exclusions for Change Tracker agents:**

| **Name/Platform**       | **Service**         | **Process**                          | **Folder**                                                                                     |
|-------------------------|---------------------|--------------------------------------|------------------------------------------------------------------------------------------------|
| Windows NetCore Agent    | Gen7AgentCore       | Gen7Agent.App.NetCore.exe           | - C:\ProgramData\NNT\gen7agent.app.netcore<br>- C:\Program Files\NNT Change Tracker Suite\Gen7Agent (NetCore) |
| Linux NetCore Agent      | nntgen7agentcore    | /opt/nnt/gen7agentcore/bin/Gen7Agent.App.NetCore | - /var/nnt/gen7agent.app.netcore/<br>- /opt/nnt/gen7agentcore/                               |
| Linux Express Agent      | nntexpressagent     | /opt/nnt/expressagent/expressAgent  | - /var/nnt/expressagent/<br>- /opt/nnt/expressagent/                                        |

> **Exclusions for Change Tracker Hub:**

| **Service**                                   | **Process**                                   | **Folder**                                                                                     |
|-----------------------------------------------|-----------------------------------------------|------------------------------------------------------------------------------------------------|
| - MongoDB<br>- W3SVC (Windows IIS Service)   | - MongoDB Database Service (mongod.exe)<br>- IIS Worker Process (w3wp.exe) | - C:\Program Files\NNT Change Tracker Suite\Gen7\<br>- C:\inetpub\wwwroot\Change Tracker Generation 7 (NetCore) Hub<br>- C:\inetpub\wwwroot\Change Tracker Generation 7 (NetCore) WebUI<br>- C:\ProgramData\Change Tracker Generation 7 (NetCore)\MongoDB\<br>- C:\Program Files\NNT Change Tracker Suite\Gen7\MongoDB\ |