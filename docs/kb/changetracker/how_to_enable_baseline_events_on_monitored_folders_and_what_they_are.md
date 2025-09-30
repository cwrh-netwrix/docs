---
description: >-
  This article explains how to enable baseline events on monitored folders using the FIM - File Integrity Monitoring Tracker and describes their functionality.
keywords:
  - baseline events
  - File Integrity Monitoring
  - monitored folders
sidebar_label: Enable Baseline Events
tags: []
title: How to Enable Baseline Events on Monitored Folders and What They Are
knowledge_article_id: kA04u0000000JWYCA2
products:
  - general
---

# How to Enable Baseline Events on Monitored Folders and What They Are

## Overview

In this example, I will be using the **FIM - File Integrity Monitoring Tracker**. All paths listed as a tracked folder within a configuration template will be "baselined".

Enabling the **Send baseline events** option on the **FIM tracker** (or any tracker which supports it) will effectively send back an event from the agent to the hub when a baseline scan is complete. This allows you to see a list of the files and folders that have been captured as part of the baseline and the state of the file/folder, i.e., its attributes. The example below shows three files included within a baseline.

### Files on Server:

![Files on server](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJx3&d=%2Fa%2F4u000000Lzbp%2FvPa96XcfzagWa6y6NsgegM8zBTrgCfczAOQtRKNkbcw&asPdf=false)

### Configuration Template Set to Monitor That Folder with “Send Baseline Events”:

![Configuration template](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJp4&d=%2Fa%2F4u000000Lzkb%2FA6VvZ6b4E5VhlyGfW5o9IEGoCTPxNChznaqzfnLu6DU&asPdf=false)

### Baseline Events Sent to the Hub Once Baselining is Complete:

![Baseline events](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKGk&d=%2Fa%2F4u000000LzfS%2F3l5eWHirIM.ZQC0v5BE34CzJdpiRrGwnGubkRaWp7Nc&asPdf=false)

### Event Showing You the Attributes of a File as It’s Saved in the Baseline:

![Event attributes](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKJ4&d=%2Fa%2F4u000000LzoR%2FCsb2i037qb2Wuj4cpB7ek_ND6zJW90b8aPclg6E36kg&asPdf=false)

Whenever changes are then made to the files/folders, the baseline is updated, and more baseline events will be sent to the hub showing you the original baseline as “Historical” and the updated baseline as “Current”.

![Updated baseline](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKB7&d=%2Fa%2F4u000000LzUh%2F6ReS.KhlTKfu_vmvQLY57JwZWwLDA986DIDF9CilL94&asPdf=false)