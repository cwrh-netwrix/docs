---
title: "Synology"
description: "Synology"
sidebar_position: 60
---

# Synology

Netwrix Auditor relies on native logs for collecting audit data. Therefore, successful change and
access auditing requires a certain configuration of native audit settings in the audited environment
and on the Auditor console computer. Configuring your IT infrastructure may also include enabling
certain built-in Windows services, etc. Proper audit configuration is required to ensure audit data
integrity, otherwise your change reports may contain warnings, errors or incomplete audit data.

**CAUTION:** Folder associated with Netwrix Auditor must be excluded from antivirus scanning. See
the
[Antivirus Exclusions for Netwrix Auditor](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000HirCAE.html)
knowledge base article for additional information.

You can configure your IT Infrastructure for monitoring in one of the following ways:

- Automatically through a monitoring plan – This is a recommended method. If you select to
  automatically configure audit in the target environment, your current audit settings will be
  checked on each data collection and adjusted if necessary.
- Manually – Native audit settings must be adjusted manually to ensure collecting comprehensive and
  reliable audit data. You can enable Auditor to continually enforce the relevant audit policies or
  configure them manually:

    - The log sending must be configured as described in the
      [Configure Synology File Servers for Audit](/docs/auditor/10.8/configuration/fileservers/synology/configure.md) topic.

Review a full list of object types Netwrix Auditor can collect on Synology NAS network devices.

## Monitored Objects

| Action                  | File | Folder | Share |
| ----------------------- | ---- | ------ | ----- |
| Added                   | +    | +      | -     |
| Add (failed attempt)    | -    | -      | -     |
| Modified                | +    | -      | -     |
| Modify (failed attempt) | -    | -      | -     |
| Moved                   | +    | +      | -     |
| Move (failed attempt)   | -    | -      | -     |
| Read                    | +    | -      | -     |
| Read (failed attempt)   | -    | -      | -     |
| Renamed                 | +    | +      | -     |
| Rename (failed attempt) | -    | -      | -     |
| Remove (failed attempt) | -    | -      | -     |
| Copied                  | -    | -      | -     |

**NOTE:** For Synology system Auditor displays the actual time when the event occurred. The 'When'
column shows the time when the syslog message arrived.

If an object has been moved between file shares, the product reports the following actions:

- Read + Removed for the initial object

- Added + Modified for the object to a new location
