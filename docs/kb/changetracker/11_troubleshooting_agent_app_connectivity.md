---
description: >-
  This article provides troubleshooting steps for resolving connectivity issues with the Agent App, including checking agent operation and verifying Hub URL configurations.
keywords:
  - Agent App
  - connectivity issues
  - troubleshooting
sidebar_label: Troubleshooting Agent App Connectivity
tags: []
title: Troubleshooting Agent App Connectivity
knowledge_article_id: kA04u0000000JPsCAM
products:
  - change-tracker
---

# Troubleshooting Agent App Connectivity

## Check Agent Operation

There is a local agent status interface that can be viewed via the local web browser. To begin, check the operation of your local Windows Agent.

**N.B** **On Windows, use your web browser to open**  
`file:///C:/Program%20Files/NNT%20Change%20Tracker%20Suite/Agent/web/NNTAgentStatus.html`

**On Unix/Linux,**  
`file:///opt/mono/nntagent/files/mono/web/NNTAgentStatus.html`

The below shows that the agent service is running correctly, but it has been unable to register with the Change Tracker Hub. The Agent should report the URL for the Hub it is registered to. **NOTE:** Where the Change Tracker Hub has been installed on a Windows/IIS platform, the Hub URL will be [https://192.168.1.36/api](https://192.168.1.36/api).

The Agent should present an Agent ID.  
There should always be at least two trackers assigned to an Agent.

![Agent Status Example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK1s&d=%2Fa%2F4u000000LzUM%2Ffc09vOg5Kb4c7P.GkX1ZyPQAJvMoZ0sliq35d1a0n.o&asPdf=false)  
In this instance, the agent has not registered with the Hub because it does not have an Agent ID – we want to see an Agent ID indicated as in the below:

![Agent ID Example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK1x&d=%2Fa%2F4u000000LzUR%2FlBuu2ePU_F7QEiUCsbL2trJDYCB0kR8D8puSQHUrJZc&asPdf=false)

Most common reasons for an Agent not registering are either the Agent username or password being incorrect, or network connectivity issues. The first step is to check that there is network connectivity to the Hub URL – enter  
`https://192.168.1.36/api`.

![Network Connectivity Check](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJyG&d=%2Fa%2F4u000000LzUW%2FY1Bm5KJnJj2zrseRp.9ewu6VxyYoUkte6zfHPq5TlME&asPdf=false)  
**Note that Agents will need HTTPS Port 443 access to the Change Tracker server, and you may need to configure a firewall rule for this.**  
**Hub Details File:** You can verify that the correct Hub URL is configured for your agent by inspecting the `HubDetails.xml` file located at:

- `C:/Program Files/NNT Change Tracker Suite/Agent/bin/HubDetails.xml` on Windows
- `/opt/nnt/agent/bin/HubDetails.xml` on Solaris

The Hub URL section is highlighted.

![Hub Details Example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJv8&d=%2Fa%2F4u000000LzRi%2FDMhVXrq1CgE7yvlL7f5cjiPXP3GlL0TgILGdbKEDuYc&asPdf=false)

The section following the Hub URL shows the encrypted password entry – this is normal and shows the agent initialization has operated correctly. An unencrypted password means the Agent didn't initialize and suggests a bad installation – remember the Agent on Windows requires the latest Netwrix Mono runtime.

Make sure this URL is the one assigned to your Agents, as the default location is to use `localhost`. Likewise, the default Username is `agent`, and the default password for Agent registration is `passWord121` – unless you have changed this, please ensure this is configured for all agents.

If you are still experiencing issues, please contact support@nntws.com.