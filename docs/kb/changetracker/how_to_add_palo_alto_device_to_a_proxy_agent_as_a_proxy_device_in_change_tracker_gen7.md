---
description: >-
  This article provides a step-by-step guide on how to configure a Palo Alto device as a proxy agent in Change Tracker Gen7, including necessary prerequisites and credential setup.
keywords:
  - Palo Alto
  - Change Tracker
  - Proxy Agent
sidebar_label: Add Palo Alto Device to Proxy Agent
tags: []
title: How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7
knowledge_article_id: kA04u0000000JXHCA2
products:
  - change-tracker
---

# How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7

## Overview

This article will describe how to configure a Palo Alto device as a proxy agent. These devices are similar to other proxied devices but have some known configurations that must be applied for the device to register with Change Tracker.

## Step-by-step Guide

Here are the prerequisite steps involved to add a Palo Alto device as a proxied device:

1. Set up SSH credentials on the Palo Alto device with at least the ability to view `show system info` and `show config running`.
2. Make sure the Palo Alto confirmation prompt is turned off. A simple banner can be added in its place. This has been known to cause problems with tracking configuration.
3. Test the credentials you have set up using an SSH PuTTY session. While you are here, copy the user prompts that are to the left of the CLI entry.
   - **For Example:** `username@localhost> show config running` - the `username@localhost>` is the prompt.

## Setting up the Proxied Device

Once you have followed the steps above, you are ready to add the device to Change Tracker.

**Proxy Agent:**  
By default, every Gen 7 Hub server installation includes a Netwrix Proxy Agent App or, in later deployments, a Netwrix Gen 7 Agent. Any single Proxy Agent instance can monitor hundreds of devices.

**Proxied Device:**  
Once a Proxy Agent element has been established, the devices to be monitored can be configured.

To add a proxied device:

1. Log into your Change Tracker console and go to the **Settings** tile. 
2. On the left navigation buttons, select **Agents & Devices** and locate your **Proxy Agent**. Click the **+Add Proxied Device** button.

![Add Proxied Device Screen](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK57&d=%2Fa%2F4u000000Lzpe%2FEv8cP4ConCEe0rsVN9q8CvS2dO4MANHRd5PCFR22Q58&asPdf=false)

Upon clicking that button, you will see the screen below. Here you will enter:

1. The device **Name** as you want it to appear in the Change Tracker Console.
2. The device's IP Address.
3. Select the Device Type (in our case, it's **Network**).
4. Select the correct device Groups (if you type in **Palo Alto**, you will see our default results).
5. Make sure the **Diagnostic Mode** checkbox is **CHECKED**.
6. Click on the **+New Credentials...** button to begin entering device credentials.
7. Once you have created your credentials, click on **Update**.

![Proxied Device Configuration Screen](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKBB&d=%2Fa%2F4u000000Lzpj%2FscYIHOXXTiUf16UKV4zPPqlnhfLkV8MMfBm.eK8FZUg&asPdf=false)

## Setting up the Credentials

At this stage, you are ready to set up the credentials. Some very important pieces are highlighted with green (see screenshot below).

1. Give the credentials a name.
2. Select **ANSI** as the Terminal Type.
3. Select your preferred protocol type (SSH2 is usually best).
4. Select **CRLF** for the New Line.
5. Enter your SSH Username and Password credentials you created in the prerequisites section.
6. This next step is very important. For the prompts, if your firewall places an **(active)** right before the `>` prompt, you should use prompt **A** below and configure your prompts where the text is red. If it does not, use prompt **B** and configure your prompts where the text is red. (Note: in prompt B, there is a period (.) immediately following the `\n`).

   You can copy and paste the below. If you do, remember to remove the **a** and **b**:

   ```
   A:
   regex:\nusername@hostname\(active\)>
   
   B:
   regex:\n.+-hostname>
   ```

7. Now, make sure you have the **Password with Connect** box checked.
8. Configure the **Login Script** section as shown below.

   **Note:** Palo Alto configurations are exported by default in XML format. Running the `Set cli config-output-format set` command will make them display in a more readable format.

   You can copy and paste the below:

   ```
   StripCtrl,ON
   ExcludeMatchesWithComment,**Uptime Line Removed**,uptime\:
   ExcludeMatchesWithComment,**Current time Line Removed**,time\:
   Execute,\n
   Sleep,2
   Execute,set cli pager off
   Sleep,2
   Execute,set cli config-output-format set
   Sleep,2
   ```

9. Click on **Update**.
10. If you are returned back to the adding a proxied device section afterwards, also click on **Update**.

![Credential Setup Screen](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK9k&d=%2Fa%2F4u000000LzNo%2Fr4mXS3ORhrIHPCf2AK5CGtxUlV3FIuAoZRPCDCNsGkc&asPdf=false)

## In Some Cases, You Will Need to Use the Following Instead:

```
ExcludeMatchesWithComment,,^time.+|^uptime.+|^app-.+|^av-.+|^threat.+|^wf-.+|^url-.+|^wildfire-.+|^global-.+|^Unkn.+
Sleep,1
Execute,set cli pager off
Sleep,1
Execute,set cli config-output-format set
Sleep,1
Send,show config running
ExecuteAndCapture,$$RESULTS$$,
Sleep,1
Send,show system info
ExecuteAndCapture,$$RESULTS$$,
Sleep,1
Send,show admins all
ExecuteAndCapture,$$RESULTS$$,
```

If you are using the above, please remember to change the Palo Alto monitoring template to show the following:

![Palo Alto Monitoring Template](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJsO&d=%2Fa%2F4u000000LzNr%2FdDpD3BrV7xyP3dr1NPQDejqf4NKCvZrgwlqY5swHeTw&asPdf=false)

## Related Articles

- [How to Configure The FAST Cloud Integration With Proxy Internet Settings](https://kb.netwrix.com/8295)
- [How to move your Linux Server MongoDB Database to a Windows server?](https://kb.netwrix.com/8283)
- [How to Add Palo Alto Device to a Proxy Agent as a Proxy Device in Change Tracker Gen7](https://kb.netwrix.com/8164)
- [How to Change the Admin Password of your Mongo Database](https://kb.netwrix.com/8310)

**Attachments:**
- [palo_alto.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKBU&d=%2Fa%2F4u000000Lzag%2F2_DIe5QtcvgR5r7t2pDoKyYUrKns9VQm.T0vVwIICOc&asPdf=false)
- [image2017-9-20_14-12-18.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKBa&d=%2Fa%2F4u000000Lzpy%2F5lb73UvnQrYPsFNJYtCKnwhQzPgMHYB.K1rQkhY0cSk&asPdf=false)
- [image2017-9-20_12-46-55.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJzZ&d=%2Fa%2F4u000000Lzip%2FI.TBnJdUKbi51OypedHIkYB4TLv021r1UnWZNKLBP0s&asPdf=false)
- [image2017-9-20_12-36-28.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKH3&d=%2Fa%2F4u000000LzY8%2Fqeu6MW38CcjXLE0Fagu4FH33EDRRACIB4igsV1kPRNo&asPdf=false)
- [image2017-9-20_12-29-21.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK3b&d=%2Fa%2F4u000000Lziu%2FOJVk4hzh5WVYhXvegUbBz8EN0obCwAIQVlr9R2hzRkM&asPdf=false)
- [image2017-9-20_12-25-30.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJrj&d=%2Fa%2F4u000000LzQM%2FObg6vUYFZkxjaab9eI4jJgctxHZAZBxJqQ5GW60pc04&asPdf=false)