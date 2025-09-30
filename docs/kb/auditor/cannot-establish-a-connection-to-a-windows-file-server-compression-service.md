---
description: >-
  Explains how to resolve the "Cannot establish a connection to a Compression
  Service (0x80070424)" error in Netwrix Auditor for File Servers by enabling
  the Remote Registry Service and rebooting the Netwrix Auditor server.
keywords:
  - Netwrix Auditor
  - Compression Service
  - Remote Registry Service
  - 2147943460
  - Application Deployment Service
  - Windows File Servers
  - file server
  - connection error
products:
  - auditor
sidebar_label: Cannot Establish a Connection to a Windows File Se
tags: []
title: "Cannot Establish a Connection to a Windows File Server Compression Service"
knowledge_article_id: kA04u000000wnqMCAQ
---

# Cannot Establish a Connection to a Windows File Server Compression Service

## Symptoms

1. Symptom 1. The following error appears when trying to process an item with Netwrix Auditor for File Servers:

```text
Unable to process item: Cannot establish a connection to a Compression Service (0x80070424 The specified service does not exist as an installed service).
```

2. Symptom 2. The **Netwrix Auditor Application Deployment Service** is not installed on the target server.

## Cause

The error appears when the **Remote Registry Service** was disabled on the target server.

## Resolution

To resolve the error, do the following:

1. Enable the **Remote Registry Service** referencing the following article: /docs/auditor/10.6/auditor/configurationuration/fileservers/windows (Configuration — Windows File Servers — Enable Remote Registry Service — v10.6).
2. Reboot Netwrix Auditor Server.

After that, the **Netwrix Auditor Application Deployment Service** appears on the target file server. Depending on the amount of audited data, further data collection may take a while.

### Related Articles

- /docs/kb/auditor/how_to_investigate_compression_services_errors — How to Investigate Compression Services Errors.
- /docs/auditor/10.6/auditor/configurationuration/fileservers/windows — Configuration — Windows File Servers — Enable Remote Registry Service — v10.6.
