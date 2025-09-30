---
description: >-
  This article addresses the error message related to the HubDetails file and provides step-by-step instructions to resolve the issue.
keywords:
  - HubDetails.xml
  - Crypto error
  - Netwrix Agent
  - troubleshooting
  - error resolution
sidebar_label: Rolling-Log Fix
tags: []
title: Rolling-Log Fix: ERROR "HubDetails - Crypto error. Has the agent process account changed since the password data was entered?"
knowledge_article_id: kA04u0000000Jf1CAE
products:
  - change-tracker
---

# Rolling-Log Fix: ERROR "HubDetails - Crypto error. Has the agent process account changed since the password data was entered?"

## Symptoms

Error message example:

```
#                                                   Example Message:                                                      #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
2019-01-04 07:02:35,644 [4] ERROR HubDetails - Crypto error. Has the agent process account changed since the password data was entered?
System.Security.Cryptography.CryptographicException: Key not valid for use in specified state.

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                    Note: Typically followed by 3 other messages below...                                #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

2019-01-04 07:02:35,675 [4] ERROR ConfigurationLoader - Hub details cannot be read successfully from: C:\ProgramData\NNT\gen7agent.service\HubDetails.xml. Error: Key not valid for use in specified state.
2019-01-04 07:02:35,675 [4] INFO  Message - Application core shutting down due to error, please restart service: Hub details cannot be read successfully from: C:\ProgramData\NNT\gen7agent.service\HubDetails.xml. Error: Key not valid for use in specified state.
2019-01-04 07:02:35,691 [4] INFO  Message - Application starting shutdown due to: FatalError - Hub details cannot be read successfully from: C:\ProgramData\NNT\gen7agent.service\HubDetails.xml. Error: Key not valid for use in specified state.
```

## Cause

This error means that the information in the **HubDetails.xml** file is having issues being used with the Agent Service. The specific error above tells us that the password has already been encrypted elsewhere and cannot be used. See Screenshot Below:

![HubDetails Error Screenshot](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka0Qk000000Dlab&feoid=00N0g000004CA0p&refid=0EM4u000007ccr9)

The reason it cannot be read by the agent is that each agent must locally encrypt the password entered into the **HubDetails.xml** file. This error will occur when moving a **HubDetails.xml** file from one agent to another in an attempt to simplify the agent installation. Please see the instructions below on how to remedy this issue.

## Resolution

If you are receiving this error, the Netwrix Agent is NOT reporting to your hub. This is a critical error, and for monitoring to continue, it must be resolved. To resolve this error:

1. **Stop** the Netwrix Agent Service. Linux Command:
   ```plaintext
   service nntgen7agent stop
   ```

2. On Windows, navigate to the following folder **C:\ProgramData\NNT\gen7agent.service**  
   On Linux, navigate to the following folder **/var/nnt/gen7agent.service/**

3. **Delete all files located in this folder EXCEPT for the **HubDetails.xml** file.**

4. **Edit the **HubDetails.xml** file using a program such as Notepad (Windows) or Nano (Linux).**

5. Inside the **HubDetails.xml** file, remove the entire line containing data with the **<E1>** tags. See Screenshot Below:

   ![HubDetails XML Edit Screenshot](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka0Qk000000Dlab&feoid=00N0g000004CA0p&refid=0EM4u000007ccrA)

6. Once this has been removed, enter the password tags to contain the following:
   ```plaintext
   <Password>Enter-Password-Here</Password>
   ```

7. Be sure to enter your Agent password where it states **Enter-Password-Here** between the **<Password>** tags.

8. Confirm that the **HubDetails.xml** file contains the proper information in the correct format. See Screenshot below for an Example:

   ![HubDetails XML Example Screenshot](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka0Qk000000Dlab&feoid=00N0g000004CA0p&refid=0EM4u000007ccrB)

   [Read more about **HubDetails.xml** file.](https://helpcenter.netwrix.com/bundle/ChangeTracker_7.6/page/Content/ChangeTracker/Install/Agent/HubDetailsFile.htm)

9. Once this information has been entered properly, please start the Netwrix Agent Service. Linux Command:
   ```plaintext
   service nntgen7agent start
   ```

10. The following **Rolling-Log** Information will show that the Agent was able to read the information and connect the device, see below:

    ![Rolling-Log Information Screenshot](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka0Qk000000Dlab&feoid=00N0g000004CA0p&refid=0EM4u000007ccrC)

11. You may also confirm that the device is registered via the Change Tracker Web Console, see below:

    ![Change Tracker Web Console Screenshot](https://nwxcorp.file.force.com/servlet/rtaImage?eid=ka0Qk000000Dlab&feoid=00N0g000004CA0p&refid=0EM4u000007ccrD)

## Related Articles

- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JXHCA2.html)
- [How to Change the Admin Password of your Mongo Database](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JgJCAU.html)
- [Supporting Documents for Hub Server Problems](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JdtCAE.html)
- [How to fix the "Check Log for Details" message in the event details](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JVQCA2.html)
- [Change Tracker Gen 7 Change Log / Update Log / ReadMe.txt Documents for Agent/Hub](https://helpcenter.netwrix.com/bundle/z-kb-articles-salesforce/page/kA04u0000000JkGCAU.html)