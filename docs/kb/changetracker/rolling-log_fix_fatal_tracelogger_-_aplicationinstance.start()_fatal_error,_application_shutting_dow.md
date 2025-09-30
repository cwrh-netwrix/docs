---
description: >-
  This article explains the "FATAL TraceLogger - ApplicationInstance.Start() Fatal error" message and provides steps to resolve the issue of the application shutting down due to an address already being in use.
keywords:
  - TraceLogger
  - SocketException
  - ApplicationInstance
  - Netwrix Agent
  - Port Conflict
sidebar_label: Rolling-Log Fix
tags: []
title: Error: FATAL TraceLogger - ApplicationInstance.Start() Fatal Error, Application Shutting Down
knowledge_article_id: kA04u0000000Ja6CAE
products:
  - change-tracker
---

# Error: FATAL TraceLogger - ApplicationInstance.Start() Fatal Error, Application Shutting Down

## What Does It Mean?

This error occurs when you have another application using the local agent UI port (6.5 Agent - Port 8095 or Gen7 Agent - Port 8096).

## How Can I Fix This / Should I Worry?

If you are receiving this error, the Netwrix Agent is **NOT** reporting to your hub. This is a critical error, and for monitoring to continue, it must be resolved.

To resolve this error:

1. Check to see if anything is using Port 8095 or 8096.
2. Determine if that port number can be easily changed, or if it cannot.
3. Change the port of that application, or, if it cannot be changed, you can choose to disable the local UI port altogether:
   1. Modify the `NNTAgentService.exe.config` file (`C:\Program Files\NNT Change Tracker Suite\Agent\NNTAgentService.exe.config` or `/opt/nnt/agent/bin/NNTAgentService.exe.config`).
   2. Change the below value to `0` to disable, or assign a new, available port to it.
4. Restart your Netwrix Agent Service.

## Example Error Message

```
2018-03-26 10:31:37,607 [AgentService.WorkerThread] FATAL TraceLogger - ApplicationInstance.Start() 
Fatal error, Application shutting down. Error: Address already in use 
System.Net.Sockets.SocketException: Address already in use
  at System.Net.Sockets.Socket.Bind (System.Net.EndPoint local_end)  
  in :0 
  at System.Net.EndPointListener..ctor (System.Net.IPAddress addr, Int32 port, Boolean secure)  
  in :0 
  at System.Net.EndPointManager.GetEPListener (System.String host, Int32 port, System.Net.HttpListener listener, Boolean secure) 
  in :0 
  at System.Net.EndPointManager.AddPrefixInternal (System.String p, System.Net.HttpListener listener)  
  in :0 
  at System.Net.EndPointManager.AddListener (System.Net.HttpListener listener)  
  in :0 
```

## Related Articles

- [How to fix the "Check Log for Details" message in the event details](https://kb.netwrix.com/8133)
- [Support for TLS 1.2 in the .NET Framework 3.5.1](https://kb.netwrix.com/8302)
- [MongoDB - Pre-allocated Log Files Accumulate & Result to Disk Space Errors](https://kb.netwrix.com/8285)
- [Change Tracker – How to Create a Custom Tracked Attributes Filter Within a Configuration Template](https://kb.netwrix.com/8265)
- [How To Turn Off Bulk Email Notifications (Force Change Tracker to send one email for each change instead of compiling into one email with multiple changes)](https://kb.netwrix.com/8284)