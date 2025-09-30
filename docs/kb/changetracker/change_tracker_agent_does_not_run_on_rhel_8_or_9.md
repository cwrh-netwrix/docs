---
description: >-
  This article provides a resolution for the issue where the Netwrix Change Tracker agent does not run on RHEL 8 or 9 due to cryptographic policy changes.
keywords:
  - Netwrix Change Tracker
  - RHEL 8
  - RHEL 9
  - cryptographic policy
  - agent service
sidebar_label: Change Tracker Agent on RHEL
tags: []
title: Change Tracker Agent Does Not Run on RHEL 8 or 9
knowledge_article_id: kA0Qk0000000a1tKAA
products:
  - change-tracker
---

# Change Tracker Agent Does Not Run on RHEL 8 or 9

## Symptom

Affected versions:

- Netwrix Change Tracker Net Core Agent - version 7.0.1.9-255 and later

Error on agent service startup:

```
[1] INFO Message - Application core shutting down due to error, please restart service: 
This license is invalid. Please see servicestack.net or contact team@servicestack.net for more details. 
The id for this license is '%id%'
```

## Cause

A Netwrix Change Tracker agent is unable to run due to cryptographic policy changes that are applied by default on Red Hat Enterprise Linux (RHEL) 8 or 9.

## Resolution

Follow the steps below to resolve the issue:

1. On the RHEL server hosting the Change Tracker agent, open the terminal, and run the following command:

   ```bash
   # cd /usr/share/crypto-policies/policies/modules
   ```

2. Run the following commands in sequence to create a new file called `GEN7AGENT.pmod` and then open it:

   ```bash
   # touch GEN7AGENT.pmod
   ```

   ```bash
   # vi /usr/share/crypto-policies/policies/modules/GEN7AGENT.pmod
   ```

3. Add these lines to the opened file:

   ```bash
   # This subpolicy adds SHA1 hash and signature support
   hash = SHA1+
   sign = RSA-SHA1+
   ```

4. Run the following command:

   ```bash
   # update-crypto-policies --set DEFAULT:GEN7AGENT
   ```

5. Reboot the RHEL system hosting the agent.

The Netwrix Change Tracker agent should run after the subpolicies are applied.