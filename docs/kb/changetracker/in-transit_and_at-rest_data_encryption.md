---
description: >-
  This article provides information on the supported transport layer security (TLS) versions for in-transit data encryption and the options for at-rest data encryption in Netwrix Change Tracker.
keywords:
  - data encryption
  - TLS
  - MongoDB
sidebar_label: Data Encryption Overview
tags: []
title: In-Transit and At-Rest Data Encryption
knowledge_article_id: kA0Qk0000000YhdKAE
products:
  - change-tracker
---

# In-Transit and At-Rest Data Encryption

## Questions

1. What transport layer security (TLS) versions are supported for in-transit data encryption in Netwrix Change Tracker?
2. What options are supported for at-rest data encryption in MongoDB in Change Tracker?

## Answers

1. TLS protocol version 1.3 and earlier are supported for in-transit data encryption. It is recommended to disable non-target protocol versions in your environment to ensure the intended TLS version is used.

2. MongoDB Community Edition, which is included in the Change Tracker installation wizard, does not support at-rest data encryption. This feature is available in MongoDB Enterprise only. Learn more in [Encryption At-Rest · MongoDB ⸱ MongoDB 🡥](https://www.mongodb.com/docs/manual/core/security-encryption-at-rest/).

   > **IMPORTANT:** Data such as user accounts, passwords, and network device credentials is encrypted using the ASP.NET Core data protection API by default. This type of data is encrypted in both the Community and Enterprise editions of MongoDB.

## Related Articles

- [Encryption At-Rest · MongoDB ⸱ MongoDB 🡥](https://www.mongodb.com/docs/manual/core/security-encryption-at-rest/)