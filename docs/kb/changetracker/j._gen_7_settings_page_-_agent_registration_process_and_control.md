---
description: >-
  This article outlines the process for registering and controlling a Netwrix Agent within the Gen 7 system, detailing the necessary configuration and registration steps.
keywords:
  - Netwrix Agent
  - Gen 7
  - registration process
sidebar_label: Agent Registration Process
tags: []
title: Agent Discovery and Registration Process in Gen 7
knowledge_article_id: kA04u0000000JRTCA2
products:
  - change-tracker
---

# Agent Discovery and Registration Process

## Overview

A Netwrix Agent is a highly automated and intelligent piece of software with extensive capabilities for monitoring and reporting on your secure endpoints. It is therefore critical that the agent is securely governed by the controlling Gen 7 system, and there are a range of operations involved when registering and driving the agent.

## Instructions

### 1. First Run – HubDetails.xml File

The Agent configuration settings are controlled by the Hub during operations, but the initial registration necessitates a basic config file for registration with the Hub. The `HubDetails.xml` file includes some details unique to your deployment of Change Tracker Gen 7, hence it requires your intervention to ensure settings are as needed. The key tags within the file are as follows:

![HubDetails.xml Configuration](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJzi&d=%2Fa%2F4u000000LzVQ%2F1PKnf_fFu1CRZ0V.AxL05UTfG3gqsOf55LvTJNgCYug&asPdf=false)

*The Thumbprint uniquely identifies the Web Server certificate; see more [here](https://msdn.microsoft.com/en-us/library/ms734695(v=vs.110).aspx).*

**Note:** Netwrix's Gen 7 Agent also supports additional nodes – `NamePrefix`, `NameSuffix`.  
**Note:** The Gen 7 Agent does not need the `UseNewHub` node to be defined – this will default to true.

To find the Thumbprint:

- Open **IIS**.
- Select the server from the list on the left-hand side.
- Select **Server Certificates**.
- Double-click your certificate in the list to open the certificate's permissions.
- Open the **Details** tab.
- Scroll to the bottom of the list and highlight the **Thumbprint** field.
- The thumbprint value will then be displayed – transpose this to your `HubDetails.xml` file.

### 2. Registration

Provided the Agent can connect to the Hub `/api` page (referenced in the `HubDetails.xml`), the registration process takes place. The Agent presents its Username and Password (referenced in the `HubDetails.xml`) and is authenticated against credentials held at the Hub (or Active Directory server if used).

The Agent will then download and run the assigned **Registration Report**, which determines the Gen 7 Device Group that the Device will be assigned to. The Registration Report is similar to a full Compliance Report in that it can provision trackers to gather config data from the device and process the returned data using rule expressions, with the results governing Group assignment.

In this example, the group regex match (`WEBSERVER|EPOS|APPSERVER`) extracts only those substrings if present. You can view and edit the **Default Registration Report** from the **System** page. 

In conjunction with the Registration Report, the optional Registration Script parameters can be used, providing a GUI option for post-processing Registration Report results in order to control group allocation. In the example below, it is assumed the report has a variable called `regvalue_variable`, i.e., reading a value from the registry, and the custom code reads this value and appends it to the text "Custom". So if the registry value contained "WebServer", the device would be placed in the "CustomWebServer" group if it exists, falling back on "New Devices" if it doesn't.

![Registration Report Example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJyM&d=%2Fa%2F4u000000LzX1%2FxZbswZLNS2ad332aBBUowLmqzcJQkoNxoZZeB0xOjgU&asPdf=false)