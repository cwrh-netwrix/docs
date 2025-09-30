---
description: >-
  This article provides a comprehensive overview of the pre-built Match Filters available in NNT Change Tracker Enterprise, detailing how to define inclusion and exclusion rules for file and folder monitoring.
keywords:
  - Match Filters
  - NNT Change Tracker
  - file monitoring
  - exclusion rules
  - folder monitoring
sidebar_label: Match Filters Overview
tags: []
title: 30 File/Folder Match Filters for Inclusion/Exclusion Rules
knowledge_article_id: kA04u0000000JTFCA2
products:
  - activity-monitor
---

# 30 File/Folder Match Filters for Inclusion/Exclusion Rules

## Overview

There are a range of pre-built Match Filters provided with **NNT Change Tracker Enterprise** that enable precision monitoring of only the attributes required, including pre-built exclusion filters for popular AV packages that update often and create lots of ‘change noise’. Often, due to paths containing a mixture of files that are to be monitored alongside files for which changes can be ignored, it is desirable to define multidimensional rules for includes and excludes.

For example, if you wish to monitor all files within a specified path and all sub-paths, you can use the built-in **All files (recursive)** match filter.

However, it may be desirable to reduce ‘noise’ from the root path by applying an exclusion for any changes relating to temporary files, such as `swp`, `swx`, or `~` file variants. There is actually a built-in Pathmatch Definition for this provided: **Linux temp files in folder**.

By way of example, the example Custom Pathmatch Definition below provides this policy:

![Custom Pathmatch Definition Example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK4U&d=%2Fa%2F4u000000Lzdi%2FdAMv9fo4LnotxfR6q54B85LMo8CqAk1Wb.IaixO4l80&asPdf=false)

## Instructions

1. **FolderMatchType** - Options here are **(All|Exact|Wildcards|Regex)**
2. **FolderMatchExpression** - Options are:
   - If using **All**, then use `""`
   - If using **Exact**, then specify an exact **"foldername"**
   - If using **Wildcards**, then specify a separated wildcards list, e.g., **"backup*|old*"**
   - If using **Regex**, then specify a regular expression, e.g., **"^backup"**
3. **FileMatchType** – Options are the same as for the **FolderMatchType** **(All|Exact|Wildcards|Regex)**
4. **FileMatchExpression** – Options are:
   - If using **All**, then use `""`
   - If using **Exact**, then specify an exact **"filename"**
   - If using **Wildcards**, then specify a separated wildcards list, e.g., **"*.exe|*.dll"**
   - If using **Regex**, then specify a regular expression, e.g., **"^audit[0-9]*\.(log|txt)$"**
5. **SubfolderRecursion**
   - Unlimited
   - None (operate on specified folder only)

**“n”** = recurse through **1, 2, or 3** subfolders