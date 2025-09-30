---
description: >-
  This article provides guidance on determining the necessary network ports that must be open for the proper functioning of Change Tracker and Log Tracker.
keywords:
  - Change Tracker
  - Log Tracker
  - network ports
sidebar_label: Network Ports for Change Tracker and Log Tracker
tags: []
title: How to Determine What Network Ports Need to Be Open for Change Tracker or Log Tracker to Function
knowledge_article_id: kA04u0000000JWdCAM
products:
  - change-tracker
---

# How to Determine What Network Ports Need to Be Open for Change Tracker or Log Tracker to Function

## Overview

Are you working through a new Change Tracker or Log Tracker deployment? Is your networking team asking you what network ports need to be open to ensure Change Tracker or Log Tracker functions correctly? - GREAT! All the information you need is displayed below.

## CHANGE TRACKER:

![Change Tracker Network Ports](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKFX&d=%2Fa%2F4u000000Lzny%2FZeSqAiVi0zhk87SB7gy6ozAik49vfOFITCzm__LZ4Fk&asPdf=false)

## LOG TRACKER:

For Log Tracker, keep in mind that our agent uses the standard syslog port (`UDP 514`) to send logs to the Log Tracker Server. For remote configuration of Windows Agents, Log Tracker will use `TCP 55514`.