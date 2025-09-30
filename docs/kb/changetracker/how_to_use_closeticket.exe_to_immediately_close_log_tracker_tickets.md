---
description: >-
  This article provides step-by-step instructions on using CloseTicket.exe to immediately close Log Tracker tickets based on specific keywords or phrases.
keywords:
  - CloseTicket.exe
  - Log Tracker
  - ticket management
sidebar_label: CloseTicket.exe Usage
tags: []
title: How to Use CloseTicket.exe to Immediately Close Log Tracker Tickets
knowledge_article_id: kA04u0000000JQRCA2
products:
  - change-tracker
---

# How to Use CloseTicket.exe to Immediately Close Log Tracker Tickets

## Overview

It may be the case that some tickets, when opened, can be immediately closed on the system. This may be useful, for example, if the ticket runs some e-mail (or other action) and can then be immediately dismissed.

The standard Log Tracker Server includes the **system\CloseTicket.exe** program as a regular command line utility, which can be used in a **Correlation > Action** script so that when a ticket is opened that contains specific text, the ticket can immediately be closed.

The **CloseTicket.exe** program can be executed at a command prompt (with no arguments) to see the syntax as follows:

```
Usage: CloseTicket -uid "(ticketuid)" [ "(resolution)" ]
Also: CloseTicket -user "(assignee)" [ "(resolution)" ]
Also: CloseTicket -match "(matchpatt)" [ "(resolution)" ]
```

As shown above, the **CloseTicket.exe** program can close tickets by a specific ticket UID, for all tickets for a specified user, or for all tickets that match a specified pattern or keyword.

For the purposes of the procedure below, the **-match** option will be used and will be configured to close a ticket based on a keyword within the ticket text defined by the user on the **Alarms** screen.

## Instructions

To configure this at the Log Tracker Server, perform the following steps:

1. Gain access to the Log Tracker Server **actions** folder and create a simple batch file called **CLOSE_TICKET.bat**. This batch file can consist of a single line as follows:

   ```
   ..\system\CloseTicket.exe %1 %2 %3
   ```

2. Next, identify some text, keyword, or phrase associated with the ticket you want to close. Note that the text is defined by the user on the **Alerts** screen, and there should be some keyword or phrase associated with tickets (or tickets) you want to close.

3. When you are ready to configure the action, go to the **Correlation > Actions** tab and click the **Wizard** button to add a new action.

4. On the first screen of the wizard, select **User Defined** as the **Action Type** (from the drop-down selection) and click the **Next** button.

5. On the second screen of the wizard, enter the text you identified in step 2 above. Then click the **Next** button.

6. On the third screen of the wizard, use all defaults EXCEPT specify the **Match IP Address / Group** to be **127.0.0.1**. (Note: This is not absolutely required, but is good for safety and efficiency, since a syslog message is always sent to **127.0.0.1** when a ticket is opened.) When finished, click the **Next** button.

7. On the fourth screen of the wizard, enter **CLOSE_TICKET.bat** as the **Action Program Name**. (Note: This is the batch file configured in step 1 above.) For the **Action Arguments**, enter three arguments as follows:

   ```
   -match "(keyword)" "Ticket auto-closed"
   ```

   Note that the first argument is **-match**; the second (keyword) argument is the keyword selected in step 2, and used in step 5; the third argument is the optional ticket resolution that will appear when the ticket is closed, which in the above case is **Ticket auto-closed**, but can be something more specific at your site. When finished, click the **Finish** button to save the action program.

8. When finished with the wizard, the action will appear on the top-level **Correlation > Actions** screen. Test the system by generating some test messages via the **Messages > Search > Post New Message** link, necessary to open a ticket. Note that the **CLOSE_TICKET.bat** file produces debug output, and the ticket will appear in the **Tickets > Closed** tab as soon as it is opened (after triggering any action programs, such as sending e-mail). The resolution for these closed tickets will be **Ticket auto-closed** (as configured above).

   A simple example of the correlation action screen, after performing the above steps, is shown in the screenshot below:

   ![Correlation action screen example](image_url)

   *Note that a common error is to select a keyword associated with the ticket that is a message keyword. This is not correct. For best results, simply define a tag that gets included in the ticket text content of all alarms that are to be auto-closed, such as **TICKET AUTO CLOSE**. Or, create a ticket group called **auto-close** and assign all tickets that are to be auto-closed to that ticket group.*

The **Correlation > Action** facility passes a number of environmental variables to the batch file, which permits easy extension of the facility. These environmental variables are documented in the User Manual, and examples can be found in the **actions\TEMPLATE.bat** file that comes with the system. Additional information on applications such as this correlation action can be found in a variety of locations, including the Command Line Interface User Manual.

Finally, note that when a ticket is opened or closed, this can execute a **Ticket Action**, which is a facility similar to the **Correlation Action** described here. Note that these two facilities operate in a similar fashion, but are actually completely separate. (Correlation Actions are executed on incoming messages, whereas Ticket Actions are executed when tickets are opened and/or closed.)

## Related Articles

- [How to Configure The FAST Cloud Integration With Proxy Internet Settings](link)
- [How to Delete a Device in Log Tracker](link)
- [Change Tracker - How to Review Changes Made To The Console](link)
- [Log Tracker - Types of Authentication](link)
- [Log Tracker Tags Facility](link)

**Attachments:**
- [Capture.PNG](link)