---
title: "My Direct Reports' History"
description: "My Direct Reports' History"
sidebar_position: 20
---

# My Direct Reports' History

To view the history of updates and changes made to your direct reports, click **History** on the
left navigation bar. History page opens with the **My History** tab in view. On the displayed page,
click the **My Direct Reports' History** tab.

The following events are logged on this page:

- When an object is added as your direct reports.
- When a direct report is removed from your direct reports.
- When you or any other user makes certain changes to the properties of a direct report.

:::note
When any of your direct reports is deleted, its history is also deleted.
:::


**What do you want to do?**

- History view modes
- Filter history data
- Add notes to history items
- Export history data

## History view modes

History data can be viewed in two modes:

### Detailed view

Displays history data in a descriptive and user-friendly manner. Items are sorted according to the
date and time of modification, showing the most recent at the top.

This is the default view of history data.

### Administrative view

This view is only available if you have administrative privileges.

Click **Switch to Administrative View** to view history data in administrative mode. It displays
history data in a tabular form. History items are grouped by date. Each date group displays changes
made to your direct reports during that period.

You can expand an item to view more details, such as the names of the attributes modified in an
action along with their old and new values.

## Filter history data

1. Click **My Direct Reports History Grid Filter** to specify a criteria for filtering history data.
2. Click **Add Filter** to add the filter criteria.
3. From the **Select a filter** list, select attributes to filter history data on the basis of the
   attribute modified.
4. Two more boxes get displayed next to **Select a filter** box upon selecting a filter.

    - **Select an Operator**: Select an operator from the first list.
    - **Select a Value**: Specify a value for the selected operator in the second box.

    For example, if you select '_Modified on_' from the first list, _'is exactly_' from the second
    list, and specify a date in the third box, then history items that were modified on the
    specified date will be displayed.

5. Click **Apply Filter**.

    History items that match the specified criteria are displayed.

6. Use the **Search In** list to load history data from the entire directory or a domain.

    This list shows a tree view of all the domains in the identity store. Select the required
    domains or select **Entire Directory** to view objects' history from all domains.

7. Click **Refresh** to reload history data for the domains selected in the **Search In** list.

## Add notes to history items

GroupID enables a user to add notes to history items that were logged as a result of any change they
made. A note may explain the reason for making a certain change, such as why they changed the
security type for a group.

Only the user who added the note can update it. Other users can only view this note; they cannot
edit or add comments.

- The **Add Note** button is available next to a history item listed.
- Once you add a note, the **Add Note** button changes to **View Note**. All portal users can use
  this button to view the note.

### Add a note

The option to add a note is available on the My Account History card on Dashboard, and all History
pages i.e.[My History](/docs/directorymanager/11.0/portal/history/myhistory.md), My Direct
Reports' History and
[My Groups' History](/docs/directorymanager/11.0/portal/history/mydirectorygroup.md) pages.

1. Click the **Add Note** button next to a history item to add a note to it.
2. On the **Add Note** dialog box, write a note and click **Add Note** to save it.

    Your note can have a maximum of 500 characters.

### Edit a note

You can only edit the note that you have added.

1. Click the **View Note** button next to a history item to view or edit the note for it.
2. On the **Note** dialog box, click the **Edit Note** button and update the note.
3. Click **Update Note** to save the changes.

### View a note

Once a note is added, other users can view it, but they cannot edit it or add comments to it.

- In the Detailed view:

    Click the **View Note** button next to a history item to view the note for it.

- In the Administrative view:

    The **Note** column displays the note.

### Remove a note

You can only remove the note that you have added.

1. Click the **View Note** button next to a history item to view or remove the note for it.
2. Click the **Edit Note** button and remove the note.
3. Click **Update Note**.

## Export history data

You can export history data displayed to an external file.

Click the **Export History** button and select the file type to export history data to. Supported
formats are:

- Excel
- CSV
- XML

The file is created at the download location specified in the browser settings.
