---
description: >-
  This article provides step-by-step instructions for generating alerts based on event contents in Log Tracker, specifically for monitoring failed login attempts.
keywords:
  - Log Tracker
  - custom alerting
  - event monitoring
sidebar_label: Custom Alerting in Log Tracker
tags: []
title: Log Tracker Custom Alerting: Generating Alerts Off Event Contents
knowledge_article_id: kA04u0000000JZSCA2
products:
  - activity-monitor
---

# Log Tracker Custom Alerting: Generating Alerts Off Event Contents

## Overview

This article provides instructions for setting up custom alerts in Log Tracker to monitor syslog messages, particularly for failed login attempts by administrator accounts. By following these steps, you can create an alert that generates a ticket when the same account name appears in multiple messages within a specified time frame.

> **IMPORTANT:** Log Tracker Version 5-8-1 is required in order for you to use this functionality.

## Instructions

1. Log into **Log Tracker**.
2. Select the **Alerts** tab.
3. Select the **Custom** tab.
4. Select the **Wizard >** button.
5. Set **Custom Alert Title** to: **[Your Alert Title]**.
6. Select the **Next >** button.
7. Set the **Custom Alert Type** to: **Parse Value Alert**.
8. Select the **Next >** button.
9. Set your **Correlation Thread** to: **“an account failed to log on” events**.
10. Set the **Parse Expression** to: **Account Name: \***.
11. Select the **Next >** button.
12. Set the **Compare Function** to: **(GE) Greater Than Or Equal**.
13. Set the **Threshold** to: **5**.
14. Set the **Execute Interval** to: **30**.
15. Select the **Next >** button.
16. Set the **Alert Facility** to: **[Your Alert Facility]**.
17. Set the **Alert Severity** to: **[Your Alert Severity]**.
18. Set **Assign Ticket To User** to: **[User Name]**.
19. Set **Send Clear Severity** to: **[Your Clear Severity]**.
20. Select the **Next >** button.
21. Set the **Alert Message/Ticket Text** to: **[Your Alert Message]**.
22. Select the **Finish!** button.

![Log Tracker Alert Setup](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKSK&d=%2Fa%2F4u000000LzYX%2FV4ULu1z0Nlv524oxdevh88xKqD6ov0UgDyJHvQApMZ8&asPdf=false)

![Log Tracker Alert Configuration](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKDh&d=%2Fa%2F4u000000Lzx9%2FbbctO_j1ONCzHowWaYLFY4aYHemK.Ul2BCPqQCQjorI&asPdf=false)

![Log Tracker Alert Summary](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKSP&d=%2Fa%2F4u000000LzuC%2FSRrJzpoQkKgM4CPbRvr_pfXW0zaL3hWWK7JFKwPTDTE&asPdf=false)