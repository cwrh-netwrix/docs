---
description: >-
  This article provides step-by-step instructions on how to implement HTTPS for the Netwrix Change Tracker web user interface and discusses the implications of installing a certificate on agent connectivity.
keywords:
  - HTTPS
  - Netwrix Change Tracker
  - web user interface
sidebar_label: Implement HTTPS for Change Tracker
tags: []
title: How to Implement HTTPS for Netwrix Change Tracker Web User Interface
knowledge_article_id: kA04u000000wnpECAQ
products:
  - change-tracker
---

# How to Implement HTTPS for Netwrix Change Tracker Web User Interface

## Question

How to implement HTTPS for Netwrix Change Tracker web user interface? What impact would installing a certificate have on the agents checking in?

## Answer

HTTPS should already be configured for your Change Tracker server. You can confirm this by following the steps below:

1. RDP into the Change Tracker Server.
2. Open **Internet Information Services (IIS) Manager**.
3. Locate **Server Name** and expand the **Sites** dropdown.
4. Click **Change Tracker Generation 7n**. On this page, click **Bindings**, and you should be able to see the HTTPS binding.

This is also the location where a new certificate can be selected. It's worth noting that the certificate needs to be signed by a CA that is trusted by all of the agents connecting to Change Tracker. If the agents do not have the CA trusted in their store, adding the certificate's Thumbprint to the agent configuration would be required, and the agents would all be disconnected until the thumbprint is added.