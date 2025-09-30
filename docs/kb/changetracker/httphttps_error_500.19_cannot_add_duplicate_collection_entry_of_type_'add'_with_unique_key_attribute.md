---
description: >-
  This article provides a step-by-step guide to resolve the HTTP/HTTPS Error 500.19 caused by a duplicate collection entry for 'X-Frame-Options' in the web config file.
keywords:
  - HTTP Error 500.19
  - X-Frame-Options
  - Change Tracker
sidebar_label: Resolve HTTP Error 500.19
tags: []
title: HTTP/HTTPS Error 500.19: Cannot Add Duplicate Collection Entry of Type 'add' with Unique Key Attribute 'name' Set to 'X-Frame-Options'
knowledge_article_id: kA04u0000000JSSCA2
products:
  - change-tracker
---

# HTTP/HTTPS Error 500.19: Cannot Add Duplicate Collection Entry of Type 'add' with Unique Key Attribute 'name' Set to 'X-Frame-Options'

## Problem and Cause

This error occurs when upgrading Change Tracker to the latest version from a much older version. The `X-Frame-Options` collection entry has a duplicate in another location and needs to be removed from the web config file to avoid IIS conflicts. The following information will show you how to do this.

![Web Config Example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJtw&d=%2Fa%2F4u000000LzaH%2FRF0mplYeBQ81UJ4Xlr70gUkmdFFeFBTSQ2mwDviS_rE&asPdf=false)

## Resolution

1. Open IIS and stop the **IIS Server**.
2. Navigate to `C:\inetpub\wwwroot\Change Tracker Generation 7 WebUI\html\`.
3. Edit the **Web.Config** file using Notepad and look for the **X-Frame-Options** entry.

   ![Edit Web.Config](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKFq&d=%2Fa%2F4u000000Lzol%2F0szvvftEwMvs6CQuXMzyQ8SyyaLj1FTWBcWHrwSEeGM&asPdf=false)

4. We want to comment this out to remove the duplication. To do this, add the following characters (in red):

   ![Comment Out X-Frame-Options](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKCX&d=%2Fa%2F4u000000LzP9%2F.V9M_6VlPGy.lRLc5aC4ukHBImEf3pKxaosWb3S6zXg&asPdf=false)

5. Save the changes.

   > **NOTE:** You may have to save this to the desktop and then copy and paste it back into the directory above, replacing the old file.

6. Once you have done this, start **IIS** and visit your Change Tracker Console page. You should now be able to log in.

![Change Tracker Console](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJsB&d=%2Fa%2F4u000000LzkM%2Fbf6mXzMjnmVYxwKBjbH_eay.UxAD6HLjU0MtJOSpHDE&asPdf=false)

### Related Articles

- [How to Backup / Restore / Move your MongoDB Database](https://kb.netwrix.com/8150)
- [How to Move Your Linux Server MongoDB Database to a Windows Server?](https://kb.netwrix.com/8283)
- [How to Change the Admin Password of Your Mongo Database](https://kb.netwrix.com/8310)
- [Supporting Documents for Hub Server Problems](https://kb.netwrix.com/8273)