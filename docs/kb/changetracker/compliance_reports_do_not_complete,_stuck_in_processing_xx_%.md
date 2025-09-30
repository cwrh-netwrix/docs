---
description: >-
  This article addresses issues where compliance reports in Change Tracker remain stuck in processing and do not complete, providing steps to resolve the issue.
keywords:
  - compliance reports
  - Change Tracker
  - UrlScan
sidebar_label: Compliance Reports Processing Issue
tags: []
title: Compliance Reports Do Not Complete, Stuck in Processing xx %
knowledge_article_id: kA04u0000000JYPCA2
products:
  - change-tracker
---

# Compliance Reports Do Not Complete, Stuck in Processing xx %

## Overview

NNT has seen instances over the years of Change Tracker servers unable to run compliance reports against registered devices. When this occurs, the **Status** value for the report will display **Processing** with an arbitrary completion percentage that never reaches 100%.

![Compliance Reports Processing Issue](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKPL&d=%2Fa%2F4u000000Lzfp%2Fg1Y8rf9_gDebBNIHOCyC5QoOGX35XPrMdkyiGutcWIc&asPdf=false)

Rather than this being a problem on the target device against which the report is being run, testing has shown that IIS-specific security tools can block Change Tracker's collection of the report information, causing the report to never complete.

By far, the most common security tool NNT encounters that causes this problem is **UrlScan**. UrlScan helps to prevent potentially harmful requests from reaching applications on the server by screening all incoming requests and filtering them based on rules set by the administrator. Filtering requests helps secure the server by ensuring that only valid requests are processed. One such filtering option is to prevent `Transfer-Encoding`. Such a prevention filter in UrlScan impacts Change Tracker as `Transfer-Encoding` is used to gather the report data together from a remote system.

## Step-by-Step Guide

To prevent UrlScan from blocking `Transfer-Encoding`, follow these steps:

1. Move to the UrlScan install location at `C:\Windows\system32\inetsrv\urlscan`.
2. Locate the `.ini` file that controls all filtering options and open it in a text editor.
3. Search through the file for the entry `Transfer-Encoding`.
4. Comment out `Transfer-Encoding` by placing a `;` at the start of the line. The finished line should look like this: `;Transfer-Encoding:`.
5. Save and close the `.ini` file.
6. Restart IIS.