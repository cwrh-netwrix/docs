---
description: >-
  Speed up domain enumeration in the Access Information Center (AIC) by
  specifying which domains the AIC enumerates on startup to improve application
  startup performance.
keywords:
  - Access Information Center
  - AIC
  - domain enumeration
  - web.config
  - DNS
  - startup performance
  - StealthAudit
  - domains
products:
  - access_info_center
sidebar_label: Specify Domains for AIC to Enumerate
tags: []
title: "Specify Domains for AIC to Enumerate"
knowledge_article_id: kA04u0000000IT4CAM
---

# Specify Domains for AIC to Enumerate

## Summary:
**Summary:** Speed up domain enumeration in the Access Information Center (AIC)

## Issue:
**Issue:** You can specify which domains the AIC enumerates, rather than allowing the AIC to try all of them every time.

It does this every time a user logs into the AIC.

A comma-separated list of domains that AIC is allowed to enumerate on startup.

This list is useful because customers often have domains with trust relationships that are unavailable due to being taken down, etc. This makes application startup take significantly longer.

## Instructions:
**Instructions:** 

In the web.config file (by default `C:\inetpub\wwwroot\StealthAudit Compliance`), enter the DNS names of the domains you'd like in this tag:

for example:

## Product / Module / Article
**Product:** AIC  
**Module:** AIC - Entitlement Review;AIC - Installer;AIC - Manage Resource Ownership;AIC - Remediate Open Shares;AIC - Reporter  
**Salesforce Article ID:** 000001223

https://stealthbits.my.salesforce.com/kA0j0000000bng5?srPos=0&srKp=ka0&lang=en_US
