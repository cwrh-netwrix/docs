---
title: "Configure Password reset settings"
description: "Configure Password reset settings"
sidebar_position: 10
---

# Configure Password reset settings

Password reset settings are linked to resource types through their mappings (via the `ResourceTypeMapping` configuration element).

In this section we'll give an example of how to configure the password reset operations for AD Accounts.

## Prerequisites

This example assumes an AD connector is already configured, and has at least one `ResourceType` and its corresponding `LdapResourceTypeMapping`:

```

  <LdapResourceTypeMapping Identifier="AD_Entry_NominativeUser" Connection="ADExportFulfillment" DefaultObjectClass="user" RDNAttributeIdentifier="CN" UsePermissiveModify="true" UseTreeDelete="false">    <Property Property="dn" IsDNProperty="true" />    <Property Property="parentdn" IsParentProperty="true" />    <Property Property="cn" IsRDNProperty="true" />    <Property Property="userAccountControl" IsUserAccountControlProperty="true" />    <Property Property="memberOf" DataSourceBacklinkColumnName="member" />    <Property Property="extensionAttribute15" MultiValueSeparator=";" />  </LdapResourceTypeMapping>

```

## Create Password Reset Settings

Create a `PasswordResetSettings` configuration element describing:

* Bindings to get the beneficiary's display name & email address (the beneficiary is the owner of the account for which the password is reset): `BeneficiaryFullNameBinding` and `BeneficiaryEmailBinding`
* Bindings to get the notified person's display name and email address: `NotifiedFullNameBinding` and `NotifiedEmailBinding`. Note the notified person can be someone other than the beneficiary.
* Generated password settings (Length, Strength, Default Password, etc..)
* Mode: One-Way or Two-Way

See the Password Reset Settings topic for additional information.

```

  <PasswordResetSettings Identifier="default" BeneficiaryEmailBinding="AssignedResourceType:Owner.Directory_User:MainRecord.Mail" BeneficiaryFullNameBinding="AssignedResourceType:Owner.Directory_User:MainRecord.InternalDisplayName" NotifiedEmailBinding="AssignedResourceType:Owner.Directory_User:MainRecord.Organization.Manager.MainRecord.Mail" NotifiedFullNameBinding="AssignedResourceType:Owner.Directory_User:MainRecord.Organization.Manager.MainRecord.InternalDisplayName" Mode="1" DefaultPassword="Usercube@2019" MustChange="true" AutoGenerate="false" DisableNotifications="false" GeneratedLength="12" />

```

## Link a resource type mapping with the password reset settings

Edit the `LdapResourceTypeMapping` to create a link to the newly created `PasswordResetSettings` like the following:

```

    <LdapResourceTypeMapping Identifier="AD_Entry_NominativeUser" [...] PasswordResetSetting="default">    [...]
  </LdapResourceTypeMapping>

```

The same password reset settings can be linked to multiple resource type mappings (as long as the set bindings are valid across these resource types)

At this point, the configured password reset settings are only applied through the fulfillment process.

In order to make password reset operations available through the user menu "Manage Accounts", access rules have to be configured.