---
title: "Setup"
description: "Setup"
sidebar_position: 80
---

# Setup

This section explains how to set up your development environment to work on a  project. You will need to:

* Install .
* Use a tool to comfortably edit XML files.

This tutorial is intended to be run on Windows 10 or later.

## Code Editor to Edit XML Files

To make the XML edition experience efficient, you are going to need an editor with the following features:

* XSD validation
* Autocomplete

NETWRIX provides the `usercube-configuration.xsd` file that contains a description of the XML tags and attributes that are legit within a  configuration.

NETWRIX usually suggests using [Visual Studio Code](https://code.visualstudio.com/) with [XmlComplete extension](https://github.com/rogalmic/vscode-xml-complete).

The [XmlComplete extension](https://github.com/rogalmic/vscode-xml-complete) can be installed and configured in under a minute to get XSD validation and autocomplete.

* From Visual Studio Code, click on the **Extensions** icon:

![extensions](/static/img/product_docs/identitymanager/saas/integration-guide/)

* Search **XML Complete**.
* Click **Install**.
* Access the settings by clicking on the **Settings** icon from the **Extension** page:

  ![settings](../../../../Resources/Images/vscode_settings.png)
* Click on **Edit in settings.json**.![editinjson](../../../../Resources/Images/editinjson.png)
* Add the following entry to the `xmlComplete.schemaMapping` json element:

```

        {
            "xmlns": "urn:schemas-usercube-com:configuration",
            "xsdUri": "file:///C:/UsercubeTraining/usercube-configuration.xsd",
            "strict": true
        }

```

XML syntax errors are now listed in the **Problem** pane, and the lines with issues are highlighted.

## Sources

The sources folder contains target organization data, extracted from our sample HR solution and Active Directory.

* Download the [Sources](../../../Sources.zip).
* Copy the content into `C:/UsercubeTraining/Sources`.

## AD LDS

The tutorial uses an AD LDS to simulate an Active Directory connection.

**1. Enable ADLDS Feature**

* Go to **Control Panel** > **Programs** > **Programs and Features**.
* Click on **Turn Windows features on or off** (located on the left side panel).
* Select ***Active Directory Lightweight Directory Services*** from the **Features** list.

**2. Create a new AD LDS Instance**

* Download [InstanceAD.zip](../../../InstanceAD.zip)
* Run `Create-ad-lds-instance.ps1` from a PowerShell.

  This creates a new AD LDS instance with the entries from `C:/UsercubeTraining/Sources/ad.ldf`.

## Database

's database is a SQL Server database.

The [SQL Server Express Edition](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) is recommended for this tutorial.

**1. Install SQL Server Developer Edition**

* Download and install the [SQL Server Express Edition](https://www.microsoft.com/en-us/sql-server/sql-server-downloads).
* Perform the basic installation steps while using all default values configured in the installer.

**2. Activate TCP/IP protocol in the SQL Server engine**

By default, you can only connect to SQL Server through a shared memory link. You need to activate the TCP/IP protocol as follows:

* Open SQL Server Configuration Manager.
* In the left pane, select the node: `SQL Server Network Configuration > Protocols for MSSSQLSERVER`.
* In the main pane, right-click the `TCP/IP` protocol name to open its `Properties`.
* Select `Enable`: `Yes` and validate.
* Restart the SQL Server engine using the SQL Server Configuration Manager:
  + In the left pane, select the node: `SQL Server Services`.
  + In the main pane, right-click the running server and restart it.

**3. Install SQL Server Management Studio (SSMS)**

* To manage and explore your SQL Server database, you must download and install [SQLServer Management Studio](https://aka.ms/ssmsfullsetup). More about SSMS can be found at [SSMS homepage](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15).
* Perform the basic installation using all the default values configured in the installer.

**4. Create the `UsercubeTraining` database**

Note that if the `UsercubeTraining` database already exists, it will be dumped during the demo installation process and you will lose all your data.

if you have already created this database, skip this step and go directly to **Step 4.**[Initialize the database schema](#initializeDBschema).

In SSMS, connect to your SQL Server engine:

* Server name: leave the default value which is your computer's name.
* Authentication: `Windows Authentication`.

Note that you don't need a password to connect to your local database. SQL Server will use your current Windows session to authenticate to SQL Server.

In SSMS Object explorer (left pane):

* Right-click the `Databases` node and select `New Database`.
* Set the value `UsercubeTraining` in the `Database name` field.
* Leave all other values to their defaults and click `OK`.

**[5. Initialize the database schema](initializeDBschema)**

* Go to [Netwrix Portal](https://www.netwrix.com/sign_in.html?rf=my_products.html "Netwrix Portal").
* Download the latest `Database Schema` script from an SDK artifact.
* Run the `Usercube.sql` script from SSMS.

## Runtime

* Download the latest *Server and Agent* runtime from the [go on [Netwrix Portal](https://www.netwrix.com/sign_in.html?rf=my_products.html "Netwrix Portal")](https://extranet.usercube.com).
* Extract the content of the `Runtime` folder to `C:/UsercubeTraining/Runtime`.

## Import the Bootstrap Configuration

The application configuration is a set of XML files that customize  for the target organization. This is where most of our efforts will be directed to during the tutorial.

* Download the [bootstrap configuration](../../../ConfBase.zip) to `C:/UsercubeTraining/Conf`.
* Open a PowerShell console from the runtime `directory`.
* Import the starting configuration using the [IdentityManager-Deploy-Configuration tool](../../../integration-guide/toolkit/xml-configuration/jobs/tasks/server/deployconfigurationtask/index.html) command.

  ```

  ./Usercube-Deploy-Configuration.exe --database-connection-string "data source=.;Database=Usercube;Integrated Security=SSPI;Min Pool Size=10;encrypt=false;" --configuration-directory "C:/UsercubeTraining/Conf"

  ```

This is an essential command since it has to be executed every time you want to see the configuration changes in . Keep it somewhere handy for the rest of the tutorial.

## Login

* Launch  Server from the `Runtime` folder, via PowerShell:

```
./Usercube-Server.exe
```

* Open a browser with the address `http://localhost:5000`.
* Login: `Admin`
* Password: `secret`