---
title: "Enable password reset operation in the UI"
description: "Enable password reset operation in the UI"
sidebar_position: 20
---

# Enable password reset operation in the UI

This section explains how to make password features available through the UI (in the user's menu "Manage Account")

## Prerequisites

This example assumes an AD connector is already configured, and has a `ResourceType` and a `LdapResourceTypeMapping` linked to a set `PasswordResetSettings`

## Permission attribution

To enable password operations through the UI, two kinds of permissions must be given:

### 1. The permission to open the `Manage Accounts` modal

This permission can be given either through a scaffolding or explicitly

*Permission attribution through scaffolding:*

```

  <ManageAccounts EntityType="Directory_User" Profile="Administrator"/>

```

*Explicit permission attribution:*

```

  <AccessControlRule Profile="Administrator" EntityType="AD_Entry" Identifier="Administrator_ManageAccounts_AD_Entry" DisplayName_L1="Administrator_ManageAccounts_AD_Entry">    <Entry Permission="/Custom/ManageAccounts/AD_Entry" CanExecute="true" />  </AccessControlRule>

```

### 2. The permission to perform password operations

In the example below,

* Reset Password refers to a direct re-initialization (via a form in the UI)
* Indirect Reset password will use the settings already defined in the configuration, either One-Way or Two-Way, sending an email
* Toggle lock will allow the unlocking of an account locked due to too many incorrect password attempts
* Change password presents a form to the user, asking for the old password and allowing the creation of a new one

```

  <AccessControlRule Profile="Administrator" EntityType="AD_Entry" Identifier="Administrator_PWR_AD_Entry" DisplayName_L1="Administrator_PWR_AD_Entry">    <Entry Permission="/Custom/Resources/AD_Entry/ResetPassword" CanExecute="true" />    <Entry Permission="/Custom/Resources/AD_Entry/IndirectResetPassword" CanExecute="true" />    <Entry Permission="/Custom/Resources/AD_Entry/ToggleLock" CanExecute="true" />    <Entry Permission="/Custom/Resources/AD_Entry/ChangePassword" CanExecute="true" />  </AccessControlRule>

```

The permissions to manage accounts are related to `EntityTypes` (Not to `ResourceTypes`)