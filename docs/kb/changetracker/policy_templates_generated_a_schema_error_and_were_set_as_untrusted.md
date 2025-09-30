---
description: >-
  This article addresses the issue of policy templates being set as untrusted after an upgrade, along with steps to resolve the schema error encountered during policy duplication.
keywords:
  - schema error
  - policy templates
  - Change Tracker
sidebar_label: Policy Templates Schema Error
tags: []
title: Policy Templates Generated a Schema Error and Were Set as Untrusted
knowledge_article_id: kA0Qk0000000MyDKAU
products:
  - change-tracker
---

# Policy Templates Generated a Schema Error and Were Set as Untrusted

## Symptom

After an upgrade, some policies under **Settings** → **Policy Templates** were set as *untrusted*. When trying to duplicate the policy and remove the old one, the following error appears:

```
File: [policy name] fails schema validation: Error: The element 'UsageTags' in namespace '
```

## Cause

This is a common issue after upgrading the Change Tracker application from v7.2 to v7.3 or higher.

## Resolution

Follow the steps below to resolve the issue:

1. Remove any **Compliance Reports** which had been added. For that, navigate to **Settings** → **Groups** → **Templates**. These are noticeable as they typically contain *Benchmark* within the template name.
2. Once removed, navigate to `C:\Program Files\NNT Change Tracker Suite\Gen7\Maintenance\` and run the **NNT.Hub.Service.Maintenance.App.exe** file that launches the maintenance application.
3. Use the `U` option in the maintenance app to verify all compliance templates.

This will resolve the **Schema Error** tag and set the templates to *Trusted*.