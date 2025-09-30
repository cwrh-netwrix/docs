---
description: >-
  This article provides a detailed log of the updates and fixes made to the Gen7 Hub Service, including enhancements and bug resolutions across various versions.
keywords:
  - Gen7 Hub Service
  - Change Tracker
  - update log
sidebar_label: Gen7 Hub Service Log
tags: []
title: Installing Change Tracker Gen 7: Gen7 Hub Service Log
knowledge_article_id: kA04u000000PoM0CAK
products:
  - activity-monitor
---

# Installing Change Tracker Gen 7: Gen7 Hub Service Log

## Overview

This article provides a comprehensive log of the updates and fixes made to the Gen7 Hub Service for Change Tracker Gen 7. It details enhancements, bug fixes, and version changes from the initial release to the latest version.

### Version 7.0.1.57 - 08-Jun-2018
- **Enhancement:** Reduced minimum allowed planned change window size to 0 (was 10 minutes).
- **Enhancement:** Show planned change member groups count and explicitly added devices count in planned change summary grid UI.
- **Fix:** For HELPDESK-1814, re-run query now button not functioning correctly on scheduled query results.
- **Fix:** For HELPDESK-1724, event filter does not work in new version.
- **Fix:** For HELPDESK-1703 regarding large file content event changes.
- **Fix:** For HELPDESK-1528, remove ending date information in planned change.

### Version 7.0.1.56 - 09-May-2018
- **Fix:** HELPDESK-1709 regarding unable to create new planned change.
- **Fix:** Set `ServicePointManager.SecurityProtocol` for FAST calls where local TLS protocols are disabled.
- **Fix:** For HELPDESK-1462, events grid not including final second of end date.
- **Fix:** For search for planned change status = NotRelevant did not return all events.
- **Fix:** HELPDESK-1235 regarding excluding some servers from planned change.
- **Fix:** For local accounts tracker filter on events page.
- **Fix:** HELPDESK-1257 regarding using text can't sort via an index so can exceed MongoDB memory limit. Added app setting `TextSearchMethod = regex`.
- **Fix:** HELPDESK-1359/1603 regarding renaming groups.
- **Fix:** HELPDESK-1531 regarding schedule query interval set to 0 minutes.
- **Enhancement:** Added `EventBlockEnabled` to agent at API level to reject event submission from rogue agents.
- **Enhancement:** Updated bundled MongoDB with Windows installed to 3.6.3.
- **Enhancement:** Additional tracking template caching for large estates.
- **Enhancement:** API enhancements for individual devices in planned changes.
- **Enhancement:** Updated compliance reports with 30 Apr 2018 builds.

### Version 7.0.1.55 - 15-Jan-2018
- **Fix:** For high CPU use when re-queued Fast lookup attempted with no FAST API key set.
- **Fix:** V7-259 report rule results differ depending on whether `process.service` rule is in a single rule report or multi-rule report.
- **Fix:** HELPDESK-644 regarding scheduled exports of baseline events.
- **Fix:** HELPDESK-546 regarding scheduled reports - Parent/Child Group Issue.
- **Fix:** Alert events now also returned when searching by planned change ID.
- **Fix:** Agents sending very large report results via streamed file.
- **Fix:** Raise an error to caller when FAST/whitelist test call fails (rather than just logging error).
- **Fix:** V7-244 tracked attributes - "File Attributes (including contents) only" doesn't display attributes that change.
- **Enhancement:** Existing reports updated 12/1/18.
- **Enhancement:** Report error when bad report template name requested for ad-hoc run.
- **Enhancement:** Additional date-based event MongoDB index for use when no other query filters set.
- **Enhancement:** HELPDESK-1048 database example connection strings are misleading - removed * from example DB connection strings.
- **Enhancement:** Set default 'New Line' for new 'Windows device' credentials in UI to CR rather than CRLF.
- **Enhancement:** Planned change instance evaluation order is based on alpha sort of Description field. Use ~ prefix to place a planned change at the end of the list.
- **Enhancement:** HELPDESK-743 regarding notifications based on groups; alert emails are routed to users on the group the tracking template item originated from, requires gen7agent 7.0.0.30 for feature to be enabled.
- **Enhancement:** New config key `MinimumFileHashReputation` set to either AssuredGood (the default if no setting) or AssumedGood controls the level of Whitelist assurance that maps to a 'planned' event in a planned change.
- **Enhancement:** Added `CIS Windows Server 2016 Base Template.xml` template.
- **Enhancement:** Added POST file name to Whitelist, returned reputation now logged.
- **Enhancement:** Planned change members can be managed individually via API.
- **Enhancement:** Added support for new FAST FileHashStatus return codes.
- **Enhancement:** HELPDESK-537 regarding the ability to schedule polled trackers, compliance reports, and saved queries to run on a monthly basis.
- **Enhancement:** Change process tracking option 'Report start & stop events (alerts will be raised...)' to 'Report white & greylisted notifications...'.
- **Enhancement:** New advanced setting "ScheduledQuerySendsEmptyAttachments" to always send empty attachments when part of scheduled query run (usually they are suppressed). Set to "Yes" to activate.
- **Enhancement:** Connect to MongoDB using SSL (beta).
- **Enhancement:** Updated SSL certificate added. Only applied on new install. Agents with built-in compatibility with new SSL thumbprint are: gen7agent 7.0.0.28, agent: 1.0.0.109, proxy: 1.0.0.106, express: 2.0.0.8.
- **Enhancement:** Added Task List export feature to compliance page.
- **Enhancement:** Added "Run Now" button to compliance page to run a set of compliance reports for a group.
- **Enhancement:** When exporting baseline events exclude 'tcpopen' value from network tracker NMap scans.

### Version 7.0.1.54 - 19-Jul-2017
- **Fix:** Stop evaluating planned changes after a match is found.
- **Fix:** Correctly propagate template changes to devices when new template XML is uploaded.
- **Fix:** Add process rule to template for uncategorized process from events page UI.
- **Fix:** Re-enable querying processes and services on a device from hub UI.
- **Fix:** Error on agent poll when custom template group deleted.
- **Enhancement:** Enable planned change rule combination and/or operator editing in UI.
- **Enhancement:** GET based REST API authentication can be disallowed by setting 'auth.postonly=true' in appSettings.config.

### Version 7.0.1.53 - 03-Jul-2017
- **Fix:** V7-239 "Planned Change History - Last 7 days" graph does not update.
- **Fix:** Deleted proxied devices should not be reported as available to the master proxying them.
- **Fix:** Nmap network port scanner failed to scan local device with multiple IP addresses.
- **Enhancement:** Allow merge of templates with differing `AccountsTracker.TrackDomainControllerAccounts` settings; values are now OR'd.
- **Enhancement:** Updated rule logic and wording of autogenerated installed software baseline report.

### Version 7.0.1.52 - 15-Jun-2017
- **Enhancement:** V7-230 impose an upper limit to the number of rules that can be created for a Planned Change in recording mode. Upper limit is set via new config key `MaxRecordedRulesPerPlannedChange` (1000 default).
- **Enhancement:** Added `MaxReportDetailLength` config key advanced setting for size of detail column cell when displaying/exporting (32750 default).
- **Enhancement:** Update to merge of file tracking templates to allow merge of subfolder where path match specifies no recursion.
- **Enhancement:** Added Events index to find by taskId to improve performance of report-view page.
- **Enhancement:** Updated manuals: 'Netwrix Change Tracker Gen 7 Getting Started Guide V2.0.pdf' and 'Netwrix Change Tracker Gen 7 Admin Guide V2.0.pdf'.
- **Enhancement:** Updated project references to .NET 4.6.1 from 4.5. Windows Hub Installer now requires .NET 4.6.1 installed.
- **Enhancement:** Updated installer to install gen7agent on new install; 6.5 agent and proxy removed.
- **Enhancement:** Additional Fast Whitelist diagnostics (on event history); 'Test Fast Connectivity' & 'Test Fast Credentials' buttons added to system settings page.
- **Enhancement:** gen7agent now installed with Windows install instead of 6.5 agent + proxy.
- **Fix:** V7-232 Settings > Users. Cancelling editing a newly-cloned User Role causes it to disappear from the grid.
- **Fix:** Settings > Planned Changes. Grid Delete button was generating an error message.
- **Fix:** Event Details window sometimes showed an empty Details section.
- **Fix:** 'Use SSL' setting not correctly passed to server on system-settings page 'test email' function.
- **Fix:** Ignore empty hash values from 6.5 agents.
- **Fix:** V7-229 regarding exporting baseline events to PDF.

### Version 7.0.1.51 - 05-May-2017
- **Enhancement:** Automatically convert agents with 'Unknown' Device Type to Windows or Unix the first time the agent calls in.
- **Enhancement:** Include baseline event details when exporting to Excel from events grid.
- **Enhancement:** FAST service details now supplied via license.
- **Fix:** 'Name' related validation error when extending planned changes.

### Version 7.0.1.50 - 20-Apr-2017
- **Enhancement:** Added new 'ESX Report' and 'ESX FIM' pre-defined credentials settings.
- **Fix:** V7-225 when displaying/downloading saved query results regarding timezones.

### Version 7.0.1.49 - 29-Mar-2017
*** INTERNAL RELEASE ONLY ***
- **Enhancement:** In addition to remote requests, local requests are now checked for possible cross-site request forgery.
- **Enhancement:** Added "Compare Results" button to devices page.
- **Enhancement:** Add report name to logged error message when rule XML typos detected.
- **Enhancement:** Added 'ipBlocking', and 'ipBlocking/add' and 'ipBlocking/delete' API routes for IP blacklisting management.
- **Enhancement:** Updated manuals in Windows installer, and added 'Netwrix Change Tracker Gen 7 - Agent Installation Guide.pdf' and 'Netwrix Change Tracker Gen 7 - Gen 7 Agent Installation Guide.pdf'.
- **Enhancement:** Updated reports and tracking templates.
- **Enhancement:** Added following filter files "Chrome Update Exclusions.xml", "Sophos AntiVirus Update Exclusions.xml", "Symantec Endpoint Protection Update Exclusions.xml", "Trend Micro Update Exclusions.xml".
- **Enhancement:** Update to ServiceStack 4.5.6, and incorporate latest MongoDbAuthRepository in FipsMongoDbAuthRepository.
- **Enhancement:** Upgrade Mongo repositories to latest Mongo driver style.
- **Fix:** Reserved characters in file names prevented their successful download.
- **Fix:** If agent task results are an error, then indicate this in the task list immediately, not via a background task.
- **Fix:** V7-207 Agent Registration Admin page allowed multiple Agent Registration Reports to be uploaded.
- **Fix:** To devices page report section on IE11.
- **Fix:** V7-221 'EventCountsSummary not found for UTC date' error on dashboard when view counts as days in a timezone in daylight saving.
- **Fix:** To preserve CustomerFilters.xml edited file on upgrade.
- **Fix:** For report rules with unspecified attribute (e.g., installedsoftwaretracker.installedsoftware) now returns item name/title as data value.

### Version 7.0.1.48 - 22-Feb-2017
- **Enhancement:** Filter out registration report results from dashboard compliance stats list.
- **Enhancement:** Updated reports: 'Netwrix CIS VMware ESXi 5.5 Benchmark Level 1 V1.2.0.xml' and 'Netwrix CIS VMware ESXi 5.5 Benchmark Level 2 V1.2.0.xml'.
- **Fix:** V7-212 regarding planned change name on events export.
- **Fix:** V7-213 compliance report runs twice during scheduled run.
- **Fix:** V7-199 regarding including changed user on event exports.
- **Fix:** Make cache warmup code more resilient.
- **Fix:** Exporting event data with very large change details value.
- **Fix:** To handle residual events about a proxied device from an agent from which the proxied device has been removed.

### Version 7.0.1.47 - 10-Feb-2017
- **Enhancement:** Fix to event detail popup to hide previous attributes column for new/deleted events.
- **Enhancement:** Update to Active Directory user integration: usernames can now contain \ to allow specification of domain name; max username length is now 60 to allow domain prefix.
- **Enhancement:** Reset admin password now clears 'AD user' flag to allow local admin recovery login.
- **Enhancement:** User cannot be set to 'AD user' login if no AD settings configured.
- **Enhancement:** Hub now sends a 'RefreshSettings' task to agents when details are edited, so the changes are picked up ASAP.
- **Enhancement:** Added Reload button to devices page to refresh device details.
- **Fix:** Failure to correctly fallback to secondary AD server.
- **Fix:** V7-204 AD authentication on Linux.
- **Fix:** To allow a gen7 agent to take over the identity and settings of a previous 6.5 agent.

### Version 7.0.1.46 - 30-Jan-2017
- **Enhancement:** V7-202 enhancements to saved query notifications.
- **Enhancement:** V7-95 include a reoccurring planned change option configurable via UI and API using: `PlannedChangeInstance.PeriodicityMinutes` and `PeriodDurationMinutes.PeriodicityCount`, `PeriodicityUnit`, `PeriodDurationCount`, and `PeriodDurationUnit`.
- **Enhancement:** V7-193 event export enhancements (set config setting "IncludeDevicesWithNoEventsInEventExport" to "Yes" to enable).
- **Enhancement:** V7-179 addition of hostname:// prefix to syslog messages.
- **Enhancement:** Added remote device IP address to logged error messages in hubservice-log.txt, to diagnose agent login failures.
- **Enhancement:** Added 'plugins.validationenabled' boolean appSettings key to control enhanced API validation module.
- **Enhancement:** Report rules generated from baseline/state events now have `RemoveEmptyValues=true`, and `AllowMissingDataInNamedVariables` set for the tracked data variable.
- **Fix:** V7-178 planned change schedule, configured in user time but displayed in GMT time.
- **Fix:** Minor fixes to planned change API operations.
- **Fix:** Pushing notification of proxied device move between agents, based on last config dates returned from poll.
- **Fix:** V7-189 re-addition of change details to syslog message.
- **Fix:** Dashboard statistics enabled for all timezones. Stats unit controlled by system setting `EventStatsUnitSeconds`, now defaulting to 30 minutes.
- **Fix:** V7-206 reduce default trial license device count to 6 devices.
- **Fix:** V7-203 editing a pre-defined schedule doesn’t hold the Schedule Start and End times.

### Version 7.0.1.45 - 22-Nov-2016
- **Enhancement:** Added custom role/permissions editor to Settings > Users admin page.
- **Enhancement:** Improved planned change processing performance by using cache.
- **Enhancement:** Remove obsolete built-in 'Stats' role.
- **Enhancement:** Challenge-response based device deletion API added.
- **Enhancement:** New config setting `DeleteDevicesOfflineForSeconds`. If this setting is present and > 0, devices offline for this amount of time are automatically deleted.
- **Enhancement:** New config setting `SessionTimeout`. If this setting is present and > 0, users will be logged out after this many minutes (default 10 minutes if not set).
- **Enhancement:** New config setting `SessionTimeoutWarning`. If this setting is present and > 0, users will be warned this many seconds prior to pending logout (default 30 seconds if not set).
- **Enhancement:** Added custom planned change rule type to the planned change rule processing.
- **Enhancement:** Remove obsolete 'RuleSetDisaggregatorThread down' message from System Status page.
- **Enhancement:** Added CSV export for events to "Export and Import" page to allow larger quantities of events to be exported.
- **Enhancement:** Added 'plugins.metadataenabled' and 'plugins.swaggerenabled' boolean appSettings keys to control whether the API metadata and swagger pages are available.
- **Enhancement:** Added a new Settings > Agent Registration page to administer agent registration report/script.
- **Fix:** V7-187 regarding improved stability and resilience of file downloads.
- **Fix:** For gen7agents not auto-registering.
- **Fix:** Correctly audit config item name on deletion.
- **Fix:** Group level notifications didn't propagate up group hierarchy.
- **Fix:** Editing processes and services in config template was not preserving edits on roundtrip.
- **Fix:** GroupReportResultEvent events were causing failure to calculate dashboard event stats for the hour in which they occurred.
- **Fix:** Ensure notifications are logged to store even if no mail/syslog delivery settings specified.
- **Fix:** For notification thread stopping under Mono when using new Razor templates.
- **Fix:** V7-189 regarding limited details on the syslog alert.
- **Fix:** V7-191 regarding creating baseline reports using path depth feature.
- **Fix:** Log error when `pipeline.IpAddressActivityRepository` is not configured in `localhost.json` in an upgrade scenario, and continue without blacklisting enabled.
- **Fix:** V7-192 event filter window can become too small when options are selected/deselected.
- **Fix:** Clear stored uniqueId at hub when a legacy device without a unique id is taking over an agentDeviceId.

### Version 7.0.1.44 - 13-Oct-2016
- **Fix:** Correctly invalidate cache of SMTP and other config items when they are updated by ID rather than name