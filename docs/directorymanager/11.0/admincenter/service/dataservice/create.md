---
title: "Create a Data Service"
description: "Create a Data Service"
sidebar_position: 10
---

# Create a Data Service

You can create a Data service in native IIS, remote IIS, and Docker.

**What do you want to do?**

- [Create a Data Service in Native IIS](#create-a-data-service-in-native-iis)
- [Create a Data Service in Remote IIS](#create-a-data-service-in-remote-iis)
- [Create a Data Service in Docker](#create-a-data-service-in-docker)

## Create a Data Service in Native IIS

When you deploy a Data service in native IIS, GroupID does the following:

- It creates a directory with the Data service’s name at the following physical path on the GroupID
  server, and copies the service files from its template directory to the new service directory:  
  X:\Program Files\Imanami\GroupID 11.0\GroupIDDataService\Inetpub\  
  (X represents the GroupID installation drive)
- It also creates a virtual directory for the service in your desired IIS site.

The Data service runs within a virtual directory in IIS while the service files are physically
located on disk.

**To create a Data service:**

1. In Admin Center, click **Applications** in the left pane.
2. Click **Add Application**.
3. On the next page, select **Data Service** and click **Next step**.
4. On the **Create GroupID Application** page, make sure the **IIS** tile is selected.
5. In the **Application Name** box, enter a unique name for the service or use the default name. The
   service is displayed with this name in GroupID.
6. In the **Deployment Name** box, enter a deployment name for the service.  
   The application name and deployment name are displayed on the service card. It is as:

    ![ds_card](/img/product_docs/directorymanager/11.0/admincenter/service/dataservice/ds_card.webp)

7. In the **IIS Application Name** box, enter an IIS deployment name for the service. The name
   should be unique for each Data service deployed in IIS.  
   The IIS application name is used to name the service’s directory in IIS and its physical
   directory under X:\Program Files\Imanami\GroupID 11.0\GroupIDDataService\Inetpub\ on the GroupID
   server.  
   (X represents the GroupID installation drive)
8. In the **IIS Site** drop-down list, select a website to host the service files.  
   The list displays the websites defined on the local IIS server. GroupIDSite11 is the default
   selection.
9. In the Service Endpoints area, bind an Elasticsearch service, Replication service, and Scheduler
   service with the Data service.

    1. In the **Elasticsearch Service** drop-down list, select an Elasticsearch service to bind to
       this Data service.  
       The list displays the Elasticsearch services running in the environment. Requests sent to the
       Data service for performing a search in the Elasticsearch repository will be carried out
       through the Elasticsearch service you select here.
    2. On selecting an Elasticsearch service, the **Replication Service** drop-down list displays
       the Replication services running on the same machine as the Elasticsearch service. Select a
       Replication service to bind to this Data service.  
       When a user force runs the replication service (whether globally or for a specific identity
       store), a request is sent to the Data service, that is then passed on to the Replication
       service bound to that Data service.
    3. In the **Scheduler Service** drop-down list, select a scheduler service to bind to this Data
       service. The number of services displayed in the list depend on the number of GroupID
       clusters, as each cluster has its own Scheduler service.  
       This Data service will send requests to the selected Schedular service to trigger schedule
       runs.

10. Click **Create Application**.  
    The Data service is created and displayed on the **Data Service** tab.

## Create a Data Service in Remote IIS

You can deploy a Data service within a site in remote IIS. For this, you need to connect with the
Microsoft IIS Administration API running on the remote IIS machine.

When you create a Data service in remote IIS, GroupID does the following:

- It creates a virtual directory for the service in a preconfigured site in remote IIS.
- It creates a physical directory for the service in the folder that is mapped to this preconfigured
  site.

The Data service runs within a virtual directory in remote IIS while the service files are
physically located on disk.

To learn about the remote IIS settings and configurations before deploying a service there, see the
[Prerequisites for Deployments in Remote IIS](/docs/directorymanager/11.0/admincenter/applications/remoteiisprerequisites.md)
topic.

**To create a Data service:**

1. In Admin Center, click **Applications** in the left pane.
2. Click **Add Application**.
3. On the next page, select **Data Service** and click **Next step**.
4. On the **Create GroupID Application** page, select the **Remote IIS** tile.
5. In the **Application Name** box, enter a unique name for the Data service or use the default
   name. The Data service is displayed in GroupID with this name.
6. In the **Deployment Name** box, enter a deployment name for the service. The application name and
   deployment name are displayed on the service card.
7. To enter information for **API URL**, **Access Token**, **Username**, **Password**, **IIS
   Application Name**, and **Website**, refer to steps 7-11 in the
   [Create a Portal in Remote IIS](/docs/directorymanager/11.0/admincenter/applications/portal/create.md#create-a-portal-in-remote-iis)
   topic. Replace any reference to the portal with the Data service.
8. For entering information in the **Service Endpoints** area, follow steps 9 in the
   [Create a Data Service in Native IIS](#create-a-data-service-in-native-iis) topic.
9. Click **Create Application**.  
   The new Data service is displayed on the **Data Service** tab.

## Create a Data Service in Docker

GroupID enables you to deploy a Data service in Docker. For this, you need to connect with the API
running on a Docker deamon in your environment, so that GroupID can create a container for the
service there and run the service from within that container.

For an overview on application deployment in Docker, see the
[Prerequisites for Deployments in Docker](/docs/directorymanager/11.0/admincenter/applications/dockerprerequisites.md)
topic.

:::note
To host the Data service, Docker daemon should be configured to run Windows containers.
:::


**To create a Data service:**

1. In Admin Center, click **Applications** in the left pane.
2. Click **Add Application**.
3. On the next page, select **Data Service** and click **Next step**.
4. On the **Create GroupID Application** page, select the **Docker** tile.
5. In the **Application Name** box, enter a unique name for the Data service or use the default
   name. The Data service is displayed in GroupID with this name.
6. In the **Deployment Name** box, enter a deployment name for the service. The application name and
   deployment name are displayed on the service card.
7. To enter information for **Port**, **Service URL**, and **Container Name**, refer to steps 7-9 in
   the
   [Create a Portal in Docker](/docs/directorymanager/11.0/admincenter/applications/portal/create.md#create-a-portal-in-docker)
   topic. Replace any reference to the portal with the Data service.
8. For entering information in the **Service Endpoints** area, follow step 9 in the
   [Create a Data Service in Native IIS](#create-a-data-service-in-native-iis) topic.
9. Click **Create Application**.  
   The Data service is created and displayed on the **Data Service** tab.
