---
description: >-
  This article outlines the recommended minimum system requirements for installing Change Tracker Gen 7, including hardware and software specifications.
keywords:
  - Change Tracker
  - system requirements
  - installation
sidebar_label: Change Tracker Gen 7 Installation
tags: []
title: Windows Installation of Change Tracker Gen 7
knowledge_article_id: kA04u0000000JPmCAM
products:
  - change-tracker
---

# Windows Installation of Change Tracker Gen 7

## Recommended Minimum System Requirements

While Change Tracker has minimal requirements for successful operation, the following are the recommended minimum system requirements:

| SYSTEM ELEMENT                          | RECOMMENDED                          |
|-----------------------------------------|--------------------------------------|
| CPU                                     | Quad Core CPU or 4 vCores           |
| MEMORY                                  | 8GB                                  |
| DISK FREE                               | 500GB*                               |
| OPERATING SYSTEM – 64bit ONLY          | Windows Server 2012R2 Any Edition    |
| MICROSOFT .NET FRAMEWORK               | Version 4.5**                        |
| MICROSOFT IIS ENABLED                  | V7 Upwards ***                       |
| DATABASE                                 | Mongo V3.x (Pre-Packed with Installer) |

As part of the installation process for Change Tracker Enterprise, a series of checks will be made on your PC/Server to ensure all required facilities exist.

> **IMPORTANT:** 500GB Minimum based on limited trial implementations only. For production, we size based on an average of 4GB per device, per annum, based on typical change event and report volumes (4 Compliance Reports per month, 200 change events per month).

> **NOTE:** Download details: [Microsoft .NET Framework 4.5](http://www.microsoft.com/en-us/download/details.aspx?id=30653) (missing components will be downloaded automatically, provided the server has internet access).

> **IMPORTANT:** See the following section for a full list of roles and features recommended. Note: When installing Change Tracker Gen 7 on Windows Server 2008R2, some additional steps are required to update the .NET Framework version to 4.5, then enable IIS Features, ensuring that ASP.NET is an 'allowed' ISAPI extension.

> **NOTE:** Please run a Windows Update to ensure all above components are fully up to date.

To download the software, go to [Member Downloads](http://www.newnettechnologies.com/Member-Downloads/) and use the username and password provided to you in your 'Welcome to Netwrix' email, or contact us at [info@nntws.com](mailto:info@nntws.com) if you still need your account details.