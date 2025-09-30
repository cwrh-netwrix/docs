---
description: >-
  This article provides step-by-step instructions on integrating a ServiceNow instance with the Change Tracker environment, including testing the integration.
keywords:
  - ServiceNow
  - Change Tracker
  - integration
sidebar_label: Integrate ServiceNow with Change Tracker
tags: []
title: How to Integrate ServiceNow into Change Tracker Environment
knowledge_article_id: kA04u0000000JecCAE
products:
  - activity-monitor
---

# How to Integrate ServiceNow into Change Tracker Environment

## Overview

This article outlines the steps to integrate your ServiceNow instance with the Change Tracker environment and provides guidance on testing the integration.

## Instructions

1. Once the **ServiceNow / Change Tracker Integration** has been purchased, please contact [Netwrix Technical Support](https://www.netwrix.com/sign_in.html?rf=tickets.html#/open-a-ticket) to receive the latest version of the Integration Install Module.

2. Make sure you are updated to the latest version of **Netwrix Change Tracker**. To download the latest version, go [here](https://www.netwrix.com/sign_in.html?rf=my_products.html).

3. Proceed to install the **ServiceNow Integration**.

4. Follow the screenshots below:

   ![Installation Screenshot](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka04u000000QmfV&feoid=00N0g000004CA0p&refid=0EM4u000007cgRa)

5. Select the **Service Now** checkbox and unselect other options:

   ![Service Now Checkbox](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka04u000000QmfV&feoid=00N0g000004CA0p&refid=0EM4u000007cgRb)

6. In **Change Tracker**, create a **Change Approver User** and enter the new Change Tracker user's **Credentials** into the **Service Now Installer**:

   ![Change Approver User](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka04u000000QmfV&feoid=00N0g000004CA0p&refid=0EM4u000007cgRc)

7. If you have entered the information correctly, you will see the following popup message: "Successfully connected using these details." Click **OK**.

8. Enter the URL for your ServiceNow instance below. Please follow the same format as the screenshot below. Once that is complete, also enter your **Service Now Username** and **Password** (from ServiceNow, not Change Tracker):

   ![Service Now URL Entry](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka04u000000QmfV&feoid=00N0g000004CA0p&refid=0EM4u000007cgRd)

9. For adding devices to your ServiceNow **CMDBs**, first go to **Configuration** and select your **CMDB Group**. Then click **New** and create a new device:

   ![New Device Creation](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka04u000000QmfV&feoid=00N0g000004CA0p&refid=0EM4u000007cgRe)

10. Input the **Exact** name of the **Server** and proper **Configuration** information. Click **Submit**:

    ![Submit Device Information](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka04u000000QmfV&feoid=00N0g000004CA0p&refid=0EM4u000007cgRf)

    Once the device has been created, you will see the device in the group.

11. Change the **Service Now Configuration File**: proceed to `C:\Program Files\NNT Change Tracker Suite\Gen7SyncService` and select the **Gen7SyncService.exe.Config** file:

    ![Service Now Configuration File](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka04u000000QmfV&feoid=00N0g000004CA0p&refid=0EM4u000007cgRg)

12. Once opened, navigate to the following line: `<add key="service.Now.groupClassNames" value="" />`. Enter Group Class information based on your ServiceNow instance. This will include your **CMDB** and **CI** groups from ServiceNow. In the example below, you may find default **Windows** and **Linux** values:

    ![Group Class Information](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka04u000000QmfV&feoid=00N0g000004CA0p&refid=0EM4u000007cgRh)

13. Go to ServiceNow and create a **New Change Request**:

    ![New Change Request](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka04u000000QmfV&feoid=00N0g000004CA0p&refid=0EM4u000007cgRi)

14. Proceed to create the **Planned Change** by entering the proper information. **Configuration Item** can either be the Group or Device, Assignment Group, Short Description. This will be set as the Planned Change name in Change Tracker:

    ![Planned Change Creation](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka04u000000QmfV&feoid=00N0g000004CA0p&refid=0EM4u000007cgRj)

15. Check if the Planned Change has been created in Change Tracker. First, head over to the **Planned Changes** tab and click **Show Out-Of-Schedule Changes**. Then, you should see your **Implemented Planned Change** from ServiceNow with the proper **Description**, **Device**, and **Planned Change Start/End Time**:

    ![Implemented Planned Change](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka04u000000QmfV&feoid=00N0g000004CA0p&refid=0EM4u000007cgRk)

## Related Articles

- [How to move your Linux Server MongoDB Database to a Windows server?](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JemCAE.html)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JXHCA2.html)
- [How to Change Admin Password for Mongo Database](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JgJCAU.html)
- [Supporting Documents for Hub Server Problems](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JdtCAE.html)