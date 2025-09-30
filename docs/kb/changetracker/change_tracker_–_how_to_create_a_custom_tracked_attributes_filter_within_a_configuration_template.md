---
description: >-
  This article provides a step-by-step guide on creating a custom tracked attributes filter within a configuration template in Change Tracker.
keywords:
  - Change Tracker
  - custom filter
  - tracked attributes
  - configuration template
  - file security changes
sidebar_label: Create Custom Tracked Attributes Filter
tags: []
title: Change Tracker – How to Create a Custom Tracked Attributes Filter Within a Configuration Template
knowledge_article_id: kA04u0000000JcSCAU
products:
  - activity-monitor
---

# Change Tracker – How to Create a Custom Tracked Attributes Filter Within a Configuration Template

## Overview

This article will guide you in creating a customized tracked attributes filter within a configuration template. This is useful for when you cannot find the correct tracked attributes filter for your requirements.

For example, you may want to create a custom filter to only track security setting modifications and nothing else, and you may find that there is no default filter for this within the list. For cases like this, you can create a custom filter to track specific attributes you are interested in only.

## Instructions

1. On the Change Tracker Server, please head into this directory:
   - **Windows:** `C:\inetpub\wwwroot\Change Tracker Generation 7 Hub\bin\Filters`
   - **Linux:** `/opt/nnt/hubservice/bin/Filters`
   
2. Edit the file called **default.xml**.

3. **default.xml** contains all of the standard file and registry filters as seen on the configuration templates. Please copy the filter that is close to what you want to achieve. For this example, I will be creating a custom filter for file security changes only, so I will need to copy the following section to use as a template:

   ![Screenshot of default.xml filter section](image_url)

4. Once you have copied the section of interest, please head into the **CustomFilters.xml** file which is located within the same directory as the **default.xml** file.

5. In the **CustomFilters.xml** file, paste in the section you have copied in between the tags and modify the parameters by setting them to true or false. I have included a screenshot below on how I have configured my filter (Note: The description parameter is what will be displayed as the filter name on the configuration template. Also, ensure that the **name** parameter is unique; I have named the parameter **allchanges2** for this example):

   ![Screenshot of CustomFilters.xml configuration](image_url)

6. Once you have changed the parameters to your liking, save the file.

7. Head into your Change Tracker Console. You should be logged out after saving that file; please log back in.

8. Once you are logged back in, head into your configuration template. If you have successfully followed the steps above, you will find your custom filter on the list. Below is a screenshot to show this:

   ![Screenshot of custom filter in configuration template](image_url)

## Related Articles

- [Support Process - Enabling Change Tracker's FAST Cloud Netwrix Support Internal](link)
- [How to Configure The FAST Cloud Integration With Proxy Internet Settings](link)
- [The Netwrix FAST™ Cloud Usage Considerations](link)
- [MongoDB - Pre-allocated Log Files Accumulate & Result to Disk Space Errors](link)
- [Change Tracker – How to Create a Custom Tracked Attributes Filter Within a Configuration Template](link)

**Attachments:**
- [Capture4.PNG](link)
- [Capture3.PNG](link)
- [Capture2.PNG](link)
- [Capture.PNG](link)