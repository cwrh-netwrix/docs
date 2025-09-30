---
description: >-
  This article provides a detailed log of the changes and enhancements made in the Gen7 R2 Hub Service, including fixes, enhancements, and requirements for MongoDB.
keywords:
  - Change Tracker
  - Gen7 R2
  - Hub Service Log
sidebar_label: Gen7 R2 Hub Service Log
tags: []
title: Installing Change Tracker Gen 7: Gen7 R2 Hub Service Log
knowledge_article_id: kA04u000000PoLvCAK
products:
  - activity-monitor
---

# Installing Change Tracker Gen 7: Gen7 R2 Hub Service Log

## Overview

This article provides a detailed log of the changes and enhancements made in the Gen7 R2 Hub Service, including fixes, enhancements, and requirements for MongoDB.

### 7.2.1.21 - 04-Oct-2019

***NB Mongo Db 3.6.3 is now required, 3.6.9 or above recommended***

- fix: HELPDESK-4547 Groups **Export Members** Button missing
- fix: HELPDESK-4631 BUG - Inconsistencies in tracking templates when viewed by different users
- fix: for previous group avg score calculation in summary compliance report
- fix: for miscalculated dashboard widget chart heights in chrome
- enh: new User Role **Report Admin** grants holder the permissions to view/edit all reports in system. Default admin account now has this role.
- enh: new config key **MaxDevicesInComplianceReport** can be used to increase the maximum number of devices allowed in a compliance report run from the default of 50000
- enh: new config key **ComplianceReportTasksIssuedPerSecond** can be used to alter the rate of issuing report tasks to agent from the default of 10. Setting to 0 issues all tasks at once.
- enh: added CIS certified Windows Server 2019 reports.
- enh: added CIS certified Windows 10 Release 1809 reports.

### 7.2.1.20 - 21-Aug-2019

***NB Mongo Db 3.6.3 is now required, 3.6.9 or above recommended***

- fix: HELPDESK-4124 New Agents Automatically Get Placed in **Deleted Group** when **DeleteDevicesOfflineForSeconds** advanced setting is configured
- fix: for **Object reference error** in report summary text running group compliance report when some members of the group are offline
- enh: HELPDESK-4121 Added secure / unsecure TCP options for Syslog
- enh: HELPDESK-4129 Enable the **x items per page** option on the Devices page
- enh: HELPDESK-3718 Proxied Device selection issue, list only the selected proxied device on admin page (under parent) if a proxied device selected
- fix: HELPDESK-4168 re: **stuck** layout rendering template
- enh: HELPDESK-3448 New config key **LoadConfigTemplates** can be used to prevent config templates from being re-loaded after they have been removed from **SetupGroups.json** and deleted from the UI
- enh: Addition of CIS Red Hat Enterprise Linux 5 Benchmark Level 1 and 2 reports
- enh: HELPDESK-4229 Include notification method in user notifications CSV export

### 7.2.1.19 - 25-Jun-2019

***NB Mongo Db 3.6.3 is now required, 3.6.9 or above recommended***

- fix: **All Devices All Events** etc default queries were not correctly created in new install
- fix: HELPDESK-4017 User restrictions and the dashboard widgets
- fix: HELPDESK-4014 Name Column Blank in Device Page for User Role
- fix: HELPDESK-3787 Cannot View the Operating System Of A Proxy Device On The Groups Page
- fix: HELPDESK-3858 Group Page Refresh Notifications when change group selection
- fix: HELPDESK-3805 Group Actions Buttons Scroll Off Screen
- fix: HELPDESK-3540 Moving Groups (autoscroll tree)
- fix: HELPDESK-3737 Custom Report Introduction Text Not Provided in Reports Delivered via Email
- fix: HELPDESK-3857 Device Report: Online Status Filter Bug
- fix: HELPDESK-3823 Cloned User Role Bug
- fix: HELPDESK-3945 Updating user with large number of notifications
- enh: further CEF syslog formatting
- enh: new **Itsm** role includes minimum permissions required for Itsm integration

### 7.2.1.18 - 02-May-2019

***NB Mongo Db 3.6.3 is now required, 3.6.9 or above recommended***

- enh: HELPDESK-3738 Add From Existing Ruleset Takes Time / Times out => change PC wizard ruleset selection to search by **name contains** rather than picklist, to allow for handling otherwise large lists of rulesets
- enh: reduce time taken to query incoming queue length
- enh: added CIS certified Ubuntu 18.04 compliance reports
- enh: improvements to processing core to enable distribution of report processing tasks
- enh: improvements to events/planned change reports event summary section (HELPDESK-3658 Report Chart)
- enh: addition of new Reports index on type (oid_1__t_1)
- enh: ensure that all dependent UI pages refresh when TimeZone is changed using new timezone selector in LHS panel
- enh: update compliance page grid headers to use standard user date format
- enh: improvements to gridFs cleanup routine causing reporting slowdown on some upgraded installs
- fix: for missing alert description in events grid
- fix: HELPDESK-3693 Device Last Poll Time Report Issue
- fix: for Compliance report total percentage
- fix: for report table of contents failing to display
- fix: for device page events detail chart query to correspond with events shown on events page
- fix: for missing planned change ruleset displayname value on legacy planned changes, causing failure to display in grids
- fix: for js error deleting SMTP mail server settings from UI

### 7.2.1.17 - 05-Apr-2019

***NB Mongo Db 3.6.3 is now required, 3.6.9 or above recommended***

- enh: addition of new Events index on PlannedChangeStatus (oid_1_pcs_1_dt_-1)
- enh: show group member changes (added, removed) in change event description
- fix: agent update schedules in the future are now honoured
- fix: ignore OverwriteIfExists flag when uploading Compliance Report Xml templates. The internal report version numbers are now honored, so a new edit of a report must be given a new version
- fix: compliance results for a new device appeared in wrong position in grid when added to an existing group
- fix: to allow large numbers of events to be rendered in pdf report (removing document overflow error)
- fix: for events filter when selecting only Local Accounts events
- fix: HELPDESK-3614 Proxy Agent Process Tracker, Device Type shows in details and Process Tracker details grid populated
- fix: HELPDESK-3504 Search devices is not working properly. DeviceFilterManage permission added to **User** role, filters sorted before return from API
- fix: HELPDESK-3626 Licensing Page Bug. License details correctly being shown
- fix: Config Template - SUSE LES 11 Base.xml, Oracle Linux 6 CIS Base Template.xml, syntax errors corrected (greater than ampersand encoding etc)

### 7.2.1.16 - 18-Mar-2019

***NB Mongo Db 3.6.3 is now required, 3.6.9 or above recommended***

- enh: performance tuning for bulk event re-submit workloads triggered by sync service
- enh: new Devices Monitoring report added
- enh: events/planned change reports now have **Align to previous unit (hour or day)** option to standardize the event time period reported on whatever the execution time
- enh: events/planned change reports can now be offset back a number of days to report on N days ago
- enh: new config key **MaxEventsInReport** can be used to increase the maximum number of events listed in a pdf events report from the default of 500
- enh: for HELPDESK-3044 Increase Event List from 1000 to Higher - events page has new **All Events** button to match all events in query not just current page, resubmit and add to planned change bulk operations supported
- chg: Planned Change **recording mode** feature retired due to incompatibility with future scaling plans
- fix: Planned Change **resubmit events** now uses current date range selection from LHS panel to choose events to resubmit

### 7.2.1.15 - 01-Mar-2019

***NB Mongo Db 3.6.3 is now required, 3.6.9 or above recommended***

- enh: Devices page has new refresh on date range change support
- enh: Devices page Reports tab now supports report download using the formats available on the Reports page
- enh: Reports page has options to include a subset of the agents in a compliance report run in the results
- enh: Planned Change Summary Report available, with date filters to select PC active date range
- enh: optimisation to only add registration tasks for devices currently online on each pass
- enh: add **Include Default System Reports** filter checkbox to Reports page
- enh: log warnings if malformed localhost.json database settings are detected
- enh: improved caching of group and device hierarchy to improve system responsiveness
- fix: user group restrictions are now applied when searching for devices and adding device/group selections to favourites list
- fix: admin device link from devices => admin devices page
- fix: handle missing reportDataRepository section in localhost.json config file by creating one based on default settings
- fix: handle report version number parsing on under languages where decimal point is a comma etc
- fix: for HELPDESK-3202 All devices change events not showing in graphs dashboard
- fix: for HELPDESK-3369 CSV delivery file via email is corrupt

### 7.2.0.14 - 04-Jan-2019

***NB Mongo Db 3.6.X is now required***

- enh: compliance templates updated
- enh: better reporting of failure to compare reports due to duplicated rule titles in rule xml
- fix: for correct filtering using search text in events query report
- fix: dashboard reset editing state on logout timeout
- fix: for HELPDESK-2325 creating/editing **access problem** planned change rules
- fix: for GridFS access when FIPS enabled

### 7.2.0.13 - 12-Dec-2018

***NB Mongo Db 3.6.X is now required***

- enh: package mongodb-win32-x86_64-2008plus-ssl-3.6.9-signed.msi with new installs
- enh: improve dashboard performance
- enh: compliance templates updated
- enh: improve device page performance
- enh: improve cache warmup performance to decrease application startup time
- enh: added Device page **online status** filter to filter display strip.
- enh: UI login process alteration; don’t refresh page when server comes back online and user session hasn’t changed
- fix: to navigation from dashboard page to compliance
- fix: for HELPDESK-2854 re: **red hat** vs **redhat**
- fix: to syslog notification as per HELPDESK-2851
- fix: for compliance page re: incorrect headers, support for large groups and missing page control
- fix: corrected link on devices page for compliance report

### 7.2.0.12 - 04-Dec-2018

***NB Mongo Db 3.6.X is now required***

- enh: updated compliance reports with 13 Jul 2018 builds
- enh: track whether an event was added to a planned change manually, or via a rule. Resubmit events supports the ability to filter on this flag
- enh: events manually added to a planned change must now be within its date range
- enh: appSettings.config entries to control send of initial online/offline device notifications, **notifications.sendinitialofflinenotifications** and **notifications.sendinitialonlinenotifications**, both default to false
- fix: for HELPDESK-1956 Unable to login to Change Tracker (=> remove default sort from cache warmup query)
- fix: to record LastLoginAttempt for user even when not using the **auth.lockoutenabled** flag
- fix: for GetAgents API call name match using a startswith query when it should be equals
- fix: for efficient re-processing of Events when **DaysToKeepEventsFor** setting changed
- fix: prevent planned change rule reduction process from creating a rule that matches zero length match text (which matches anything)
- fix: for HELPDESK-2457 Application of templates with times merging with templates without times

### 7.0.1.57 - 08-Jun-2018

- enh: reduce minimum allowed planned change window size to 0 (was 10 minutes)
- enh: show planned change member groups count and explicitly added devices count in planned change summary grid UI
- fix: for HELPDESK-1814 re-run query now button not functioning correctly on scheduled query results
- fix: for HELPDESK-1724 Event filter does not work in new version
- fix: for HELPDESK-1703 re: large filecontent event changes
- fix: for HELPDESK-1528 Remove ending date information in Planned change

### 7.0.1.56 - 09-May-2018

- fix: HELPDESK-1709 re unable to create new Planned Change
- fix: to set ServicePointManager.SecurityProtocol for FAST calls where local Tls protocols disabled
- fix: for HELPDESK 1462 re: events grid not including final second of end date
- fix: for search for planned change status = NotRelevant did not return all events
- fix: HELPDESK-1235 re: Exclude some servers from planned change
- fix: for local accounts tracker filter on events page
- fix: HELPDESK-1257 re: using text can’t sort via an index so can exceed mongo memory limit. Add app setting **TextSearchMethod = regex**
- fix: HELPDESK-1359/1603 re: renaming groups
- fix: HELPDESK-1531 re: schedule query interval set to 0 minutes
- enh: add **EventBlockEnabled** to agent at API level to reject event submission from rogue agents
- enh: updated bundled MongoDB with Windows installed to 3.6.3
- enh: additional tracking template caching for large estates
- enh: Api enhancements for individual devices in planned changes
- enh: updated compliance reports with 30 Apr 2018 builds

### 7.0.1.55 - 15-Jan-2018

- fix: for high CPU use when re-queued Fast lookup attempted with no FAST API key set
- fix: V7-259 Report rule results differ depending on whether process.service rule is in a single rule report or multi-rule report
- fix: HELPDESK-644 re: scheduled exports of baseline events
- fix: HELPDESK-546 re: scheduled Reports - Parent/Child Group Issue
- fix: Alert events now also returned when searching by planned change id
- fix: agents sending very large report results via streamed file
- fix: raise an error to caller when FAST/whitelist test call fails (rather than just logging error)
- fix: V7-244 Tracked Attributes - **File Attributes (including contents) only** doesn’t display attributes that change
- enh: existing reports updated 12/1/18
- enh: report error when bad report template name requested for adhoc run
- enh: additional date based event mongo index for use when no other query filters set
- enh: HELPDESK-1048 Database Example connection strings are misleading - removed * from example db connection strings
- enh: set default **New Line** for new **Windows device** credentials in UI to CR rather than CRLF
- enh: planned change instance evaluation order is based on alpha sort of Description field. Use ~ prefix to place a planned change at the end of the list
- enh: HELPDESK-743 re: Notifications based on groups, alert emails are routed to users on the group the tracking template item originated from, requires gen7agent 7.0.0.30 for feature to be enabled
- enh: new config key **MinimumFileHashReputation** set to either AssuredGood (the default if no setting) or AssumedGood controls the level of Whitelist assurance that maps to a **planned** event in a planned change
- enh: added **CIS Windows Server 2016 Base Template.xml** template
- enh: added POST file name to Whitelist, returned reputation now logged
- enh: planned change members can be managed individually via api
- enh: added support for new FAST FileHashStatus return codes
- enh: HELPDESK-537 re: ability to schedule polled trackers, compliance reports and saved queries to run on a monthly basis
- enh: change process tracking option **Report start & stop events (alerts will be raised...)** to **Report white & greylisted notifications...**
- enh: new advanced setting **ScheduledQuerySendsEmptyAttachments** to always send empty attachments when part of scheduled query run (usually they are suppressed). Set to **Yes** to activate.
- enh: connect to MongoDB using SSL (beta)
- enh: updated SSL certificate added. Only applied on new install. Agents with built-in compatibility with new SSL thumbprint are: gen7agent 7.0.0.28, agent: 1.0.0.109, proxy: 1.0.0.106, express: 2.0.0.8
- enh: added Task List export feature to compliance page
- enh: added **Run Now** button to compliance page to run a set of compliance reports for a group
- enh: when exporting baseline events exclude **tcpopen** value from network tracker NMap scans

### 7.0.1.54 - 19-Jul-2017

- fix: stop evaluating planned changes after a match is found
- fix: correctly propagate template changes to devices when new template xml is uploaded
- fix: add process rule to template for uncategorized process from events page UI
- fix: re-enable querying processes and services on a device from hub UI
- fix: error on agent poll when custom template group deleted
- enh: enable planned change rule combination