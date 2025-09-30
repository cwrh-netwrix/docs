---
description: >-
  This article provides step-by-step instructions to determine the version of .NET Framework installed on your system.
keywords:
  - .NET Framework
  - Windows Registry
  - PowerShell
sidebar_label: Determine .NET Framework Version
tags: []
title: How to Determine Your .NET Framework Version
knowledge_article_id: kA04u0000000JP9CAM
products:
  - change-tracker
---

# How to Determine Your .NET Framework Version

## Overview

This article provides instructions to help you determine which version of .NET Framework is installed on your system. Netwrix Change Tracker Gen 7 Hub and Agent require a specific version of .NET Framework.

## Instructions

### Option 1: Check in the Windows Registry

1. Press **Windows Key+R** to open the Run command box.
2. Type `regedit` and click **OK**.
3. Navigate to the following registry key: 
   ```
   HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full
   ```
4. Locate the **Release** DWORD value. Refer to the screenshot below for guidance:

   ![Registry Editor showing the .NET Framework Release DWORD](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka0Qk000000DOPV&feoid=00N0g000004CA0p&refid=0EM4u000007cf5s)

### Option 2: Use Windows PowerShell ISE

1. Open **Windows PowerShell ISE**.
2. Enter the following command:
   ```powershell
   (Get-ItemProperty "HKLM:Software\Microsoft\NET Framework Setup\NDP\v4\Full").Release
   ```
3. The output will display the **Release** number of the installed .NET Framework version. Refer to the screenshot below for an example:

   ![PowerShell output showing the .NET Framework Release number](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka0Qk000000DOPV&feoid=00N0g000004CA0p&refid=0EM4u000007cf5t)

4. To determine the corresponding .NET Framework version, refer to the official Microsoft documentation: [.NET Framework Versions and Dependencies: Version Information ⸱ Microsoft 🡥](https://learn.microsoft.com/en-us/dotnet/framework/migration-guide/versions-and-dependencies#version-information)

## Related Articles

- [How to Backup / Restore / Move Your MongoDB Database](https://kb.netwrix.com/8150)
- [Monitoring Oracle Databases Using Change Tracker](https://kb.netwrix.com/8282)
- [How to Configure the FAST Cloud Integration with Proxy Internet Settings](https://kb.netwrix.com/8295)
- [How to Move Your Linux Server MongoDB Database to a Windows Server](https://kb.netwrix.com/8283)
- [How to Add a Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen 7](https://kb.netwrix.com/8164)