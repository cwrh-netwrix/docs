---
description: >-
  This article provides 33 sample scripts for Agentless FIM, detailing login scripts and main scripts for various devices and systems.
keywords:
  - Agentless FIM
  - sample scripts
  - login scripts
  - main scripts
  - network devices
sidebar_label: Sample Scripts for Agentless FIM
tags: []
title: 33 Sample Scripts for Agentless FIM
knowledge_article_id: kA04u0000000JTUCA2
products:
  - activity-monitor
---

# 33 Sample Scripts for Agentless FIM

> **NOTE:** For script debugging and advanced scripting requirements, you may find it easier to use the **Script Console** packaged with any Proxy Agent installation. You can run the Script Console from `C:\Program Files\NNT Change Tracker Suite\AgentProxy\ScriptConsole`, program name `NNT.Script.Console.exe`.

The sample scripts provided in this section all include a Main Script and a Logon Script dialogue; however, for Production Agentless trackers, the Logon script only is used within the Credentials key with the Main Script commands being configured with the relevant Configuration Template.

![Sample Scripts Overview](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKB4&d=%2Fa%2F4u000000LzeM%2FxwJ49xCBsKhyoQhvfoOCAu2J2NMHroU1d_BWwMNBJ7c&asPdf=false)

## 1. Nortel Switch Telnet Login (Menu presented at the CLI)

Leave all settings at default then set **Username** and **Password** and adjust other settings where specified below:

- **Term Type:** TTY
- **Number of Columns:** 1024
- **Protocol:** Telnet
- **New Line:** CRLF
- Un-check **Send credentials with connect** (because password is sent after CTRL-Y menu stage)

*Notes - uses CTRL-Y (\x19) to initiate login. Password is sent explicitly using a **Send** command. Menu control characters are removed from the return data using the **StripCtrl** command.*

### Login Script:

```plaintext
StripCtrl,ON
Sleep,2
# Send CTRL-Y
Send,\x19
Sleep,2
Send,\r\n
Sleep,2
Send,$$PASSWORD$$\r\n
Sleep,2
```

To pick a menu item from the menu that follows and capture the result into `$$RESULT$$`:

### Main Script:

```plaintext
SendCapture,$$RESULT$$,M\r\n
```

## 2. Appliance/Legacy Unix SSH Login

Leave all settings at default then set **Username** and **Password** and adjust other settings where specified below:

- **Term Type:** TTY
- **Number of Columns:** 1024
- **Protocol:** SSH2
- **New Line:** CRLF
- Check **Send credentials with connect** (standard SSH setting)
- Set prompt (e.g. `[root@localhost ~]#`)

### Login Script:

```plaintext
WaitForPrompt
```

To execute a command and capture the result immediately after receiving the prompt, add:

### Main Script:

```plaintext
ExecuteAndCapture,$$RESULT$$,ls -l /etc
```

## 2.a. Legacy Unix Agentless FIM

Leave all settings as above and set **Username** and **Password** and adjust other settings where specified below:

### Login Script:

```plaintext
WaitForPrompt
FileHashPath,/usr/bin/
```

To execute a command and capture the result immediately after receiving the prompt, add:

### Main Script:

```plaintext
FileHashPath,/usr/bin/NNT_FILEHASH_LINUX_X64
WaitForPrompt
```

## 2.a. Legacy Unix Agentless FIM **Beware simple, single character prompts such as # or $**

> **NOTE:** On legacy systems such as AIX or Solaris, the prompt may be just a simple ‘#’. This is a ‘risky’ prompt to use as the `#` is often used for formatting welcome banners etc. and therefore may provide the tracker with a false prompt, terminating the capture prematurely.

In this instance, use an alternative shell with a stronger prompt, for example, bash. This means you would set your prompt in the credential settings as ‘bash-n#’ requiring the switch to the bash shell to be driven by the login script – see example below.

![Legacy Unix Agentless FIM](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJt2&d=%2Fa%2F4u000000LzXl%2Frmct.97NdeS7NFiteiCny4alZMb.iI5I6B1aNYdL4Hk&asPdf=false)

## 3. Cisco Telnet Login

Leave all settings at default then set **Username** and **Password** and adjust other settings where specified below:

- **Term Type:** TTY
- **Number of Columns:** 1024
- **Protocol:** Telnet
- **New Line:** CRLF
- Un-check **Send credentials with connect** (standard Telnet setting)
- **Prompts:** e.g. `PCI-Network-1600>` or `PCI-Network-1600#`

### Login Script:

```plaintext
Send,$$USERNAME$$\n
Send,$$PASSWORD$$\n
Sleep,2
# This is the Privilege mode, accessed via the en command and the password needed (Note: It is possible to configure the Cisco to require a username and password for the Privilege mode in case you need to allow for this)
Send,en\n
Sleep,2
Send,$$PASSWORD2$$\n
Sleep,2
Execute,terminal len 0
Sleep,2
```

### Main Script:

```plaintext
# Hash sensitive lines in output
HashMatchesWithComment,*** password hashed *** ,password
HashMatchesWithComment,*** enable secret hashed *** ,enable secret
# Get running config
ExecuteAndCapture,$$RESULTS$$,sh run
```

## 4. Windows Agentless Login

Leave all settings at default then set **Username** and **Password** and adjust other settings where specified below:

- **Term Type:** Unused/Default
- **Number of Columns:** 1024
- **Protocol:** Windows Logon
- **New Line:** CRLF
- Check **Send credentials with connect**
- **Prompts:** e.g. `C:\Windows\System32>`

### Login Script:

```plaintext
WaitForPrompt
```

### Main Script – Example:

```plaintext
ExecuteAndCapture,$$RESULT$$,ipconfig
```

## 4.a Agentless Windows FIM

For Windows Agentless FIM, there are some additional requirements to enable connectivity and operation of the Agentless FIM scan, both for the NNT ProxyAgent service and the target server(s).

In order for Change Tracker to perform Agentless FIM on a remote Windows host, the NNT ProxyAgent Windows Service will be required to be assigned appropriate credentials for access. There are two different scenarios to consider – using Domain accounts and Local Accounts.

In either case, the assignment of credentials is done the same way, using the Microsoft Windows Services console to enter the account username and password for the NNT Windows Service (Note: The default Network Service account uses the Computer Identity and its rights are too limited to provide the Agentless Windows function).

![Agentless Windows FIM](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKB9&d=%2Fa%2F4u000000LzeR%2FlWPu7O_yPKIQpWhi5wAc3KD1F0d56kFt97Uls5gPxms&asPdf=false)

Regardless of whether Domain or Local accounts are used, the account used will require Local Administrator rights for the monitored target server(s). In this example, we have created a special User Account called ‘AgentlessFIM’ and assigned it to the NNT Proxy Agent service being used to monitor a remote server.

The `NNT.Filehash.exe` binary will need to be deployed to the host; best practice is to create a Program Files folder `C:\Program Files\NNT Change Tracker Suite\Filehash` and place the Windows `NNT.Filehash.exe` within it.

The path for the `NNT_FILEHASH` binary needs to be specified within the Credentials Key Login Script used for the host using the attribute **FileHashPath**.

e.g. Login Script:

```plaintext
WaitForPrompt
FileHashPath,"C:\Program Files\NNT Change Tracker Suite\Filehash\NNT.Filehash.exe"
```

## 4.a Agentless Windows FIM Additional Notes:

The Agentless Windows FIM connection uses netbios operations for remote service control and Windows named pipes for remote command execution, so can only be run from a Windows-based NNT ProxyAgent to a Windows server.

If connection problems are encountered, check that you are able to:

a) establish a file share connection to the server from the host using the credentials e.g.

![File Share Connection](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK7D&d=%2Fa%2F4u000000LzeW%2FWp2EVmud7Y_bHpIoOCcZg7tRjl1POjCByJmZqbMbuns&asPdf=false)

b) copy a file to the **ADMIN$** share using File Explorer

c) control service state remotely using `sc.exe` from the command prompt (e.g. successfully querying remote service state proves the point: `sc \\servername query`)

## 4.a Agentless Windows FIM Security Policy/Group Policy and Firewall Rules

When using Local Accounts, the Local Security Policy entry

```
Computer Configuration\Windows Settings\Security Settings\Local Policies\Security Options\
```

‘Network access: Sharing and security model for local accounts’ should be configured to ‘Classic: Local users authenticate as themselves’.

See [Network Access: Sharing and Security Model for Local Accounts ⸱ Microsoft 🡥](http://technet.microsoft.com/en-us/library/cc786449%28v=ws.10%29.aspx).

![Firewall Rules](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK6e&d=%2Fa%2F4u000000Lze8%2F7SQQCoLxvDfzIMJY1mE4B7Xh2IVsBAxhTIrGlrqiaVs&asPdf=false)

Firewall rules require TCP Port 139 ‘NetBIOS over TCP/IP’ which is the classic file and printer sharing port used by Microsoft.