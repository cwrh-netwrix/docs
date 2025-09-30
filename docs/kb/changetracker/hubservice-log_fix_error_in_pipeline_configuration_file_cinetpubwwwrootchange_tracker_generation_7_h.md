---
description: >-
  This article addresses the error related to the pipeline configuration file in the Change Tracker Hub, specifically when the 'queueName' is not specified in the configuration.
keywords:
  - Change Tracker
  - pipeline configuration
  - localhost.json
  - error resolution
  - System.ArgumentException
sidebar_label: Hubservice-Log Fix
tags: []
title: Hubservice-Log Fix: Error in Pipeline Configuration File
knowledge_article_id: kA04u0000000JcTCAU
products:
  - change-tracker
---

# Hubservice-Log Fix: Error in Pipeline Configuration File

## Overview

The `localhost.json` file within the Change Tracker's `inetpub` directory informs the Change Tracker Hub of where its database resides and how to communicate with the database. If an upgrade from Change Tracker .57 to Change Tracker R2, a move to the Change Tracker split architecture, or a Mongo replication set has been implemented, it is possible that the `localhost.json` file has been manually manipulated. When the Change Tracker Hub starts, some validation checks will be performed on the `localhost.json` file to ensure it is in the correct format. Should the validation fail, an error similar to the example below will be logged into the Change Tracker Hub log. If you see these kinds of errors, please contact **Support@nntws.com**, including your `localhost.json` file and `hubservice-log.txt`.

### File Locations

- **localhost.json**: `C:\inetpub\wwwroot\Change Tracker Generation 7 Hub\bin\Configs`
- **hubservice-log.txt**: `C:\inetpub\wwwroot\Change Tracker Generation 7 Hub\log`

### Error Example

```
2019-02-22 12:56:59,376 [11] ERROR Message - Error in pipeline configuration file: C:\inetpub\wwwroot\Change Tracker Generation 7 Hub\bin\Configs\localhost.json
System.ArgumentException: No 'queueName' specified in configuration. [incomingEventQueue]
```

### Stack Trace

```
   at NNT.Hub.Service.Queues.QueueBase`1.TestQueueConfiguration(String section, Dictionary`2 config) in C:\Users\steve\Documents\Visual Studio 2017\Projects\NNT\SVN\Agent\NNT.Hub.Service\Queues\QueueBase.cs:line 99
   at NNT.Hub.Service.Pipeline.PipelineConfiguration.TestConfiguration(PipelineConfiguration config) in C:\Users\steve\Documents\Visual Studio 2017\Projects\NNT\SVN\Agent\NNT.Hub.Service\Pipeline\PipelineConfiguration.cs:line 72
   at NNT.Hub.Service.Web.Hosts.AppHost.Configure(Container container) in C:\Users\steve\Documents\Visual Studio 2017\Projects\NNT\SVN\Agent\NNT.Hub.Service.Web\Hosts\AppHost.cs:line 209
```