---
description: >-
  This article addresses the error message related to the Netwrix Agent's task execution failure due to misconfigured path match definitions and provides steps to resolve it.
keywords:
  - Netwrix Agent
  - task execution error
  - configuration template
sidebar_label: Rolling-Log Fix
tags: []
title: Rolling-Log Fix: "ERROR AgentTaskRunner - task execution failed for task - DeviceConfigTask. Item wildcards match text must not contain separator '\' for MatchType.Wildcards unless ContainerMatchAppliesToWholePath is true.”
knowledge_article_id: kA04u0000000JeICAU
products:
  - general
---

# Rolling-Log Fix: "ERROR AgentTaskRunner - task execution failed for task - DeviceConfigTask. Item wildcards match text must not contain separator '\' for MatchType.Wildcards unless ContainerMatchAppliesToWholePath is true.”

## Overview

This problem can occur when a user misconfigures a configuration template.

### Example Error Message

```
2018-08-25 12:04:35,780 [9] ERROR AgentTaskRunner - task execution failed for task 2 - DeviceConfigTask-1869 
NNT.Agent.Utils.ContainerItemMatch+ContainerItemMatchException: item wildcards match text must not contain separator '\' for MatchType.Wildcards unless ContainerMatchAppliesToWholePath is true.
   at NNT.Agent.Utils.ContainerItemMatch.ValidateMatchPattern(String element, String matchPattern, MatchType matchType, String separator, Boolean containerMatchAppliesToWholePath)
   at NNT.Agent.Utils.ContainerItemMatch..ctor(String rootContainer, Boolean skipRootContainer, String separator, Boolean caseSensitive, Nullable`1 recursionLevels, MatchType containerMatchType, String containerMatchPattern, Boolean containerMatchAppliesToWholePath, MatchType itemMatchType, String itemMatchPattern)
   at NNT.Agent.Core.Tracking.FileSystem.FileSystemTrackerConfigurationCreator.ProcessDeviceConfiguration(DeviceConfiguration deviceConfiguration, IDevice device, String trackerName)
   at NNT.Agent.Core.Tasks.DeviceConfigTask.ApplyDeviceConfigAction(ILifetimeScope scope, IDevice device, DeviceConfiguration configuration, Nullable`1 latestConfigDateUtc)
   at NNT.Agent.Core.Tasks.DeviceConfigTask.Execute(AgentTaskQueue queueContext)
```

## What Does It Mean?

**This means that the agent could not process an item within the advanced 'custom path-match definition' which the user has defined. See the example below - notice that this path match definition has regex code but is set to look for wildcards. In the example below, changing the path match type to "Regex" resolves the issue.**

![Dialog box for selecting monitoring plan settings with the Schedule tab active](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKZf&d=%2Fa%2F4u000000M05T%2FjIk3Csg8.N35nR6yHOIboagynY4NADkJ8uxiCBjDRQM&asPdf=false)

## How Can I Fix This / Should I Worry?

If you are receiving this error, the Netwrix Agent is potentially NOT reporting to your hub. This is a critical error, and for monitoring to continue, it must be resolved. To resolve this error:

1. Log into the **Netwrix Console**.
2. Locate the agent presenting this error and go into each of the configuration templates assigned to that agent, and inspect the custom path matches for misconfiguration.
3. Once you have inspected them and discovered the problematic template, modify or remove the custom path match definition that is causing the issue.
4. Save the configuration template.
5. Check the agent to make sure it has received the new configuration.