---
description: >-
  This article provides step-by-step instructions on how to add an SSL certificate to a Linux Change Tracker, including stopping services, copying certificate files, and configuring Nginx.
keywords:
  - SSL certificate
  - Linux Change Tracker
  - Nginx configuration
sidebar_label: Add SSL Certificate to Linux Change Tracker
tags: []
title: How to Add an SSL Certificate to a Linux Change Tracker
knowledge_article_id: kA04u0000000JWiCAM
products:
  - change-tracker
---

# How to Add an SSL Certificate to a Linux Change Tracker

## Overview

This article provides detailed instructions on adding an SSL certificate to a Linux Change Tracker. It covers stopping services, copying the certificate files, and updating the Nginx configuration.

## Instructions

### Stop Services

```bash
# service nnthubservice stop
# service nginx stop
```

### Copy Custom .crt and .key to Server Hosting Change Tracker

Files need to be stored in **/etc/nginx/nnt_ssl**.

My Example:

- **changetracker.demo.crt**
- **changetracker.demo.key**

### Change Nginx Config to Use Custom Cert

```bash
# vi /etc/nginx/conf.d/nnt.conf
```

```nginx
server {
#       listen 80;
        listen 443 ssl;
        root /usr/share/nginx/V7_UI;
        index index.html;
        ssl_certificate /etc/nginx/nnt_ssl/changetracker.demo.crt;
        ssl_certificate_key /etc/nginx/nnt_ssl/changetracker.demo.key;
        location /api/ {
                fastcgi_pass 127.0.0.1:9000;
                include /etc/nginx/nnt_fastcgi_params;
                fastcgi_read_timeout 120s;
        }
}
```

```bash
# !wq
```

### Start Services

```bash
# service nginx start
# service nnthubservice start
```

### Agents Then Fail to Connect to the Server Because They Don't Like the Cert

```
ERROR DesktopServerCertificateValidation - Certificate thumbprint does not match trusted (BAD1067FBAB59CCED21786657C672F6AB5BE824C/6F7F11707C0C93CD0F7E92D5BC0F1C9345D68A64). Consider setting Thumbprint in HubDetails.xml. Server certificate details:
[Version]
```

### Add Custom Thumbprint to HubDetails.xml, Restart Agent Service and the Agent Registers Successfully

![Dialog box for adding custom thumbprint in HubDetails.xml](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKJr&d=%2Fa%2F4u000000Lzkc%2FX0i12CG7kf_.dPDWY4a7PXYeceTu8w_nwUdvvhVk1nw&asPdf=false)