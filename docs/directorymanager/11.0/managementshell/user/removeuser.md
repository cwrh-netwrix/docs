---
title: "Remove-User"
description: "Remove-User"
sidebar_position: 40
---

# Remove-User

Use the **Remove-User** commandlet to delete a user from directory.

## Syntax

```
Remove-User
-Identity <string[]>
[-IdentityStoreId <int>]
[-SecurityToken <CustomClaimsPrincipal>]
[-Credential <pscredential>]
[<CommonParameters>]
```

## Required Parameter

- Identity

Example:

The following command deletes a user with the specified name.

```
Remove-User -Identity "osama"
```
