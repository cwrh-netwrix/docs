---
title: "Set Up Data Tracking"
description: "Set Up Data Tracking"
sidebar_position: 100
---

# Set Up Data Tracking

Data tracking is used for Salesforce CPQ and any sensitive data fields you want to track. Setting up
data tracking enables Platform Governance for Salesforce to track data and create change logs for
any data changes.

:::note
If you track an object, all changes to the object and fields are tracked. Consult with your security
and audit teams to develop a list of objects before enabling data tracking.
:::

## Prerequisites

Here are the requirements to set up data tracking:

1. Enterprise Compliance license
2. Access to the Configuration app. You must have the **Strongpoint Administrator** and
   **Strongpoint Grant Permissions** assignments to access the app. This access is set through:
   **Setup** > **Users** > **Permission Sets** > **Strongpoint Administrator** > **Manage
   Assignments**

    ![You must have these permissions to open the Configuration tool](/images/platgovsalesforce/change_management/strongpoint_permissions.webp)

## Add Objects to Track

1. Open the Salesforce App Launcher.
2. Click **View All** to expand the app list.
3. Select **Strongpoint Configuration**. The **Recommended Objects** list is displayed.

    ![Review the recommended objects for data tracking](/images/platgovsalesforce/change_management/data_tracking_recommended.webp)

4. Click the checkbox to select each **Recommended Object** to track.
5. Set the **Tracking** for each selected Object:

    - **Not Tracked**: Changes in data records are not tracked.
    - **Tracked, Blocking**: Changes in data records are blocked if there is not an approved Change
      Request.
    - **Tracked, Non-Blocking**: Changes in data records are logged. The Change Logs show the change
      as non-compliant if there is not an approved Change Request.

6. Set the **Update Only** for each selected Object:

    - **No**: Tracks changes to existing and new records.
    - **Yes**: Tracks changes to existing records but does not apply to new records.

7. Click **Apply Recommendations**.
8. Click **Save All Records** if you do not need any additional objects, otherwise continue these
   steps.
9. Click **Show Additional Objects for Tracking (Advanced)**. The Additional Objects list is
   displayed.
10. Click the checkbox to select each **Additional Object** to track. You can search for objects, or
    use the navigation at the bottom of the form to page through the records.
11. Set the **Tracking** and **Update Only** values for each additional selected object.
12. Click **Apply Recommendations**.
13. Click **Save All Records**.
14. Wait until the **Deployment Status** is complete, then click **Done**.

    ![Wait for the Deployment Status to complete](/images/platgovsalesforce/change_management/data_tracking_deployment.webp)

15. Open the App Launcher and return to the **Strongpoint Lightning** app.

## Select Customizations to Track

1. Open **Customizations**.
2. Enter **CustomField** in the **Search** box.

    ![Open CustomField Tracking](/images/platgovsalesforce/change_management/data_tracking_customfield.webp)

3. Select **CustomField Tracking**.
4. Select a customization and edit the Data Change Tracking field.

    ![Edit the Data Change Tracking](/images/platgovsalesforce/change_management/data_tracking_customfield3.webp)

5. Click **Save** at the bottom of the form to save your changes.

## Add Tracked Objects to a Policy

Adding a tracked object to a specific policy facilitates tracking. For example, you can create a
report based on changes of that policy. In your Change Enablement process, you can set a change
level for tracked components by adding them to a specific policy.

1. Open **Change / Approval Policies**. Change the view to **All Policies** instead of **Recently
   Viewed**.
2. Select a policy to track the object.
3. Open the **Related** tab.
4. Click **Add Customizations**.
5. Enter **(Data Records** in the Search Customization box.

    ![Select the customizations](/images/platgovnetsuite/change_management/policy_add_customizations.webp)

6. Select the customization to add. Use Shift-click (contiguous items) or Ctrl-click to select
   multiple customizations.
7. Click **Add** to add your selections to the Selected Customizations pane.
8. Click **Save** when you are done.

## Change Logs

![CPQ Change Log](/images/platgovsalesforce/change_management/cpq_discount_change_log.webp)

**Tracked, Non-Blocking** generates a Compliant Change Log (CL-11674) if there is an approved Change
Request or a Non-Compliant Change Log (CL-11672) for changes made without an approved Change
Request.

**Tracked, Blocking** generates a Compliant Change Log (CL-11672) if there is an approved Change
Request. If a user attempts to save a change to a **Tracked, Blocking** object without an approved
Change Request, an error is generated and the change is not saved.

### Filtering Change Logs

Sometimes, you may want to create Change Logs only when specific conditions are met. For example, you may want to create an Opportunity Change Log only when an admin updates specific fields on a Closed Won Opportunity. Or you may not want Change Logs for User-Defined CPQ Discount Schedules.

#### Using a Report as a Filter
Report filters are the simplest to implement. Use any Report Type to create a report of Ids; if a tracked record satisfies the report’s filter criteria, then a Change Log will be created for that record update.

**Report Requirements**
- The “Show Me” filter must return all records being filtered.

- The standard date filter must be the Created Date of the record type being filtered.

- The first column of the report must be the Id of the record.


**Example: Do not create Change Logs for changes in “User-Defined” CPQ Discount Schedules** <br></br>
This report returns only the Discount Schedule Ids of records that do not have the “User Defined” checkbox checked.

![Data Tracking Report Filter](/images/platgovsalesforce/change_management/data_tracking_report_filter.webp)


#### Using an Apex Class as a Filter
You may have filtering logic that is too complex to implement in a Report. Strongpoint provides a way to create a custom Apex Class for complex logic.

**Requirements**
The class must be global and must implement the FLODocs.IChangeLogFilter interface. To implement the interface, you must have one global method: <pre> ```apex Set<Id> getFilteredIds(Datetime start, Datetime end) ``` </pre> <br></br> The start and end times should be used by your filtering logic to return a Set of record Ids that have been modified during that time interval.

**Example: Do not create Change Logs for changes in “User-Defined” CPQ Discount Schedules** <br></br>
Here’s an example that does the same job as the Report filter above.

```apex
global without sharing class DiscountScheduleFilter implements FLODocs.IChangeLogFilter {
    global Set<Id> getFilteredIds(Datetime lastModifiedStart, Datetime lastModifiedEnd) {
        Map<Id,SBQQ__DiscountSchedule__c> schedules =
                new Map<Id,SBQQ__DiscountSchedule__c>([SELECT Id
                                                      FROM SBQQ__DiscountSchedule__c
                                                      WHERE SBQQ__UserDefined__c = false
                                                      AND LastModifiedDate &gt; :lastModifiedStart
                                                      AND LastModifiedDate &lt; :lastModifiedEnd]);
    return schedules.keySet();
  }
}
```

#### Applying a Filter to a Tracked Object
After the Strongpoint scanner runs, a Strongpoint Customization will be created for the Report or Apex Class.  Navigate to that filter’s Customization record and, on the Controls tab, update the “Filtered Data Records” field with the data record Customization for the tracked object.

You can see a list of all the filters applied to a tracked object. Navigate to the data record Customization for the tracked object and inspect the “Change Log Filters” in the Related Lists tab.

**Example: Applying the DiscountScheduleFilter Apex class to the CPQ Discount Schedule object**
![Data Tracking Filter](/images/platgovsalesforce/change_management/data_tracking_filter1.webp)

#### Reviewing Data-Record Change Logs
The Change Log has some features specific to data-record changes:

![Data Tracking Change Log](/images/platgovsalesforce/change_management/data_tracking_change_log.webp)

1. Data record Customization for the tracked object

2. Always blank, because it’s not metadata.

3. Always “Data Change Tracking”. Can be used for creating filtered Change Log Reports and List Views.

4. Data record name, API Name of the tracked object, and operation that was done.

5. Data record’s Salesforce Id. Use this to URL-hack directly to the updated record.

6. Data record name.

7. The tracked object’s API name.

8. List of filters whose criteria matched this record. (Only populated when an object has filters applied.)
