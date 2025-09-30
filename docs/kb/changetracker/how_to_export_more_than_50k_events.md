---
description: >-
  This article provides step-by-step instructions for exporting events to a file when you have more than 50,000 events listed and the export button is greyed out.
keywords:
  - export events
  - CSV export
  - Netwrix
sidebar_label: Exporting Events
tags: []
title: How to Export More than 50k Events
knowledge_article_id: kA04u0000000JazCAE
products:
  - change-tracker
---

# How to Export More than 50k Events

## Step-by-step Guide

This article is for when you need to export events to a file, but you have more than 50,000 events listed and the export button is greyed out.

1. First, go to **Settings**.
2. Scroll down and click **Export and Import**.
3. For Export Type, select **Events Only**.
4. For Export Format, select **Text (CSV)**.
5. Select Start and End Dates to export.
6. Then click **Perform Export**.
7. See the screenshot below for an example:
   ![Export Events Screenshot](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKUG&d=%2Fa%2F4u000000LzuH%2FpFkR9vRsetE3QgHYs3bVESe0AtEg32v7bjM3MKCtzKw&asPdf=false)
8. Scroll down and download the export, then unzip the CSV file.

> **NOTE:** In some cases, you may need to do the following:
>
> Open a PowerShell prompt with admin privileges and change the directory to the folder where the CSV is located. 
>
> Run the following command:
>
> ```powershell
> Get-Content .\events.csv | Select-String 'DeviceEvent' | Set-Content DeviceEventsOnly.csv
> ```

## Related Articles

- [How to move your Linux Server MongoDB Database to a Windows server?](https://kb.netwrix.com/8283)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://kb.netwrix.com/8164)
- [Vulnerability Tracker - How to Change a Task's Status through the GSM Database](https://kb.netwrix.com/8311)
- [How to Change the Admin Password of your Mongo Database](https://kb.netwrix.com/8310)
- [How to fix the "Check Log for Details" message in the event details](https://kb.netwrix.com/8133)

**Attachments:**
- [Screenshot.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKUL&d=%2Fa%2F4u000000LzYA%2FbiFGnnO6oE9ayEet.kUq8ReMR60XvlzZhkzCLgPGELM&asPdf=false)
- [r.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKFO&d=%2Fa%2F4u000000LzzZ%2FfrflpEe6wB20AYFiZ8ek2KhG6tVCMeJLl18_VfBy.5s&asPdf=false)