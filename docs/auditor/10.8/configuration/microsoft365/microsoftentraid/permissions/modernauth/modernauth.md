---
title: "Using Modern Authentication with Microsoft Entra ID"
description: "Using Modern Authentication with Microsoft Entra ID"
sidebar_position: 20
---

# Using Modern Authentication with Microsoft Entra ID

This option is recommended for organizations that use modern authentication as the identity
management approach, having multi-factor authentication (MFA) enabled for their user accounts. In
this scenario, Auditor will access the cloud-based infrastructure via Microsoft Graph and other
modern APIs, being authenticated through a pre-configured Microsoft Entra ID application with
appropriate access permissions.

If you plan to implement this scenario, you should register an Microsoft Entra ID app manually and
provide its settings to Auditor when configuring a monitored item.

## Configuring Microsoft Entra ID App for Auditing Microsoft Entra ID

Follow the steps to use a data collecting account with modern authentication.

**Step 1 –** Create and Register a New App in Microsoft Entra ID app that will be used for modern
authentication. See the Create and Register a New App in Microsoft Entra ID section for additional
information.

**Step 2 –** Grant required permissions to that application using Microsoft Entra ID app manifest.
See the Grant Required Permissions section for additional information.

**Step 3 –** Configure client secret for that application. See the Configure Client Secret topic for
additional information.

**Step 4 –** Obtain tenant ID – you will need it when configuring a monitored item (Office 365
tenant) settings. See the Obtain Tenant Name section for additional information.

### Create and Register a New App in Microsoft Entra ID

You will need to create a dedicated app for each cloud-based data source you plan to audit:

- Microsoft Entra ID (formerly Azure AD)
- Exchange Online
- SharePoint Online
- MS Teams

If you plan to audit all of them, you need to create 4 apps.

Follow the steps to register a new Microsoft Entra ID application.

**Step 1 –** Sign into the **Microsoft 365 Admin Center** with your _Global Administrator_,
_Application Administrator_ or _Cloud Application Administrator_ account and go to the **Microsoft
Entra ID admin center**.

**Step 2 –** Under the App registrations section, select **New registration**.

**Step 3 –** In the Name field, enter the application name.

**Step 4 –** In the Supported account types select who can use this application – use the **Accounts
in this organizational directory only** option.

**Step 5 –** Click the **Register** button. Application **Redirect URI** is optional, you can leave
it blank.

**Step 6 –** Your Application (client) ID is now available in the Overview section. Copy it to a
safe location.

See the following Microsoft article for additional information on how to create an application and
service principal using Microsoft Entra ID Admin portal:
[Create an Microsoft Entra ID application and service principal that can access resources](https://learn.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal).

### Grant Required Permissions

You need to grant your new application the required API permissions. Microsoft Entra ID applications
can be assigned _Delegated_ or _Application_ permissions:

- _Delegated_ permissions require a signed-in user present who consents to the permissions every
  time an API call is sent.
- _Application_ permissions are consented by an administrator once granted.

For the newly created app, you should use the _Application_ permissions.

To grant required permissions, assign granular _Application_ permissions required for Netwrix
Auditor to collect data from the application. To do so, perform the following steps:

**Step 1 –** Go to the **App registrations** and open the app you created to assign Auditor
permissions.

**Step 2 –** Go to **Manage > API permissions** and click **Add a permission** button.

**Step 3 –** Assign the required permissions.

Permission assignment will depend on the data you plan to collect:

- Activity data only
- Both activity and state-in-time data

| Requirement                                                                                                                                                                                                  | Comment                                                                                                                                                     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Microsoft Entra ID app requires the following **Application** permissions: 1. **Microsoft Graph** - **Directory.Read.All** - **AuditLog.Read.All** 2. **Office 365 Management APIs** - **ActivityFeed.Read** | To learn how to assign required permissions, see the Configuring Microsoft Entra ID App for Auditing Microsoft Entra ID section for additional information. |

**NOTE:** You can also assign application permissions by editing Microsoft Entra app manifest. See
the Using Modern Authentication with Microsoft Entra ID topic for additional information on how to
assign the required permissions. Information about manifest is also described in the following
Microsoft
article: [ Microsoft Entra app manifest](https://learn.microsoft.com/en-us/azure/active-directory/develop/reference-app-manifest).

### Grant Admin Consent to a Tenant

Go back to the **Microsoft Entra ID admin center** > **Applications** > **App registrations** >
**API permissions** and click **Grant admin consent for** *`<tenant name>`*. When prompted to
confirm, click **Yes**.

**NOTE:** For Office 365 permissions, go to **Request API Permissions** > **APIs my organization
users** and type "Office 365" in the search bar.

See the following Microsoft article for additional information on how to create an application and
service principal using Microsoft Entra ID Admin portal:
[Create an Microsoft Entra application and service principal that can access resources](https://learn.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal).

### Configure Client Secret

Follow the steps to create a new client secret to be used by the app.

**Step 1 –** Go to **Manage** > **Certificates & secrets** and click **New client secret**.

**Step 2 –** Enter the description. From the expiration options select **24 months**.

**Step 3 –** Click **Add**.

**Step 4 –** The new secret will be displayed in the list. Click **Copy to clipboard** icon on the
"Value" parameter on the right side of the screen.

See the following Microsoft article for more information on how to add a client secret:
[Add a client secret](https://learn.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app#add-a-client-secret).

### Add Microsoft Entra ID monitoring plan

Follow the steps to add Microsoft Entra ID monitoring plan in the Netwrix Auditor.

**Step 1 –** In the Monitoring Plans, click **Add Plan** button.

**Step 2 –** Create a monitoring plan with the Microsoft Entra ID data source.

**Step 3 –** Add the Office 365 tenant item.

**Step 4 –** Click **Select**.

**Step 5 –** Enter your **tenant name**.

**Step 6 –** Choose modern authentication.

**Step 7 –** Enter the **Application ID** and **Application secret** you have created before.

**Step 8 –** Click **Add**.

Microsoft Entra ID monitoring plan has been added to Auditor and initial data collection has begun.

### Obtain Tenant Name

Follow the steps to obtain the tenant name.

**Step 1 –** Navigate to **Microsoft Entra ID** > **Overview**.

**Step 2 –** In the Tenant Information menu, locate the **Primary domain** field and copy its value.

**Step 3 –** Store the tenant to a safe location.
