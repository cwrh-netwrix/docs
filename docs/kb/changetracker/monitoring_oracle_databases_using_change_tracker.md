---
description: >-
  This article provides detailed instructions on how to monitor an Oracle Database using Netwrix Change Tracker, including necessary configurations and credential setups.
keywords:
  - Oracle Database
  - Change Tracker
  - monitoring
sidebar_label: Monitor Oracle Databases
tags: []
title: Monitoring Oracle Databases Using Change Tracker
knowledge_article_id: kA04u0000000JehCAE
products:
  - activity-monitor
---

# Monitoring Oracle Databases Using Change Tracker

## Overview

Are you looking to monitor an Oracle Database using Netwrix Change Tracker? Do you require assistance with configuring that monitoring? This article provides the necessary information to set up monitoring for your Oracle Database. If you need further assistance, please contact support via the web.

## Required Information

To monitor a database successfully, you will need to obtain the following key pieces of information:

- **Server**: *This is the IP address of the server hosting the Oracle Database.*
- **Database name**: *This is the name/SID of the database that you want to monitor.*
- **Port**: *The port on which the database is listening for connections. The default port is normally 1521, but if this does not work, you can find the port in the database's `listener.ora` file.*
- **User Id**: *This is the username that Change Tracker will use to authenticate with the Oracle Database. This user will need a specific set of roles assigned to it, which are listed in the following sections.*
- **Password**: *This is the password for the User Id you have specified.*

## Obtaining Database Name

To obtain the name of the database you wish to monitor, you will need to run a query against your Oracle database. This can be done using an application like Oracle SQL Developer or through the server itself using `sqlplus` and the command line. An example of this can be seen below:

Using Oracle SQL Developer, you can run a query called:

```sql
SELECT * FROM global_name;
```

OR 

```sql
SELECT name FROM v$database;
```

The results of the query will show the name(s) of the database that you can monitor.

![Database Query Example](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK5n&d=%2Fa%2F4u000000Lzu2%2FdQZvmPuz9jyM7NL6lwZXAn_uxhdjGLbr.HQAqm3LG.M&asPdf=false)

## Identifying SID Value

You will also need to identify an SID value. This is normally the same as the database name, but you can find this value, along with the port the database is using, by looking at the following file:

**`/SERVER-NAME/app/oracle/product/VERSION-NUMBER/DATABASE-NAME/network/admin/listener.ora`**

Example:

```bash
# cat /OracleSRV/app/oracle/product/11.2.0/xe/network/admin/listener.ora
```

The contents may look like this:

```
# listener.ora Network Configuration File:
SID_LIST_LISTENER =
(SID_LIST =
  (SID_DESC =
    (SID_NAME = xe)
    (ORACLE_HOME = /u01/app/oracle/product/11.2.0/xe)
    (PROGRAM = extproc)
  )
)
LISTENER =
(DESCRIPTION_LIST =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC_FOR_XE))
    (ADDRESS = (PROTOCOL = TCP)(HOST = localhost.localdomain)(PORT = 1521))
  )
)
DEFAULT_SERVICE_LISTENER = (XE)
```

You can also identify the `SID_Name` by running the following command:

```bash
[oracle@my-oracle-db ~]$ env | grep ORA
ORACLE_SID=oradb
ORACLE_BASE=/u01/app/oracle
ORACLE_HOME=/u01/app/oracle/product/19.0.0/db_1
```

## Creating a Database Account

You will also need to create an account for the database(s) being monitored. The account(s) require enough privileges to access the information that we are querying. This level of privilege can be adjusted depending on the monitoring requirement. For example, the privileges for the below `c##nnt` account have been used within previous engagements to monitor databases successfully:

```sql
CREATE USER c##nnt IDENTIFIED BY password;
GRANT SELECT_CATALOG_ROLE TO c##nnt;
GRANT SELECT ANY TABLE TO c##nnt;
GRANT EXECUTE ANY PROCEDURE TO c##nnt;
GRANT CREATE ANY TRIGGER TO c##nnt;
ALTER USER c##nnt DEFAULT ROLE ALL;
GRANT SELECT ON DBA_USERS_WITH_DEFPWD TO c##nnt;
GRANT CONNECT TO c##nnt;
GRANT CONNECT, RESOURCE, DBA TO c##nnt;
GRANT UNLIMITED TABLESPACE TO c##nnt;
GRANT CREATE SESSION TO c##nnt WITH ADMIN OPTION;
```

## Creating Change Tracker Credential String

Once you have obtained all of the above, you will be able to create a **"Change Tracker Credential String"**, which is what Change Tracker will use to connect to and authenticate with the database. An example credentials string can be found below:

```
Server=192.168.1.85;Port=1521;User Id=c##nnt;Password=password;Direct=True;
```

The connection string will need to be entered into the following section on the Change Tracker web console:

**Settings > Credentials > Database Credentials > Add Database Credential**

In the pop-up menu that appears, enter the following:

- **Credential Name**: XE (This is personal preference)
- **Database Platform**: Oracle
- **Connection String**: Copy in your string (as shown in the example above)

![Add Database Credential](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdKbR&d=%2Fa%2F4u000000M07d%2FLXNrQEq8fsaOLF3KpyeF_M.FEVo.Vvtkr8nA9Tc5eR4&asPdf=false)

Press **Update**.

## Configuring Database Groups

Once you have created a credential string, navigate to **Settings > Groups > Select "All Devices"** and click **Add** to create a **"Databases"** group and the type of database group underneath in order to configure the compliance reporting later.

![Create Database Group](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdJnk&d=%2Fa%2F4u000000M04f%2FpwkFjKeuHiR3xVherZymMV5F3__t.wsEnD7TzxSicNQ&asPdf=false)

## Creating Change Tracker Proxied Device

Next, you will need to create a **"Change Tracker Proxied Device."** Specify the name of the database that you want to monitor on the Oracle server. The proxied device will need to be configured in the following section of the Change Tracker web console:

**Settings > Agents & Devices > Highlight a device that will be able to communicate with the database over the network (default port is 1521) > Select the Add Proxied Device button**

In the pop-up menu that appears, enter the following:

- **Name**: XE (This is the display name of the database and how it will be presented on Change Tracker)
- **Host/Database Name**: XE (This is the name of the database/its SID name)
- **Device Type**: Database
- **Operating System**: Oracle (This is personal preference)
- **Credentials**: XE (This will need to match up with the name of the credentials you created previously)
- **Groups**: OracleDB (This is personal preference - there is not an out-of-the-box group in Change Tracker which covers Oracle databases, so you may need to create your own)
- **Online Detection**: None/Auto (If set to **None**, Change Tracker will automatically assume the device is online and will attempt to communicate with it. If set to **Auto**, Change Tracker will attempt to ping the device and will wait for a response before showing the device as online - **I would advise setting this option to None**)
- **Diagnostic Mode**: Yes/No (If enabled, there will be more verbose logging available on the Change Tracker web console surrounding this device which will aid with troubleshooting any issues - **I would advise enabling this option**)

![Configure Proxied Device](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK3s&d=%2Fa%2F4u000000M04k%2Fjcn0YMh9rKM4VWmWktuoxIGMS7.O.j4xkiyJPC_UtFk&asPdf=false)

## Validating Credentials

Once you have configured the Proxy, you can run a test report to validate the credentials by navigating to **Reports > Actions > Add a Compliance Report**. You can skip the naming screen and go to **Query Settings**. Once in Query Settings, choose the name of the group you created earlier that you will assign the database to during the proxy device configuration, and then choose the **Database Credential Test**. Hit **Update Report Title** so that the title gets updated with the group name and the report name, and hit **Update**. Then run the report to see if it successfully connects:

![Test Report](https://nwxcorp--c.na147.content.force.com/sfc/dist/version/download/?oid=00D7000000091pB&ids=0684u00000LdK9l&d=%2Fa%2F4u000000M075%2FxWLVCDNnfU0lUkcvjSjnlSrwy0kB4R0XuoebyGMf6dQ&asPdf=false)

## Running Compliance Reports

Once the above has been configured, you can run an **"NNT Change Tracker Compliance Report"** against your database(s) to keep track of data such as:

- **Number of tables within a database**
- **Names of tables within a database**
- **Number of columns within a specified table**
- **Names of columns within a specified table**

At this stage, I would advise that you contact the **support team** for assistance, as we can help you put together an **"NNT Change Tracker Compliance Report"** that will meet your requirements and work for the database you are looking to monitor.

## Troubleshooting Error Messages

If, after the NNT Support Team has provided you with a compliance report, you receive error messages when trying to run it against your database, some of the following error messages and descriptions may help you diagnose the issue. Alternatively, if the error message you are receiving is not listed below, please use this [link](https://docs.oracle.com/cd/B19306_01/server.102/b14219.pdf) for a full list of error messages provided by Oracle.

- **ORA-12541: TNS:no listener**  
  **Cause**: The connection request could not be completed because the listener is not running.  
  **Action**: Ensure that the supplied destination address matches one of the addresses used by the listener - compare the `TNSNAMES.ORA` entry with the appropriate `LISTENER.ORA` file (or `TNSNAV.ORA` if the connection is to go by way of an Interchange). Start the listener on the remote machine.

- **ORA-12543: TNS:destination host unreachable**  
  **Cause**: Contact cannot be made with the remote party.  
  **Action**: Make sure the network driver is functioning and the network is up.

- **ORA-12531: TNS:cannot allocate memory**  
  **Cause**: Sufficient memory could not be allocated to perform the desired activity.  
  **Action**: Either free some resource for TNS, or add more memory to the machine. For further details, turn on tracing and reexecute the operation.

## Additional Support

If you require more information or assistance with the setup of your Oracle Database, please contact the **support team**.