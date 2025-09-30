---
description: >-
  This article provides a step-by-step guide to resolve the "AgentTaskRunner - task execution failed for task 11 - TrackerPollTask-Baseline-processtracker-88" error in the Rolling Log.
keywords:
  - Rolling Log
  - AgentTaskRunner
  - TrackerPollTask
  - Change Tracker
  - error resolution
sidebar_label: Rolling-Log Fix
tags: []
title: Rolling-Log Fix: "AgentTaskRunner - task execution failed for task 11 - TrackerPollTask-Baseline-processtracker-88"
knowledge_article_id: kA04u0000000JZhCAM
products:
  - change-tracker
---

# Rolling-Log Fix: "AgentTaskRunner - task execution failed for task 11 - TrackerPollTask-Baseline-processtracker-88"

## Overview

This article will assist with clearing the error below from showing up in your Rolling Log.

### Example Error Message

```
2018-04-10 10:56:26,887 [7] ERROR AgentTaskRunner - task execution failed for task 11 - TrackerPollTask-Baseline-processtracker-88
NNT.Agent.Tracking.TrackerException: no data collector registered for: processtracker-local
      at NNT.Agent.Core.Tracking.TrackerBase.GetDataCollector (System.String collectorName, System.Boolean throwException) [0x0002e] in :0
      at NNT.Agent.Core.Tracking.TrackerBase.PollInternal (NNT.Agent.Core.Tracking.PollControl pollControl, NNT.Agent.Core.Interfaces.IDevice device, NNT.Agent.Core.Interfaces.ITrackerConfiguration 
			configuration, NNT.Agent.Core.Interfaces.IItemStoragePipeline queue, NNT.Agent.Core.Tracking.PollType pollType, System.DateTime pollStartTimeUtc) [0x0004c] in:0
      at NNT.Agent.Core.Tracking.TrackerBase.Poll (NNT.Agent.Core.Tracking.PollControl pollControl, NNT.Agent.Core.Interfaces.IDevice device, NNT.Agent.Core.Interfaces.IItemStoragePipeline queue, 
			NNT.Agent.Core.Tracking.PollType pollType, System.DateTime pollStartTimeUtc) [0x00075] in :0
      at NNT.Agent.Core.Tasks.TrackerPollTask.Execute (NNT.Agent.Core.Queue.AgentTaskQueue queueContext) [0x00279] in :0
```

## Cause

This error is usually caused due to the process tracker in **Change Tracker** being enabled, but no specified processes are set to be tracked.

## Resolution

To stop this error from occurring, you will need to edit the configuration template assigned to the device that the error is occurring on, and either input at least one process to track or disable the tracker.

1. Log into **Change Tracker** and navigate to **Devices** > Select the device experiencing the error > Select the configuration template that is causing the issue.
2. Either uncheck the **Track processes and services in this template** box, or add some services to be tracked. See example below:

![Configuration Template Example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKS6&d=%2Fa%2F4u000000Lzec%2FgSrqbKoZUhG4Tm0yz9_GBwVcNMcOi5Juo9LK7QNCkAE&asPdf=false)

## Related Articles

- [How to move your Linux Server MongoDB Database to a Windows server?](https://kb.netwrix.com/8283)
- [Supporting Documents for Hub Server Problems](https://kb.netwrix.com/8273)
- [How to fix the "Check Log for Details" message in the event details](https://kb.netwrix.com/8133)
- [Change Tracker Gen 7 Change Log / Update Log / ReadMe.txt Documents for Agent/Hub](https://kb.netwrix.com/8368)

**Attachments:**
- [image2018-4-17_14-21-50.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKEk&d=%2Fa%2F4u000000LzlV%2FizlMPEs23Jzy9BoSzZdCpVnwL4BI03fjqLxug9Ylads&asPdf=false)
- [image2018-4-17_14-21-32.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKMZ&d=%2Fa%2F4u000000LzwM%2FsyO0l9blw01WX_0xquxvVJgglPcJdhRNNPs87Es3Va0&asPdf=false)