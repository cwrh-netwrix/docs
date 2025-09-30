---
description: >-
  This article outlines the Registry Key/Value Match Rules used to track specific registry keys and values, including how to exclude certain values from tracking.
keywords:
  - registry match rules
  - key value tracking
  - DCacheUpdate exclusion
sidebar_label: Registry Match Rules
tags: []
title: Registry Inclusion/Exclusion Match Rules
knowledge_article_id: kA04u0000000JTKCA2
products:
  - activity-monitor
---

# Registry Inclusion/Exclusion Match Rules

## Overview

Similar to Folder/File Match Rules, Registry Key/Value Match Rules can be defined and used to precisely track only keys and values of interest.

For example, tracking the **WinLogon** registry key and values is important because there are a number of session management security controls defined in this key. However, in certain environments, the **DCacheUpdate** values may change, causing spurious alerts that are not significant from a security perspective (DCacheUpdate stores domain names in binary form for internal Winlogon programming code to use). Therefore, the ability to easily track all keys and values below the **Winlogon** key, but exclude **DCacheUpdate** changes may be desirable.

The **All Registry Values** Match Rule is available by default, but to define the **Isolate DCacheUpdate Value Changes** exclusion, the following Custom PathMatch Definition would be added:

![Custom PathMatch Definition](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&amp;ids=0684u00000LdKAf&amp;d=%2Fa%2F4u000000Lzds%2FEx4U3Q5Bc.aEx0n9jC9GcEsL6WLw5IESN90SGBPBlhU&amp;asPdf=false)

## Instructions

1. **KeyMatchType** - Options here are **(All|Exact|Wildcards|Regex)**
2. **KeyMatchExpression** - Options are:
   - If using **All**, then use `""`
   - If using **Exact**, then specify an exact **keyname**
   - If using **Wildcards**, then specify a separated wildcards list, e.g., `key_abc*|key_def*`
   - If using **Regex**, then specify a regular expression, e.g., `^S-1-5-21-[0-9]+-[0-9]+-[0-9]+-[0-9]{4,}\\Software\\Policies\\Microsoft\\Windows\\Control Panel\\Desktop`
3. **ValueMatchType** – options are the same as for the **foldermatchtype** **(All|Exact|Wildcards|Regex)**
4. **ValueMatchExpression** – Options are:
   - If using **All**, then use `""`
   - If using **Exact**, then specify an exact **filename**
   - If using **Wildcards**, then specify a separated wildcards list, e.g., `*.exe|*.dll`
   - If using **Regex**, then specify a regular expression, e.g., `^audit[0-9]*\.(log|txt)$`
5. **SkipRootKey** – options are **true** or **false**
6. **Subkey Recursion**
   - Unlimited
   - None (operate on specified folder only)

**“n”** = recurse through **1, 2 or 3** subfolders.