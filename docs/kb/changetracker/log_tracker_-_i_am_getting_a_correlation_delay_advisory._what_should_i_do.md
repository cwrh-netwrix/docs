---
description: >-
  This article provides guidance on addressing the "Correlation Delay" advisory in Log Tracker, including recommendations for improving data correlation efficiency.
keywords:
  - correlation delay
  - Log Tracker
  - data correlation
sidebar_label: Correlation Delay Advisory
tags: []
title: Log Tracker - I Am Getting a "Correlation Delay" Advisory. What Should I Do?
knowledge_article_id: kA04u0000000JdKCAU
products:
  - change-tracker
---

# Log Tracker - I Am Getting a "Correlation Delay" Advisory. What Should I Do?

## Overview

This advisory indicates you are receiving data faster than you can correlate it. This may be a temporary condition you can ignore or a pathological condition that will worsen unless you address it. Essentially, this indication signifies an overload condition—temporary or chronic.

## Recommendations

Here are some recommendations:

The fastest way to immediately increase your capacity is to redirect certain messages to an **Aux** file, such as all **security*4663** messages. This single change will likely increase your capacity by 20% or more. You can do this via the **Messages > Config > Filters** screen, and you don't necessarily lose these messages permanently. You can set **Archive Filtered Data** to **Yes** on the **Messages > Config > Parms** screen. See the screenshots below for help:

![Screenshot 1](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKTZ&d=%2Fa%2F4u000000Lzrh%2FdTjTvbllVaA5jxLB1o7cexbuUX7jQlpOGYXdVMff4Dg&asPdf=false)

![Screenshot 2](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKXL&d=%2Fa%2F4u000000M03C%2FcQq.P8PlN78Dv7eQxYIS6F7exSAWfE8sQLW6Qw2PmFw&asPdf=false)

Another good alternative is to make your correlation thread match patterns more efficient. The most time-consuming type of correlation rule is something like **(A or B or C or D)** (i.e., a match pattern that is a series of "Orred" match patterns). Although these are still evaluated very quickly, they begin to consume a lot of time because you are comparing each "Orred" component against all messages you receive, scanning the message repeatedly. This can consume "Correlation" time.

If you are sending messages at a very high rate, you can reduce correlation load substantially by doing any of the following:

1. Redirect boring messages to an **Aux** file. (Note that this does not necessarily mean you are actually losing data since this data can be archived off.)
2. In your correlation thread, match the **Address Group**, **Facility**, and/or **Severity** of the message (in addition to a **Match Expression**). This reduces the correlation delay by limiting the amount of data you have to pass through the correlation rules.
3. Convert your match pattern to something like **"X and (A or B or C or D)"**, i.e., find a common keyword that you can compare with as a first step in the correlation rule.

Item #3 above may require you to review all your thread match expressions to see how efficient they are. You can see the load being used for your correlation threads using the **Audit Full Thread Configuration** link, found at the bottom of the **Correlation > Threads** screen. 

For example, if you have a correlation thread match pattern such as this:

*_"security 4902" or "security 4904" or "security 4905" or "security 4906" or "security 4907" or "security 4908" or "security 4912"_

You can make the above thread match expression much more efficient by simply changing the thread match pattern to:

*_"security 49" and ("security 4902" or "security 4904" or "security 4905" or "security 4906" or "security 4907" or "security 4908" or "security 4912")"_

In this case, we bypass further testing of the message unless **"security 49"** is present in the thread—this saves us time. If the message does not contain **"security 49"**, there is no need to evaluate the rule further.

If you further add a **Match facility** of **audit** (or whatever) that makes the correlation rule work even faster!

> **IMPORTANT:** Keep in mind that all messages are compared to all correlation threads. You can decrease "correlation delay" by either reducing the amount of data you are passing through these threads (such as with an Aux file filter), or by making the threads more efficient, or both.

## Related Articles

- [How to Configure The FAST Cloud Integration With Proxy Internet Settings](https://kb.netwrix.com/8295)
- [How to Delete a Device in Log Tracker](https://kb.netwrix.com/8230)
- [Change Tracker - How to Review Changes Made To The Console](https://kb.netwrix.com/8280)
- [Log Tracker - Types of Authentication](https://kb.netwrix.com/8275)
- [Log Tracker Tags Facility](https://kb.netwrix.com/8267)

**Attachments:**
- [Capture2.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKXV&d=%2Fa%2F4u000000Lzmw%2Fa2HzIkat7Y4Lqh9omlpUJAouPZ1Aq54zCjhvl2m_Ss0&asPdf=false)
- [Capture.PNG](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKXo&d=%2Fa%2F4u000000Lzqf%2FMKDDcdSzm.3T9eS1kYubskclo9hntj5XapFAXjYp7_8&asPdf=false)