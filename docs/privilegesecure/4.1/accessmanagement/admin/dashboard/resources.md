# Resources Dashboard

The Resources dashboard shows information for onboarded resources, such as active and scheduled
sessions, policies, and service accounts for the host resources and domain resources that have been
added to the console. The Resources dashboard displays the same information as the
[Resources Page](/docs/privilegesecure/4.1/accessmanagement/admin/policy/page/resources.md).

![Resources Dashboard Page](/img/product_docs/privilegesecure/4.1/accessmanagement/admin/dashboard/resources.webp)

The Resources table has the following features:

- Add — Opens a list of available resources to add. The Add list contains the following options:

    - New Server — Opens the Add Resources window to onboard new servers. See the
      [Add Resources Window](/docs/privilegesecure/4.1/accessmanagement/admin/policy/window/resources/addresourcesonboard.md)
      topic for additional information.
    - New Domain — Opens the Domain Details page for a new domain. See the
      [Add New Domain](/docs/privilegesecure/4.1/accessmanagement/admin/policy/add/domain.md)
      topic for additional information.
    - New Website — Opens the Website Details page for a new website. See the
      [Add New Website](/docs/privilegesecure/4.1/accessmanagement/admin/policy/add/website.md)
      topic for additional information.
    - New Microsoft Entra ID Tenant — Opens the Microsoft Entra ID Tenant Details page for a new
      tenant. See the
      [Add New Microsoft Entra ID Tenant](/docs/privilegesecure/4.1/accessmanagement/admin/policy/add/entraidtenant.md)
      topic for additional information.
    - New Secret Vault — Opens the Secret Vault Details page for a new vault. See the
      [Add Secret Vault](/docs/privilegesecure/4.1/accessmanagement/admin/policy/add/secretvault.md)
      topic for additional information.
    - New Database — Opens the Databse Details page for a new database. See the
      [Add New Database](/docs/privilegesecure/4.1/accessmanagement/admin/policy/add/database.md)topic
      for additional information.

- Remove — Removes the selected resource from being managed by the application. A confirmation
  window will display.
- Change Platform — Opens the Change Platform window to modify the type of platform for the selected
  host resource. See the
  [Change Platform Window](/docs/privilegesecure/4.1/accessmanagement/admin/policy/window/resources/changeplatform.md)
  topic for additional information.
- Change Service Account — Opens the Change Service Account window to modify the service account
  associated with the selected host resource. See the
  [Change Service Account Window](/docs/privilegesecure/4.1/accessmanagement/admin/policy/window/resources/changeserviceaccount.md)
  topic for additional information.
- Scan Resource — Scans a host resource for local users, groups, windows services, and scheduled
  tasks. A confirmation window will display.
- Search — Searches the table or list for matches to the search string. When matches are found, the
  table or list is filtered to the matching results.
- Filter — Provides options to filter results based on a chosen criterion:

    - Type— Filter by the type of resource: All, Host, Domain, Website, Azure AD, Secret Vault, or
      Database. The drop-down menu the definition for each Type icon used in the table.

- Refresh — Reload the information displayed

The table has the following columns:

- Checkbox — Check to select one or more items
- Type — Icon indicates the type of object
- Resource — Displays the name of the resource. Click the link to view additional details. The
  details vary based on the type of resource.

    - [Host Details Page](/docs/privilegesecure/4.1/accessmanagement/admin/policy/page/details/host.md)
    - [Domain Details Page](/docs/privilegesecure/4.1/accessmanagement/admin/policy/page/details/domain.md)
    - [Website Details Page](/docs/privilegesecure/4.1/accessmanagement/admin/policy/page/details/website.md)
    - [Microsoft Entra ID Details Page](/docs/privilegesecure/4.1/accessmanagement/admin/policy/page/details/entraid.md)
    - [Secret Vault Details Page](/docs/privilegesecure/4.1/accessmanagement/admin/policy/page/details/secretvault.md)
    - [Database Details Page](/docs/privilegesecure/4.1/accessmanagement/admin/policy/page/details/databases.md)

- Operating System — Displays the operating system of the resource
- Active — Displays the number of active sessions on the resource
- Scheduled — Displays the number of sessions scheduled for the resource
- Access Policies — Displays the number of access policies associated with the resource
- Protection Policies — Displays the number of protection policies associated with the resource
- DNS Host Name — Displays the DNS host name for a host resource or the FQDN for a domain resource
- IP Address — Displays the IP address for the resource
- Domain — Displays the domain name for the resource. Click the link to view additional details. See
  the
  [Domain Details Page](/docs/privilegesecure/4.1/accessmanagement/admin/policy/page/details/domain.md)
  topic for additional information.
- Service Account — Displays the service account associated with the resource. Click the link to
  view additional details. See the
  [Service Accounts Page](/docs/privilegesecure/4.1/accessmanagement/admin/configuration/page/serviceaccounts.md)
  topic for additional information.
- Platform — Displays the type of platform, which defines the resource. See the
  [Platforms Page](/docs/privilegesecure/4.1/accessmanagement/admin/policy/page/platforms/overview.md)
  topic for additional information.
- Last Scanned — Date timestamp for the last time the resource was scanned

The table columns can be resized and sorted in ascending or descending order.
