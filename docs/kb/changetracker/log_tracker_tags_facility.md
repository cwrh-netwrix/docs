---
description: >-
  This article describes the new "Tags" facility introduced in Log Tracker Version 5-7-1, which allows users to tag messages with keywords for better data organization.
keywords:
  - Log Tracker
  - Tags facility
  - message tagging
  - data organization
  - parse functions
sidebar_label: Log Tracker Tags Facility
tags: []
title: Log Tracker Tags Facility
knowledge_article_id: kA04u0000000JdUCAU
products:
  - activity-monitor
---

# Log Tracker Tags Facility

## Overview

As of Version 5-7-1, Log Tracker has introduced a new **Tags** facility that can be used to tag messages with keywords, including dynamically parsing a keyword from a received message. This allows new capabilities in organizing data.

The **Tags** screen is available via the **Messages > Config > Tags** tab of the system. The user enters match keywords, and then tags are appended to the end of messages when those messages match a tag keyword. The tags can then be correlated (via a thread) or viewed on a dashboard gadget (via the **Parse Thread** gadget).

## Instructions

Several applications and features exist with this new feature, as follows:

1. A message can be tagged with multiple tags, and tags are appended in the order that the keywords match the message. The order of tags is modified via a special **Re-Order Tags** screen, accessed at the bottom of the **Tags** screen (when more than one tag exists). Therefore, you can tag a message with multiple keywords such as `Tag: security warning windows development`, where the order of tags remains the same for all matched messages.

2. A message tag can be a static keyword or a parse function. For example, to tag all messages with the second username (if it exists in a message), you can make the **tag** value a parse function such as `"$skip(username, 1, username: *)"`.

3. In particular, the parse function used to tag a value can be the `$maplist()` parse function, which can be used to enrich a message with new content that exists in a list macro. For example, you can tag a Windows event number with a textual description via some **tag** value such as `"$maplist(Security *:, my_list_macro)"`, which will cause the tag value to be the second column of the **my_list_macro** (created by the end user).

Note that the `$maplist()` function, described above, is especially powerful when used with the Tags facility because it can be used to augment a message with new data that might not otherwise exist in the message (see the `$maplist()` parse function for additional information and a description of its usage).

Specifically, using the `$maplist()` function as a tag value permits easy **data enrichment** capabilities. For example, using the `$maplist()` function, it would be possible to append an organization full name to a message or any other descriptive text, adding new information to messages and allowing new ways for messages to be correlated.

> **NOTE:** One obvious application of the **Tags** facility would be to append the country code for any message where an external IP address exists. This can be accomplished with a tag value such as `"$geo($extip())"`, where the `$extip()` parse function returns the first external IP address found in the message, and the `$geo()` parse function converts that value to a standard Geo-location country code. This would add a tag such as `Tag: AU` to any message containing an Australian IP address, or some other country code depending upon the content of the message.

See the screenshot below for an example of a way to configure the above Geo-location application.

Various other applications of this new facility may exist.

## Related Articles

- [How to Configure The FAST Cloud Integration With Proxy Internet Settings](#)
- [How to Delete a Device in Log Tracker](#)
- [Change Tracker - How to Review Changes Made To The Console](#)
- [Log Tracker - Types of Authentication](#)
- [Log Tracker Tags Facility](#)