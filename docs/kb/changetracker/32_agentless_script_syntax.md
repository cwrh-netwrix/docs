---
description: >-
  This article provides an overview of predefined script variables and commands used in agentless scripts, along with examples and notes for effective usage.
keywords:
  - agentless scripts
  - script commands
  - predefined variables
sidebar_label: Agentless Script Syntax
tags: []
title: 32 Agentless Script Syntax
knowledge_article_id: kA04u0000000JTPCA2
products:
  - activity-monitor
---

# 32 Agentless Script Syntax

## Predefined Script Variables

These are created by the script execution engine, and, in the case of all but `$$RESULT$$`, are pre-populated with the values supplied in the Credentials Key. They can be used in the script where required.

- `$$USERNAME$$` - the user name used for initial SSH / Telnet connection
- `$$PASSWORD$$` - the password used for initial SSH / Telnet connection
- `$$USERNAME2$$` - the second level (admin / privilege) user name
- `$$PASSWORD2$$` - the second level (admin / privilege) password
- `$$RESULTS$$` - the variable whose contents are used as the ‘result text’ of the script. **Note:** using multiple capturing commands with the same variable will result in the data being appended to the existing value.

## Script Commands

A script command consists of one or more parts separated by a comma. Generally, the format order is `CommandText,[VariableName],[Option],[Command]` where the portions in square brackets are optional and depend on the command.

### Examples:

- `MorePrompt,-- More --`
- `ExcludeMatchesWithComment,*** uptime line removed ***,uptime`
- `Send,\x19`
- `Send,$$PASSWORD$$\r\n`
- `ExecuteAndCapture,$$RESULTS$$,ls -al`

### Notes:

All commands are automatically followed by the Newline character, except for the ‘Send’ command where this must be specified explicitly. This is to allow sending single characters in response to menu options, etc.

Commands may occur multiple times, for example, to exclude multiple matching lines.

**Comment Line** – Use of `#` at the start of a script line will render the following text as a comment only.

e.g. `# For information only - describes the behavior of the login script`

**Capture** - Captures the data received in the next 5 seconds into the named variable. Example to capture the login banner when placed at the head of a script:

e.g. `Capture,$$BANNER$$`

**CaptureTimed** - Captures the data received in the specified number of seconds into the named variable. Example to capture the login banner when placed at the head of a script where this takes up to 10 seconds to appear:

e.g. `Capture,$$BANNER$$,10`

**ExcludeMatchesWithComment** - Excludes lines matching the given regex from the output text, for example, use this to exclude lines with an uptime value which would otherwise be considered a change.

e.g. `ExcludeMatchesWithComment,*** uptime line removed ***,uptime`

**Execute** - Executes the given command and waits for one of the prompts in the received data.

e.g. `Execute,ls –al`

**ExecuteAndCapture** - Executes the given command and waits for one of the prompts in the received data. Captures the result into the given variable.

e.g. `ExecuteAndCapture,$$WHOAMI_RESULT$$,whoami`

**FileHashPath** – Defines the name and path for the `NNT_FILEHASH` binary to use for Agentless FIM. General best practice is to locate the `NNT_FILEHASH` binary in the `/usr/bin` folder with execute permissions set for the user account assigned to Change Tracker.

e.g. `FileHashPath,/usr/bin/NNT_FILEHASH_LINUX_X64`

**HashMatchesWithComment** - Hashes lines matching the given regex in the output text using a SHA256 hash, for example, to hide passwords. Prefixes the hash with the comment if present.

e.g. `HashMatchesWithComment,*** password hashed *** ,password`

**MorePrompt** - Watches for the given ‘more’ prompt text in the response and sends the given text in reply.

e.g. `MorePrompt,--More--,\n`

**Replace** - Replaces the given string in the received data with the specified replacement.

e.g. to replace all escape characters with ‘-’: `Replace,\x1B,-`

**ReplaceCtrl** - Replace all control characters with the specified replacement (See also: **StripCtrl** below).

e.g. `ReplaceCtrl,-`

**Send** - Sends the specified characters and continues immediately. Note that control characters are represented as their ASCII hex values in the standard notation `\xNN`, where `NN` is the hex value of the character (see [ASCII Control Code Chart ⸱ Wikipedia 🡥](http://en.wikipedia.org/wiki/ASCII#ASCII_control_code_chart)).

e.g. to send CTRL-Y character: `Send,\x19`

**SendCapture** - Sends the specified characters and captures the data received in the next 5 seconds into the named variable.

e.g. to pick a menu item ‘L’ and capture the result: `SendCapture,$$RESULT$$,L`

**SendCaptureTimed** - Sends the specified characters and captures the data received in the specified number of seconds into the named variable.

e.g. to pick a menu item ‘L’ where the response takes 20s to appear and capture the result:

e.g. `SendCapture,$$RESULT$$,20,L`

**Sleep** - Pauses script execution for the given number of seconds.

e.g.: `Sleep,5`

**StripCtrl** - Removes all ANSI control characters from the returned data. Format is `StripCtrl,ON` or `StripCtrl,OFF`.

**WaitFor** - Waits for the given text in the received data.

e.g.: `WaitFor,Credentials`

**WaitForPrompt** - Waits for any of the prompts specified from the console Prompts list or the AddPrompt commands.

## Advanced Prompt Configuration – Using RegEx

RegEx can be used to define the Prompts. By default, if any of the Prompt strings defined in the Credentials key match any part of a prompt displayed by the monitored device, this will be treated as a full prompt and the next step in the Logon script will be progressed.

However, more complex Regular Expression based prompts can be defined to ‘wildcard’ sections of the prompt and to more precisely define the Prompt with a new line prefix for instances where a simple prompt (e.g. a single `>` or `$`) may appear elsewhere in the data being tracked, triggering an early termination of the tracking operation.

![Prompt definition example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK3k&d=%2Fa%2F4u000000Lzdx%2FV_RqETtxxyiNIezifUGwB3f2JIlCwU5sXzwljrAD9SQ&asPdf=false)

This prompt definition matches a sequence of ‘new line’ ‘any characters’ ‘-1700>’.

Please contact support if you have any challenging prompt or logon script issues.