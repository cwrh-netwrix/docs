---
description: >-
  This article provides step-by-step instructions for setting up SIEM integration with Netwrix Change Tracker.
keywords:
  - SIEM integration
  - Netwrix Change Tracker
  - syslog server
sidebar_label: Setup SIEM Integration
tags: []
title: How to Setup SIEM Integration with Netwrix Change Tracker
knowledge_article_id: kA04u000000wnp9CAA
products:
  - change-tracker
---

# How to Setup SIEM Integration with Netwrix Change Tracker

## Overview

This article provides step-by-step instructions for setting up SIEM integration with Netwrix Change Tracker.

## Instructions

To set up SIEM integration with Netwrix Change Tracker, do the following:

1. In the Change Tracker console, navigate to **Settings** → **System Settings**.
2. Configure the **Syslog Server** settings according to the SIEM's server information and allowed protocols.
   - Set the Syslog version to a specific one that your SIEM supports or to CEF.
   - Specify a UDP port for common default settings.
3. Click the **Test** button to ensure you receive the Change Tracker test message.

Once the syslog server has been configured, you may configure alerts to be sent to your SIEM solution.

1. In the Change Tracker console, navigate to **Settings** → **User Notifications**.

Here you may configure the specific items to be sent to your SIEM solution, such as Device Offline, Unplanned Changes, etc.