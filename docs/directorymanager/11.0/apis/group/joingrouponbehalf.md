---
title: "Join a Group on behalf of another user"
description: "Join a Group on behalf of another user"
sidebar_position: 100
---

# Join a Group on behalf of another user

Using this API, you can join the group specified in the endpoint URL on behalf of another user. You
have to specify the identity store where the group exists, the identity of the other user on behalf
of whom you are joining the group, and membership type details.

## Endpoint

**https://demomachine:4443/GroupIDDataService/api/IdentityStores/{identitystoreId}/Groups/{GroupIdentity}/JoinOnBehalf**

## HTTP Method

**POST**

#### Sample Request Syntax

```
{
  "IdentityStoreID": 2,
  "ReplicationRequired": true,
  "joiningUserIdentity": "a79934a7-c6a0-4a1c-8860-f9aeb4788e98",
  "joinType": {
    "MembershipType": 1,
    "StartDate": "0001-01-01T00:00:00",
    "EndDate": "0001-01-01T00:00:00",
    "Reason": "test"
  }
}
```

#### Sample Response Syntax

```
{
    "currentDirectoryServer": null,
    "exceptionMessagesAttributeWise": null,
    "data": null,
    "identityStoreObject": null,
    "name": null,
    "errorCode": null,
    "details": [
        {
            "currentDirectoryServer": null,
            "exceptionMessagesAttributeWise": null,
            "data": null,
            "identityStoreObject": null,
            "name": null,
            "errorCode": null,
            "details": [
            ],
            "type": 0,
            "message": null,
            "status": 0
        }
    ],
    "type": 0,
    "message": null,
    "status": 0
}
```
