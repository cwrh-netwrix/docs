---
description: >-
  This article provides a detailed log of changes and fixes made to the Gen7 Agent, including enhancements and bug fixes across various versions.
keywords:
  - Gen7 Agent
  - change log
  - software updates
  - bug fixes
  - enhancements
sidebar_label: Gen7 Agent Log
tags: []
title: Installing Change Tracker Gen 7: Gen7 Agent Log
knowledge_article_id: kA04u000000PoM1CAK
products:
  - activity-monitor
---

# Gen7 Agent Log

## Overview

This article provides a detailed log of changes and fixes made to the Gen7 Agent, including enhancements and bug fixes across various versions.

### Version 7.0.0.38 - 10 Oct 2019
- **fix:** HELPDESK-4125 re: report rules giving incorrect results when run as part of a report but OK when run alone
- **fix:** HELPDESK-4226 re: applying agent upgrades on Ubuntu
- **fix:** HELPDESK-4357 re: null ref in FileTracer error handling on Ubuntu
- **fix:** HELPDESK-4682 re: live tracking user names
- **fix:** HELPDESK-4030 re: device Discovery Report Not Working Correctly (detecting specifically versioned product IDs)
- **enh:** HELPDESK-4419 re: Port 8096 conflict with Netwrix agent, port is configurable via app setting `webuiport`

### Version 7.0.0.37 - 20 Jun 2019
- **enh:** event date times now use file created/write time for polls
- **enh:** DeviceSettings support added
- **fix:** for live tracked symlink following (HELPDESK-2853)
- **fix:** for spurious change events raised due to changes in properties that should be ignored

### Version 7.0.0.36 - 22 Mar 2019
- **fix:** HELPDESK-3079 re: live tracking on Linux not detecting changes made by `touch` or `vi` (an empty file)
- **fix:** Oracle dotConnect license updated as per HELPDESK-2026
- **fix:** enable control tasks to be sent to SuSE agents
- **enh:** added app setting `symlinkFollowCount` to control the number of symlinks to follow in file tracking, defaults to 0
- **fix:** for detecting deleted files using the recycle bin on Windows (HELPDESK-3243)

### Version 7.0.0.35 - 1 Nov 2018
- **fix:** for issue when lots of changes come in very rapidly (i.e., deleting a folder with thousands of items)

### Version 7.0.0.34 - 01 Oct 2018
- **fix:** for occasional delay in picking up new config from hub due to misinterpretation of config date as local instead of UTC
- **fix:** for terminated polls mistakenly reporting deleted items

### Version 7.0.0.33 - 24 Aug 2018
- **fix:** for error in blacklist checking in processtracker
- **fix:** default `Settings.SendMissingItemAlertDuringBaseline` to true so missing tracked folder alerts are reported
- **fix:** prevent looping of proxied device setup task, when a new proxied device is added but is offline and can't be set up
- **fix:** fix for HELPDESK-2378 re: extracting O/S name on CentOS / RH at version 7 or greater
- **enh:** use `psexec` for agentless Windows connection if it is present and `paexec` is removed
- **enh:** default local command timeout is now configurable via app setting `commandtimeoutseconds`

### Version 7.0.0.32 - 03 May 2018
- **fix:** recovery from `HasConfigurationProblems` state on receipt of RefreshSettings task. Automatic retry of config task after ~2 mins
- **fix:** HELPDESK-1492 Domain Groups and Accounts Changes Tracked When Disabled
- **fix:** InstalledSoftwareDataCollectorLinux now formats the software item name to include the platform re: HELPDESK-1617
- **enh:** sqlite journal mode now configurable via app setting `journalmode`

### Version 7.0.0.31 - 01 Feb 2018
- **fix:** required processes alerts were not reported to hub
- **fix:** Linux file tracking issues relating to user info collection on file creation and immediate deletion

### Version 7.0.0.30 - 15 Jan 2018
- **fix:** proxied device script `replace` command was not executed, or interpreting encoded characters in search and replace text
- **fix:** filecontent tracker live tracking is not restarted correctly on agent restart
- **fix:** allow proxied device agent to execute refresh-settings task when cannot currently connect
- **fix:** for spurious uncategorized process alerts when rebaselining processtracker
- **fix:** V7-259 Report rule results differ depending on whether process.service rule is in a single rule report or multi-rule report
- **fix:** HELPDESK-902 re: agent going offline when sysdig process needs restarting
- **fix:** HELPDESK-854 re: WMTC on Linux not functioning for rapid file creates/deletes
- **enh:** skip discovery on proxied devices for any credentials prefixed No-Connection-Required, or No-Discovery-Required
- **enh:** remove `vcredist.exe` install from Windows installer, no longer required by sqlite
- **enh:** additional optional logging for ItemStorageList for debugging remote report runs
- **enh:** HELPDESK-743 re: Notifications based on groups, alert emails are routed to users on the group the tracking template item originated from, requires hub 7.0.1.55 for feature to be enabled
- **enh:** upgrade to sqlite package removes agent dependency on `vcredist` C++ runtime on Windows

### Version 7.0.0.29 - 03 Oct 2017
- **fix:** database reports not running
- **fix:** handling of report rules referencing registry values with encoded separator characters e.g., `\\*\NETLOGON`
- **fix:** problem with hitting max recursion limit when processing HKEY_USER subkeys in report rules
- **fix:** V7-255 Security policy tracker added `se_LanManServer_Parameters_AutoShareServer`
- **enh:** purge sent events from > 1 week ago once a day

### Version 7.0.0.28 - 25 Aug 2017
- **fix:** failure to discover OS correctly on Redhat 7.3
- **fix:** V7-252 Security Policy Tracker not recording settings for `AuditReceivingNTLMTraffic`
- **fix:** V7-246 File permission changes are not detected on CentOS or RHEL 6
- **enh:** additional nmap options can be specified in .config `networkscanoptions`
- **enh:** processtracker on Linux
- **enh:** inclusion of new 2017 ChangeTracker SSL thumbprint

### Version 7.0.0.27 - 16 Aug 2017
- **fix:** V7-249 Gen7Agent Windows Security Issue - Service Path to executable is unquoted
- **fix:** support TLS 1.2 on non-Windows (Mono) platforms
- **enh:** introduce default trust of CA signed certificates as well as custom trusted thumbprints

### Version 7.0.0.26 - 19 Jul 2017
- **fix:** enable service state alerting a second time when value goes from bad->good->bad
- **fix:** processtracker service data was not collected for report (Windows)
- **fix:** processtracker service state alerts were not raised (Windows)
- **fix:** reporting fixes for eventlog/auditlog `System` items
- **enh:** prefix port scan discovered ports with IP address
- **enh:** raise error to hub if config template contains references to missing match and filter settings
- **enh:** respond to requests from hub for lists of processes and services (Windows)

### Version 7.0.0.25 - 07 Jul 2017
- **fix:** for problem with hang caused by PowerShell 2.0 interaction
- **fix:** for multiple local IP addresses associated with a network scan
- **fix:** for malformed HubDetails.xml included in Unicode installer
- **enh:** added script console to Windows installer

### Version 7.0.0.24 - 30 Jun 2017
- **fix:** V7-236 Windows Gen 7 Agent installer - Unable to process special character
- **fix:** for unhandled error in PingCompletedCallback handler
- **enh:** sysdig enabled by default under Mono (requires sysdig install)
- **enh:** extend default max wait time for nmap scan completion to 1 day (also configurable via app setting `networkscanmaxminutes`)

### Version 7.0.0.23 - 12 Jun 2017
- **fix:** correctly report all three user name cases when using WMTC on Linux (user, sudo & root)
- **fix:** for file event tracking using event log (spurious deletion events)

### Version 7.0.0.22 - 06 Jun 2017
- **enh:** task runners are created on demand up to a maximum of 50. This allows automatic adaptation for agents proxying a large number of devices
- **fix:** use unique names for `export to file` based data collection steps (secpol etc)

### Version 7.0.0.21 - 11 May 2017
- **enh:** V7-224 Agent SecPol tracker missing case statement for Secedit, added: `se_PrivilegeRights_SeDelegateSessionUserImpersonatePrivilege`, `se_Netlogon_RestrictNtlmInDomain`, `se_LanManServer_Parameters_EnableS4U2SelfForClaims`, `se_Netlogon_DcAllowedNtlmServers`, `se_Netlogon_RefusePasswordChange`, `se_LSAClientAllowedNtlmServers`, `se_LSARestrictReceivingNtlmTraffic`, `se_LSARestrictSendingNtlmTraffic`, `se_LSARestrictRemoteSam`, `se_Policies_DcomMachineAccessRestriction`, `se_Policies_SystemDontDisplayLockedUserId`, `se_Winlogon_AutoAdminLogon`, `se_CrashControlAutoReboot`, `se_FilesystemNtfsDisable8Dot3NameCreation`
- **fix:** corrected set file attributes tracked by Security log tracker
- **fix:** collect folder change attributes for folder changes, including user info
- **fix:** V7-227 Windows exe install does not install the agentless binaries

### Version 7.0.0.20 - 26 Apr 2017
- **enh:** Windows installer updates re driver install
- **fix:** fix to init script on CentOS/RH 7 re: service status

### Version 7.0.0.19 - 19 Apr 2017
- **enh:** Windows installer now provides install driver option, enabled by default
- **enh:** symlink paths in form `link >> target` from NNT_FILEHASH are parsed into separate filename and linktarget attributes
- **fix:** local trackers can now run using cached tracking template even if hub is offline
- **fix:** misconfigured proxied device was blocking setup of other devices
- **fix:** rule report data not collected if both empty `<Options>` tag and no `<Options>` tag specified for same tracked item on different rules

### Version 7.0.0.18 - 31 Mar 2017
- **enh:** local filecontent tracker support for wildcards added
- **enh:** limit NNT_FILEHASH symlink follow to a depth of 10 by default
- **enh:** use simple NNT_FILEHASH -x exclusions built from template folder exclusions. Does not support regex
- **fix:** for report rules with unspecified attribute (e.g., `installedsoftwaretracker.installedsoftware`) now returns item name/title as data value

### Version 7.0.0.17 - 24 Mar 2017
- **enh:** SHA256 NNT_FILEHASH support added for proxied devices
- **enh:** increase default file content tracking limit (`filehashmaxforextension_default`) to 141557760 = 135 MB
- **fix:** parsing error looking for -f in bad chunks. Now logs diagnostic error

### Version 7.0.0.16 - 06 Mar 2017
- **fix:** registry tracker handling rules with embedded regex in key path
- **fix:** initial connection to remote device (for platform discovery) must use credentials login script in case prompt is modified
- **fix:** V7-216 default username for login to the local UI is now `admin`

### Version 7.0.0.15 - 27 Feb 2017
- **fix:** correct handling of `DeleteDeviceTask`
- **fix:** for running ESX reports using PowerCLI
- **fix:** for hub `isconnected` status tracking logic
- **fix:** correctly applying rule `<Options>` regex to collected report data
- **fix:** correctly applying rule regex to multiple variables tracking the same command

### Version 7.0.0.14 - 17-Feb-2017
- **fix:** for report tracker items not qualified with specific name being returned twice in the rule variable, resulting in incorrect report scores
- **fix:** for OS version detection on Linux

### Version 7.0.0.13 - 10-Feb-2017
- **enh:** increase default file content tracking limit (`filecontentmaxforextension_default`) to 262144 = 256 KB
- **enh:** agent handles RefreshSettings task from hub to reflect latest proxied device details
- **fix:** for remote filecontent tracking not reporting changes
- **fix:** for remote file tracking reporting baseline items as new

### Version 7.0.0.12 - 03-Feb-2017
- **fix:** for error on startup if proxied device is offline
- **fix:** to exclude folder changes when folders not tracked
- **fix:** for spurious change events when number of attributes tracked for a file change differs
- **fix:** for installed software data not collected for baseline report
- **fix:** for report execution via local agent UI, including combined `specific` and `catch all` rules
- **fix:** send BaselineEvent for deleted items with correct BaselineType=BaselineType.None so they are not treated as current events by the hub, other events sent as BaselineType.Current
- **fix:** for spurious changes alerted when tracking template contains multiple process output items with the same name (now disambiguated with an automatic numeric suffix)
- **fix:** for V7-210, added security policy item `se_Policies_System_NoConnectedUser`
- **enh:** agent temp store folder for dbs and config XML etc moved to `C:\ProgramData\NNT` on Windows and `/var/nnt`
- **enh:** additional report functions to aid Oracle 12c CIS Report development
- **enh:** log `agent starting` audit to hub on restart

### Version 7.0.0.11 - 22-Dec-2016
- **fix:** for error executing script statement `'Send,$$PASSWORD$$'. Error: Value cannot be null. Parameter name: oldValue.`
- **fix:** for initial agent registration problem
- **enh:** added Windows local user account tracking

### Version 7.0.0.10 - 30-Nov-2016
- **fix:** better handling of access failure return in remote file hashing scenario
- **fix:** for whole drive live tracking from root on Windows
- **enh:** added new Oracle database attribute `auditOptionsByAccess` to support CIS reports

### Version 7.0.0.9 - 21-Nov-2016
- **fix:** error handling `AgentTaskStatus.Terminated` in `Task.UpdateStatus()` was causing task runner to stop
- **enh:** send report % complete to hub event N items during run
- **enh:** streamed report data collection and delivery for reduced memory consumption. Requires Hub 7.0.1.45.
- **enh:** added Windows and Linux filecontent live tracking

### Version 7.0.0.8 - 08-Nov-2016
- **fix:** events raised from a tracked item deletion when they shouldn't be
- **fix:** file live tracking not correctly reset on reconfiguration
- **fix:** Win10 OS variants detection
- **enh:** added security policy attributes: `se_Policies_System_Kerberos_Parameters_SupportedEncryptionTypes`, `se_Policies_System_MaxDevicePasswordFailedAttempts`

### Version 7.0.0.7 - 07-Oct-2016
- **enh:** live file user tracking via `nntinfo.sys` driver added
- **enh:** new local Windows trackers supported: process and services
- **fix:** improvements to code when invalid UID/GID is set for tracked file/folder on Linux

### Version 7.0.0.6 - 22-Sep-2016
- **enh:** add support for MsgPack format for agent-hub comms
- **enh:** update ServiceStack to version 4.5.0.0
- **enh:** added initial autoupdate support
- **fix:** to enable filecontent tracker functions

### Version 7.0.0.5 - 07-Sep-2016
- **enh:** new - remote Windows trackers supported: filesystem
- **enh:** new - remote Linux trackers supported: filesystem
- **enh:** improved tracked item storage performance via transaction

### Version 7.0.0.4 - 19-Aug-2016
- **enh:** improved OS detection on Linux
- **fix:** correct deletion date on item-deleted change events

### Version 7.0.0.3 - 17-Aug-2016
- **enh:** added security policy attributes: `se_Kerberos_Policy_TicketValidateClient`, `se_Kerberos_Policy_MaxServiceAge`, `se_Kerberos_Policy_MaxClockSkew`, `se_Kerberos_Policy_MaxRenewAge`, `se_Kerberos_Policy_MaxTicketAge`, `se_Netlogon_AuditNtlmInDomain`, `se_LSAAuditReceivingNtlmTraffic`, `se_Policies_System_InactivityTimeoutSecs`
- **enh:** new local Windows trackers supported: filecontent
- **enh:** new remote Windows trackers supported: filecontent, processoutput
- **enh:** new local Linux trackers supported: filecontent
- **enh:** new remote Linux trackers supported: filecontent
- **fix:** trackers with