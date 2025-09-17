---
description: >-
  If Netwrix Change Tracker events reports contain ErrorEvent entries labeled
  "Corrupt", multiple conflicting agent configuration files may be present on
  affected devices. This article explains how to identify affected agents and
  perform an agent reset to resolve the issue.
keywords:
  - Netwrix Change Tracker
  - ErrorEvent
  - Corrupt
  - agent reset
  - gen7agent
  - rolling-log
  - Hubdetails.xml
  - Config-*.xml
  - AgentID
products:
  - general
sidebar_label: Corrupt ErrorEvent in Event Reports
tags: []
title: "Corrupt ErrorEvent in Event Reports"
knowledge_article_id: kA0Qk0000000ahpKAA
---

# Corrupt ErrorEvent in Event Reports

## Symptoms

- The events report in Netwrix Change Tracker contains one or more `ErrorEvent` events. Their description states `Corrupt`.
- Agent logs located in `C:\ProgramData\NNT\gen7agent.service\rolling-log.txt` contain the following line:

```text
[timestamp] ERROR AgentTaskRunner - task execution failed for task %#% - %task_name% [timestamp]
```

## Cause

The agent directory on affected devices contains multiple conflicting `Config-*.xml` files. These files cause conflicts in device agent events.

## Resolution

> **NOTE:** You can establish the affected agents via the events report—review the **DeviceName** and **AgentID** column values.

Perform an agent reset to reconfigure affected agents. Refer to the following steps:

1. Stop the Netwrix Change Tracker Agent Service. Refer to the following Linux command:

```bash
# service nntgen7agent stop
```

2. Navigate to the agent directory containing the Rolling-Log files. Refer to the following default path:

```text
C:\ProgramData\NNT\gen7agent.service\
```

3. Right-click the `Hubdetails.xml` file and select **Edit**.

4. Replace the `<E1>` tag pair with the `<Password>` tag pair. Replace the contents with the current agent account password, as defined on your Netwrix Change Tracker Hub Server. Save the changes.

5. Start the Agent Service. Refer to the following Linux command:

```bash
# service nntgen7agent start
```
