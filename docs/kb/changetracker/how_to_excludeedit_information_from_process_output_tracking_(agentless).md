---
description: >-
  This article provides a step-by-step guide on how to exclude or edit specific information from process output tracking in an agentless environment.
keywords:
  - process output tracking
  - exclude information
  - edit tracking
sidebar_label: Exclude/Edit Information from Process Output Tracking
tags: []
title: How to Exclude/Edit Information from Process Output Tracking (Agentless)
knowledge_article_id: kA04u0000000JdjCAE
products:
  - change-tracker
---

# How to Exclude/Edit Information from Process Output Tracking (Agentless)

## Overview

This article is useful when you are receiving several change events in process output that you want to exclude. Examples of unwanted information that will always change include **"uptime"** and **"Time Source"** information.

## Step-by-step Guide

Please follow the steps below to exclude/edit information from process output tracking:

1. First, go to **Settings**.
2. On the sidebar, click **Credentials**.
3. Select the credentials that fall under this device and click **Edit**.
   ![Screenshot of selecting credentials](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJs6&d=%2Fa%2F4u000000M045%2F3wBEW_Mg6SUokIekdjznXmiWqnb5Jz9b2p.RzkM4W84&asPdf=false)
4. Next, we will need to edit the login script to exclude this line from appearing.

   Please enter the text below above everything in the login script:

   ```plaintext
   ExcludeMatchesWithComment, **Variable One**, **Variable Two**
   ```

5. **Variable One:** Edit this text and enter what you would like the edited message to be.
6. **Variable Two:** Edit this text and enter the first few words in the line you wish to exclude/edit.
   ![Screenshot of variable editing](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKQz&d=%2Fa%2F4u000000M04A%2FQ0Kf.FXu.mf0qNHnPY_QSoMl4OQaIEUrCTpaeLwjltg&asPdf=false)
7. After adding this line, click **Update** and start the process output tracker from the devices screen.
   ![Screenshot of starting process output tracker](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJnh&d=%2Fa%2F4u000000M01v%2FtPjE_s1msHx86uL7avjmUZ9aXSLljctP8DuTq8fq8xY&asPdf=false)

   **Please see an example of correctly configured exclusion:**
   Edited Login Script
   ![Screenshot of edited login script](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK3V&d=%2Fa%2F4u000000M01H%2Fqm2ANU75G23cBsi0U537ZJn0mka0eTIJ5QTW.q4RNJU&asPdf=false)

   Post Edit and Baseline:
   ![Screenshot of post edit baseline](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKYc&d=%2Fa%2F4u000000M04F%2FhsD8C8XJ27GYXvU9MSYGIn0UpNQSdL3tnonrgQKn99M&asPdf=false)

> **NOTE:** THIS WILL NOT EDIT THE INFORMATION ON THE MACHINE ITSELF, ONLY WHAT IS BEING SENT TO CHANGE TRACKER.

> **NOTE:** Multiple exclusions can be added to the login script. See screenshot below for example:
![Screenshot of multiple exclusions](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK2j&d=%2Fa%2F4u000000M04K%2FeriarcrkUTy8QoRpV6RgsIVVGiAcdbhfbS9cd7JpPd4&asPdf=false)

## Related Articles

- [Monitoring Oracle Databases using Change Tracker](https://kb.netwrix.com/8282)
- [How to move your Linux Server MongoDB Database to a Windows server?](https://kb.netwrix.com/8283)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://kb.netwrix.com/8164)
- [How to Change the Admin Password of your Mongo Database](https://kb.netwrix.com/8310)

**Attachments:**
- [Event1.jpg](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK92&d=%2Fa%2F4u000000M04e%2FnzK0brZIwDuJ09l3Cq8FMDygWxUkOSDYmh8kjpTLg_I&asPdf=false)
- [5.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKOU&d=%2Fa%2F4u000000M04j%2FSADAH1GJTv_DUgjS1goMKSLZf1RSH9i2WOpQBhntsy8&asPdf=false)
- [6.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKYm&d=%2Fa%2F4u000000Lzrl%2FYLFEw5qbtmwArhlQDSneDWrI.zbfQKndX2hT22vCAuw&asPdf=false)
- [4.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKRJ&d=%2Fa%2F4u000000M04o%2FiVJpxO3YrPTa9X0MTE8mZhrlOcWCqLjR.nIXSu1NnDs&asPdf=false)
- [3.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKYd&d=%2Fa%2F4u000000LzXy%2Fezvm_bOHsNkdOJ6YijGyYRj5WpVz8aiJOcNizjaF12Y&asPdf=false)
- [2.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJql&d=%2Fa%2F4u000000LzpH%2FTvAmqcACsmiyTcTBZLrlZPdCqdvY8OXWAA345DjrNW4&asPdf=false)
- [1.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKWI&d=%2Fa%2F4u000000M04t%2FpADpXSgEiZu2rVywwSO6WJgQNBZaVCiiVqAz8hK.W9s&asPdf=false)