---
description: >-
  This article provides a detailed guide on how to configure a system to send syslog messages using JavaScript in response to browser events.
keywords:
  - syslog
  - JavaScript
  - Log Tracker
  - web page integration
  - CGI program
sidebar_label: Send Syslog Messages Using JavaScript
tags: []
title: How to Send Syslog Messages Using JavaScript (Log Tracker)
knowledge_article_id: kA04u0000000JUeCAM
products:
  - log-tracker
---

# How to Send Syslog Messages Using JavaScript (Log Tracker)

## Overview

This article describes how to configure a simple system to permit JavaScript to send syslog messages in response to browser events (such as page loads, button clicks, mouseovers, etc.).

## Sending Syslog Messages From A Web Page

It is not difficult to interface a web page with JavaScript to send an arbitrary syslog message to the Log Tracker Server when a page is accessed or some other JavaScript event occurs (such as clicking a button or performing a mouseover). There are several configuration steps required, as detailed in this application note.

## CorreLog Server Setup

At the Log Tracker Server, first create a CGI program that is executed whenever a particular URL is accessed. The syslog text can be passed via an HTTP `GET` request. Although there are various ways to do this, one way is to leverage the standard Log Tracker Server `system\sendlog.exe` program via a simple batch file.

The following batch file can be transcribed to the file location `s-auth\SENDLOG.bat` on the Log Tracker Server platform.

```plaintext
@echo off
echo Access-Control-Allow-Origin: *
echo Content-type: text/html
echo.
set msg="%REMOTE_ADDR% %*"
..\system\sendlog.exe 127.0.0.1 %msg%
```

The above batch file simply provides the correct headers and then executes the standard Log Tracker `sendlog.exe` program (found in the `system` folder of each Log Tracker installation), passing to the `sendlog.exe` program whatever message was passed as part of the URL. Standard Windows batch commands are used.

The location of the batch file is important: The `s-auth` directory of Log Tracker is normally used ONLY for error handling and does not require authentication to execute a CGI program. At some sites, you may need (or desire) to put an `htaccess.txt` file in that directory if limiting access to the URL is a big concern.

## Client (Web Site) Setup

At the client web site, the user should first implement JavaScript functions to "get" the URL. Although this is not a particularly difficult activity, the documentation is hard to find on the web, so specific notes on how to accomplish this are provided below.

You can create a small JavaScript library, called `sendlog.js`, by transcribing the file below to a path accessible to your URL path exactly as shown below:

```javascript
// Filename: sendlog.js
var request = makeHttpObject();
//////////////////////////////////////////////////////////////////////
function makeHttpObject()
{
    try { req = new XMLHttpRequest(); }
    catch(err1) {
        try { req = new ActiveXObject("Msxml2.XMLHTTP"); }
        catch(err2) {
            try { req = new ActiveXObject("Microsoft.XMLHTTP"); }
            catch(err3) {
                req = false;
            }
        }
    }
    return(req);
}
//////////////////////////////////////////////////////////////////////
function SendLog(message)
{
    // NOTE: Modify below to use your actual server name
    this_url = "http://logtracker-server/s-auth/sendlog.bat?";
    this_url = encodeURI(this_url + message);
    request.open("GET", this_url, false);
    request.send(null);
    return;
}
```

Note that the script MUST be configured with the hostname of the Log Tracker Server, hard coded above as `logtracker-server` in the `SendLog()` function. The user should replace `logtracker-server` in the above file with the actual name or IP address of the Log Tracker Server platform.

The above JavaScript can be cut and pasted to any URL available to the client web server. In the specific case of the Log Tracker Server, JavaScript files are normally placed in the `s-html\java` directory of the installation, but any pathname (including external URLs) can be used.

At some sites, the above JavaScript file may be found in the `s-html\java\sendlog.js` file of the Log Tracker Server installation. This can be directly copied from there to the client web server and then modified to supply the actual name of the Log Tracker Server platform in the script.

## Implementing the SendLog() JavaScript Call

As a last step, the web page should execute the `SendLog()` function contained in the `sendlog.js` file above. The `SendLog()` function is executed for any browser event, such as when the page loads.

For example, the following trivial web page will send the message: "The test page was loaded!" to the Log Tracker server whenever the page loads. The page below assumes that the `sendlog.js` script (discussed above) is found at the `/s-html/java/sendlog.js` URL, accessible to the web page.

```html
<!DOCTYPE html>
<html>
<head>
    <script src="/s-html/java/sendlog.js"></script>
</head>
<body onload="SendLog('The test page was loaded!')">
    This is a test page. A syslog message was sent.
</body>
</html>
```

With the JavaScript configured above, whenever someone accesses the page, a message "The test page was loaded!" will appear in the Log Tracker Server "Messages" tab. This message can be processed like any other syslog message collected by the Log Tracker Server. Multiple `SendLog()` JavaScript calls can be implemented in the web page, each with their specific message arguments.

## Additional Notes

1. The actual hostname of the Log Tracker Server is essential, and in the above example, the value should be set in the `sendlog.js` script example shown above. (This may be a common mistake in setting up syslog for your web page!)
2. The `SENDLOG.bat` file will operate with the Apache configuration that comes with Log Tracker Server. If you are using some other server, it may be necessary to change the server configuration or use a more proper scripting language.
3. In the `SENDLOG.bat` file, it will be essential to include the "Access-Control-Allow-Origin:" header. Otherwise, the JavaScript will fail with a "permission" error.
4. The severity of the syslog message will be the default "debug" severity, and the facility code will be the default "user" code. As configured, the syslog message will contain the remote address of the web site that accessed the URL (given by `%REMOTE_ADDR%` environmental variable). The `sendlog.exe` program execution statement, within `SENDLOG.bat`, can be modified to prefix the message, change the facility and severity, and perform other custom processing such as including additional CGI environmental variables.

This application note should be useful to web page designers looking to gather information directly from web pages and may also be useful to Java developers or engineers looking for interesting automation and monitoring capabilities.

## Related Articles

- [How to delete a device in Log Tracker](#)
- [Log Tracker - Types of Authentication](#)
- [Log Tracker Tags Facility](#)
- [How to use CloseTicket.exe to Immediately Close Log Tracker Tickets](#)
- [How to Monitor Devices with Ping Adapter (Log Tracker)](#)