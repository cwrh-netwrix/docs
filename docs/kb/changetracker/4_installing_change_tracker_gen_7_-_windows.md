---
description: >-
  This article provides detailed instructions for installing Change Tracker Gen 7 on Windows, including system requirements and installation steps.
keywords:
  - Change Tracker Gen 7
  - Windows installation
  - system requirements
sidebar_label: Installing Change Tracker Gen 7
tags: []
title: Installing Change Tracker Gen 7 on Windows
knowledge_article_id: kA04u0000000JQLCA2
products:
  - change-tracker
---

# Installing Change Tracker Gen 7 on Windows

## Overview

While Change Tracker has minimal requirements for successful operation, the following are the recommended minimum system requirements.

### System Requirements

| SYSTEM ELEMENT                     | RECOMMENDED                          |
|------------------------------------|--------------------------------------|
| CPU                                | Quad Core CPU or 4 vCores           |
| MEMORY                             | 8GB                                  |
| DISK FREE                          | 500GB*                               |
| OPERATING SYSTEM – 64BIT ONLY     | Windows Server 2012R2 Any Edition    |
| MICROSOFT .NET FRAMEWORK          | Version 4.5**                        |
| MICROSOFT IIS ENABLED             | V7 Upwards ***                       |
| DATABASE                           | Mongo V3.x (Pre-Packed with Installer)|

*500GB Minimum based on limited trial implementations only. For production, we size based on an average of 4GB per device, per annum, based on typical change event and report volumes (4 Compliance Reports per month, 200 change events per month).

**Download details:** [Microsoft .NET Framework 4.5](http://www.microsoft.com/en-us/download/details.aspx?id=30653) (missing components will be downloaded automatically, provided the server has internet access).

***See the following section for a full list of roles and features recommended. Note: When installing Change Tracker Gen 7 on 2008R2, some additional steps are required to update the .NET Framework version to 4.5, then enable IIS Features, ensuring that ASP.NET is an 'allowed' ISAPI extension.*

*Please run a Windows Update to ensure all above components are fully up to date.*

To download the software, go to [New Net Technologies Downloads](http://www.newnettechnologies.com/Member-Downloads/) and use the username and password provided to you in your 'Welcome to Netwrix' email, or contact us at info@nntws.com if you still need your account details.

## Windows Server Roles/Features

Please refer to this material to confirm the correct enablement of role services.

![Windows Server Roles/Features](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJxv&d=%2Fa%2F4u000000LzQP%2Fx90MG_32joVbnkMF_nFry4pbG2IPriywMbRmiEz2tdM&asPdf=false)

![Additional Roles/Features](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJxX&d=%2Fa%2F4u000000LzQU%2Fc_x3BEIY0iyaudjL36Gj8kjjRNcQmP.V3BNgDAeq1i4&asPdf=false)

Note: When installing Change Tracker Gen 7 on 2008R2, some additional steps are required to update the .NET Framework version to 4.5, then enable IIS Features, ensuring that ASP.NET is an 'allowed' ISAPI extension.

Once the previous prerequisite conditions have all been met, you can run the installer – make sure that the 'Run As Administrator' elevation is used. The installer will automatically install the main application program, the various database and associated dependencies, and a local Change Tracker Agent. The Agent is pre-configured to automatically connect to the localhost and register with the Change Tracker Gen 7 hub.