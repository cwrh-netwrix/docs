---
title: "Removing AppLock™ GUIDs"
description: "Removing AppLock™ GUIDs"
sidebar_position: 80
---

# Removing AppLock™ GUIDs

Some applications embrace the idea of Netwrix Endpoint Policy Manager (formerly PolicyPak) AppLock™
tab hiding, but won't honor Endpoint Policy Manager AppLock™. For instance, Firefox has tabs, but
doesn't honor Endpoint Policy Manager AppLock™ in practice. For this reason, in the GPO, this would
not be honored when affecting the client, as shown in Figure 149.

![removing_applock_guids](/images/endpointpolicymanager/applicationsettings/designstudio/removing_applock_guids.webp)

Figure 149. An example of an application that does not honor Endpoint Policy Manager AppLock™.

Another application that does not honor Endpoint Policy Manager AppLock™ is Acrobat Reader, as
shown in Figure 150, since it doesn't have tabs at all.

![removing_applock_guids_1](/images/endpointpolicymanager/applicationsettings/designstudio/removing_applock_guids_1.webp)

Figure 150. Example of an application without any tabs.

For this reason, trying to disable the tab in the GPO doesn't make much sense (see Figure 151).

![removing_applock_guids_2](/images/endpointpolicymanager/applicationsettings/designstudio/removing_applock_guids_2.webp)

Figure 151. Disabling tabs does not work for applications that do not have tabs.

In these cases, you might want to remove the AppLock™ GUIDs from the project so that it is not
possible to right-click on a tab in the Group Policy MMC. To do that, follow the steps presented in
Figure 152.

![removing_applock_guids_3](/images/endpointpolicymanager/applicationsettings/designstudio/removing_applock_guids_3.webp)

Figure 152. Disabling AppLock™ GUIDs.

When you do this, each tab in the compiled project will no longer have the option to "Disable whole
tab in target application" or "Force display of whole tab in target application," as shown in
Figure 153.

![removing_applock_guids_4](/images/endpointpolicymanager/applicationsettings/designstudio/removing_applock_guids_4.webp)

Figure 153. AppLock™ GUIDs have been removed.
