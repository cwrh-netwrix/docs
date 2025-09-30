---
description: >-
  This article provides a step-by-step guide on how to update agents from the Change Tracker Console, including necessary files and procedures.
keywords:
  - Change Tracker
  - agent update
  - Netwrix
sidebar_label: Update Agents from Change Tracker Console
tags: []
title: How to Update Agents From The Change Tracker Console
knowledge_article_id: kA04u0000000JcCCAU
products:
  - change-tracker
---

# How to Update Agents From The Change Tracker Console

## Before You Start

If a new Netwrix Change Tracker Agent update is provided, this can be pushed out automatically from the Change Tracker server. The Agent update comprises a new set of program files, plus an `upd` file which signs the update and confirms its integrity. You can download both files from our members area on the website, which can be found in the following path:

**Netwrix → Members → Member Downloads → Latest Versions of Software and Support Information for Existing Customers → 01. Netwrix Change Tracker Gen 7 → Hub and Agent Downloads**

The two files you will need to update an agent from the Change Tracker Console are below:

1. **Netwrix Change Tracker Gen 7 Windows Agent Only Installer**
2. **Netwrix Change Tracker Gen 7 Windows Agent Control File (for Auto Updates)**

> **IMPORTANT:** Once you have downloaded the two files above, DO NOT extract them! We will need to upload them as a zip to the Change Tracker Server Console.

## Step-by-Step Guide

Once both of those files above are downloaded, you are ready to start upgrading!

1. On the Change Tracker Server, head to the hub through a browser and navigate to the **Agent Updates** page, which can be found in the following path: **Settings → Agent Updates**. From here, you can upload the two files you have downloaded as a zip by pressing on the **Upload an update...** button, highlighting both of the files downloaded, and then clicking **Open**. Once that is done, press the **Upload files** button. The files will appear in the list.
   
2. Head into the **Groups** page, which can be found in the following path: **Settings > Groups**. Create a new group by pressing the **+ Add** button and name the group as you wish. For this example, I have named the group "Netwrix Agent Update".

3. Once you have created a new group, navigate into it and within there, head into the **Agent Software Updates** tab. Next, press the **+ Define the update schedule** button, choose the agent version, schedule the time the agent upgrade will take place, and then press **Update**.

4. The final step is to head into the **Agents & Devices** page, which can be found in the following path: **Settings > Agents & Devices**. Locate the device which has the agent on it that you would like to upgrade, press the **Edit** button once the device is located, add the new group you have created into the "Groups" field (in my case, it will be Netwrix Agent Update), and then press the **Update** button. You can see below that I searched for the device I wanted to push an agent update to and then added it to the group "Netwrix Agent Update," which can be seen in the groups column.

Once the steps above are completed, the agent software update should take place automatically.

## Related Articles

- [How to Backup / Restore / Move your MongoDB Database](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JWTCA2.html)
- [How to move your Linux Server MongoDB Database to a Windows server](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JemCAE.html)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JXHCA2.html)
- [Supporting Documents for Hub Server Problems](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JdtCAE.html)
- [Change Tracker Gen 7 Change Log / Update Log / ReadMe.txt Documents for Agent/Hub](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JkGCAU.html)