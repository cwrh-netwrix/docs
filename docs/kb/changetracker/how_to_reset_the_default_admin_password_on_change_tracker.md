---
description: >-
  This article provides step-by-step instructions on how to reset the default admin password on Change Tracker for both CentOS and Windows-based hubs.
keywords:
  - Change Tracker
  - reset admin password
  - CentOS
  - Windows
  - instructions
sidebar_label: Reset Admin Password
tags: []
title: How to Reset the Default Admin Password on Change Tracker
knowledge_article_id: kA04u0000000JVfCAM
products:
  - change-tracker
---

# How to Reset the Default Admin Password on Change Tracker

## Overview

This article provides instructions for resetting the default admin password on Change Tracker for both CentOS and Windows-based hubs.

## CentOS Based Hub

From a command line interface on the CentOS host itself, enter the following command:

```bash
$ wget --no-check-certificate -qO- https://localhost/api/resetadminpassword
```

![Reset Password Command on CentOS](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKGn&d=%2Fa%2F4u000000LzhH%2FISZWH6YJgT8_Ejr.99XEyBiy46Xs7GcyvCHUVeKM4oE&asPdf=false)

> **NOTE:** This will write the reset password to a file called `resetpassword` or `resetpassword.x` if multiple resets have been attempted. The file will be in the directory from which the `wget` command was run.

## Windows Based Hub

Using the browser on the Windows Hub machine itself, enter the following into the address bar:

```plaintext
https://localhost/api/resetadminpassword
```

![Reset Password Command on Windows](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJu5&d=%2Fa%2F4u000000LzmB%2FRYN0ulaRFm9giTP5HgKHdQ1G_wGxiljXRHDPGGifhdw&asPdf=false)

> **NOTE:** The password displayed will be your new password. At the next logon to the Change Tracker Gen 7 web GUI, you will be able to log in using the reset password but will also be prompted to change the password to one of your choice. If you are not prompted to change your password, follow the instructions below.

## If You Were Not Prompted to Change Your Password

Sometimes you will not be prompted to change your password. To manually change it, log in using your new password and proceed by going to the **Settings Tile**.

Once on the **Settings** page, click on **Users** in the left navigation panel. This should bring up the User Administration page on your screen. To reset the password, click on the blue paperclip next to the account name you want to reset (in this case, it would be **admin**).

![User Administration Page](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKGs&d=%2Fa%2F4u000000LzjS%2Fs4cq8YhoCdU1LTRNBJAf2fdjyz5a_7zmrWgHf5z8HVA&asPdf=false)

> **NOTE:** Upon clicking the blue paperclip, you will be prompted to type a new password and confirm this password. Once you have done this, click **Apply** - your new password should be immediately available for use.

## Related Articles

- [How to move your Linux Server MongoDB Database to a Windows server?](https://kb.netwrix.com/8283)
- [Vulnerability Tracker - How to Change a Task's Status through the GSM Database](https://kb.netwrix.com/8311)
- [How to Change the Admin Password of your Mongo Database](https://kb.netwrix.com/8310)
- [Supporting Documents for Hub Server Problems](https://kb.netwrix.com/8273)
- [Change Tracker Gen 7 Change Log / Update Log / ReadMe.txt Documents for Agent/Hub](https://kb.netwrix.com/8368)

**Attachments:**
- [image2017-6-29_11-31-20.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK6A&d=%2Fa%2F4u000000Lzhb%2Fniz1skuAd7H.LB1hBgjV.WOtKCDhLa5Y8AOAD2zJAXI&asPdf=false)
- [image2017-6-29_11-26-17.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKBH&d=%2Fa%2F4u000000LzmL%2F3okMzzSi3HyBUnFMoax3ENeao18ZvkjKbdkQAKD7XDs&asPdf=false)
- [image2017-6-29_11-24-22.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJzf&d=%2Fa%2F4u000000Lzio%2Fljg.9Dv14nMe_14_vt04P.RYK6bUlSXu_kM5uT9mM_M&asPdf=false)
- [image2017-6-29_11-19-18.png](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKH2&d=%2Fa%2F4u000000LzT2%2F7rtH21NHCLDm860l3rBdSI2Izd4uOJvWN3OoXqJXB.0&asPdf=false)