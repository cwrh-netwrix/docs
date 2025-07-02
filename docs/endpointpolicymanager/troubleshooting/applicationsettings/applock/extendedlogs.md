# Extended AppLock™ Logs

Technical support may ask you to turn on extended AppLock™ logging if the locking mechanism isn't
working as expected. Navigate to `HKLM\SOFTWARE\PolicyPak\Config\AppLock` and set `ExtendedLogs `to
a `REG_DWORD` value 1 of as seen in Figure 97.

![troubleshooting_policypak_1](/img/product_docs/endpointpolicymanager/troubleshooting/applicationsettings/applock/troubleshooting_endpointpolicymanager_1.webp)

Figure 97. The AppLock key will not exist by default and must be created before the value is set
within it.

AppLock™ logs are stored in separate files for each app. For example, WinZip logs are now located
in` %localappdata%\endpointpolicymanager\AppLock\WINZIP.EXE\ppAlClient.log`
