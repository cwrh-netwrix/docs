# Rules

Netwrix Password Policy Enforcer uses rule to decide if it should accept or reject a password. Each
policy has rules that are configured independently of the rules in other policies. To display the
rules for a policy:

**Step 1 –** Click the Policies item to display the Policies view.

**Step 2 –** Double-click the desired policy in the right pane of the management console.

Rules are shown in the right pane of the management console. A check mark beside a rule indicates
that the rule is enabled (being enforced). Double-click a rule to show the rule's properties.

## Detecting Character Substitution

Character substitution is a technique used by some users to improve password quality. They replace
some alphabetic characters with non-alphabetic characters that have a similar appearance. For
example, "sold" becomes "$old". Many of these substitutions are well known, and do little to improve
password strength.

Some Password Policy Enforcer rules have a Detect Character Substitution check box. When this check
box is selected, Password Policy Enforcer tests passwords with, and without character substitution.
This stops users from circumventing the rule by substituting some characters. Password Policy
Enforcer detects these common character substitutions:

| Original |     | Substituted  |
| -------- | --- | ------------ |
| A        | a   | ^ @          |
| B        | b   | 8            |
| C        | c   | ( or `{` < [ |
| D        | d   | ) or `}` > ] |
| E        | e   | 3            |
| G        | g   | 6 or 9       |
| I        | i   | ! or \| 1    |
| O        | o   | 0 or (zero)  |
| S        | s   | $ or 5       |
| T        | t   | + or 7       |
| Z        | z   | 2            |

## Tolerance

Some Password Policy Enforcer rules have a Tolerance drop-down list that allows you to control how
strictly the rule is enforced. Tolerance is normally expressed as the maximum allowable number of
consecutive matching characters in the password and some other parameter. Password Policy Enforcer
rejects a password if the specified tolerance is exceeded. For example, the logon name
"mary**jones**", and the password "**Jones**town" contain five consecutive matching characters
(shown in bold type). Password Policy Enforcer will reject this password if the tolerance for the
User Logon Name rule is four (or lower), and accept it if the tolerance is five (or higher).

The User Logon Name, User Display Name, Similarity, and Character Patter rules have an Auto
tolerance option. Setting the tolerance to Auto instructs Password Policy Enforcer to only reject
passwords that contain the entire parameter being compared. This is very useful when the length of
the comparison parameter is unknown. For example, if you want Password Policy Enforcer to reject
passwords that contain the user's entire logon name, then you cannot specify a fixed tolerance
unless all logon names have the same length. Setting the tolerance to Auto allows Password Policy
Enforcer to calculate an appropriate tolerance during every password change.

Password Policy Enforcer sets the tolerance to the length of the comparison parameter minus one. The
table below shows some parameter values and the calculated tolerance. Password Policy Enforcer
rejects a password if it contains all the text in the Value column (or a derivative of it if
character substitution detection or bi-directional analysis is enabled).

| Rule              | Parameter         | Value      | Tolerance |
| ----------------- | ----------------- | ---------- | --------- |
| User Logon Name   | Logon name        | maryjones  | 8         |
| User Display Name | Display name      | Mary Jones | 9         |
| Similarity        | Current password  | oldpass    | 6         |
| Character Pattern | Character pattern | abcdefgh   | 7         |

Password Policy Enforcer's Auto tolerance calculation has a minimum limit to stop passwords from
being rejected when the comparison parameter is very short. The limit is set to two characters by
default, so Password Policy Enforcer will accept passwords that contain the parameter value if the
comparison parameter only contains one or two characters. Contact Netwrix support if you need to
change the minimum limit.

**CAUTION:** Do not use the automatic tolerance option with Password Policy Enforcer V4.x or V3.x
clients, including PPE/Web V3.x and Netwrix Password Reset V1.x.

## Maximum Age Rule

The Maximum Age rule forces users to change their passwords regularly. This decreases the likelihood
of an attacker discovering a password before it changes. This rule can only be enforced by domain
policies.

![ppe_rules](/img/product_docs/passwordreset/3.23/password_policy_enforcer/administration/ppe_rules_6.webp)

Select the **Enabled** check box to enable the Maximum Age rule.

Choose a value from the first days drop-down list to specify how many days must elapse before
passwords expire.

You can encourage users to choose longer passwords by extending the lifetime of their password if it
exceeds a certain length. To enable this feature, choose a higher value from the second days
drop-down list and a minimum length from the contains drop-down list. Passwords that contain the
required number of characters will not expire until the second (higher) days value. If both days
values are identical, then passwords will expire after the specified number of days, irrespective of
their length.

**NOTE:** When the Maximum Age rule is configured to delay the expiry of longer passwords, it
creates an Active Directory security group called "PPE Extended Maximum Age Users". Password Policy
Enforcer uses this group to identify which users are eligible for a delayed password expiry. Users
are added and removed from the group automatically. You can move and rename this group, but do not
change the pre-Windows 2000 name. Contact Netwrix support if you must change the pre-Windows 2000
name. Change a Password Policy Enforcer configuration setting (any setting) after moving or renaming
the group to trigger a cache update in Password Policy Enforcer. Password Policy Enforcer recreates
this group if you delete it. To stop creating a group, make the two days values equal in all
policies.

Choose a value from the Mode drop-down list to specify how Password Policy Enforcer handles expired
passwords. The Standard mode forces all users with expired passwords to change their password during
logon. The Transitional modes force a percentage of users with expired passwords to change their
password during logon. The Warning mode warns users that their password has expired without forcing
them to change it.

Click the E-mail tab to configure the e-mail message options. See the
[Mailer](/docs/passwordreset/3.23/password_policy_enforcer/administration/mailer.md) topic
for additional information.

Use the Warning and Transitional modes to gradually introduce a new password policy. These modes
reduce the number of forced password changes, allowing the helpdesk to deal with any extra calls
relating to the new policy. Switch to the Standard mode after most users have had a chance to change
their password.

It takes approximately 50 days for all users with expired passwords to be forced to change them in
the 2% Transitional mode (2% every day). The 5% Transitional mode reduces this to 20 days, and the
10% Transitional mode further reduces it to 10 days. The selection algorithm is randomized, so these
are estimates only. You must switch to the Standard mode to ensure that all old passwords will
expire.

Users with expired passwords are always prompted to change their password, even in the Transitional
and Warning modes. Users can ignore the prompt to change their password unless they are being forced
to change it.

**NOTE:** The password expiry prompt is a Windows client feature, and is displayed even if the
Password Policy Client is not installed. Windows clients display the prompt 5 days before passwords
expire by default. You can alter this behavior in the Windows Group Policy security settings. See
the
[Interactive logon: Prompt user to change password before expiration](http://technet.microsoft.com/en-us/library/jj852243(v%3Dws.10).aspx)
Microsoft article for additional information.

Password Policy Enforcer expires passwords at 1:00 AM every day on the domain controller holding the
PDC emulator operations master role. It sets "User must change password at next logon" for users
whose password has expired, or is due to expire on that day. Password Policy Enforcer does not
expire passwords if the Maximum Age rule is in Warning mode, or for users with "Password never
expires" set in Active Directory. Some passwords will not expire immediately when the Maximum Age
rule is in a Transitional mode.

## Minimum Age Rule

The Minimum Age rule stops users from quickly cycling through a series of passwords in order to
evade the History and Similarity rules. This rule can only be enforced by domain policies.

![ppe_rules_2](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_2.webp)

Select the **Enabled** check box to enable the Minimum Age rule.

Choose a value from the **days** drop-down list to specify how many days users must wait before
changing their password.

Click the **Messages** tab to customize the Password Policy Client. Only the Reason insert is shown
because minimum age requirements are not included in the Password Policy message.

**NOTE:** The Minimum Age rule is unique because users cannot comply with it by choosing a different
password; they must wait until the required number of days has elapsed. The Password Policy Client
consequently handles rejections by this rule differently to other rules. Rather than displaying the
usual message components, the PPC only displays the Minimum Age rule's Reason insert. See
[Password Policy Client](/docs/passwordreset/3.23/password_policy_enforcer/administration/password_policy_client.md)
topic for additional information. The Rejection Reason template, macros, and inserts from other
rules are not displayed when a password change is denied by the Minimum Age rule.

The Minimum Age rule is not enforced during policy testing, but the test log does show the user's
password age. A log entry is also added if the Minimum Age rule would have rejected the password
change. See the
[Managing Policies](/docs/passwordreset/3.23/password_policy_enforcer/administration/managing_policies.md)
topic for additional information.

## Length Rule

The Length rule rejects passwords that contain too few or too many characters. Longer passwords are
generally stronger, so only specify a maximum password length if password compatibility must be
maintained with a system that cannot accept long passwords.

![ppe_rules_3](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_3.webp)

Select the **Enabled** check box to enable the Length rule.

Select the **at least** option to specify the minimum number of characters that passwords must
contain. Choose the minimum number of characters from the drop-down list.

Select the **no more than** option to specify the maximum number of characters that passwords can
contain. Choose the maximum number of characters from the drop-down list.

Select the **between** option to specify the minimum and maximum number of characters that passwords
can contain. Choose the minimum number of characters from the first drop-down list, and the maximum
from the second drop- down list.

Click the **Messages** tab to customize the Password Policy Client rule inserts.

## Complexity Rule

The Complexity rule rejects passwords that do not contain characters from a variety of character
sets. Using several character types can make passwords more difficult to crack.

![ppe_rules_4](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_4.webp)

Select the **Enabled** check box to enable the Complexity rule.

Choose the number of required character sets from the drop-down list. Passwords will be rejected if
they do not contain characters from at least the specified number of character sets.

Choose the available character sets by selecting the check boxes beside the character set names. The
number of available character sets must be equal to or greater than the number of required character
sets.

Select the **Passwords must always comply with this rule** check box to make the Complexity rule
mandatory. Password Policy Enforcer rules are mandatory by default, but can be made optional by
changing the Reject passwords that do not comply with value in the Policy Properties page. A
mandatory rule can still be disabled when passphrase is used.

Click the Messages tab to customize the Password Policy Client rule inserts.

**NOTE:** The Complexity rule uses custom character set definitions from the Character rules, even
if the Character rules are disabled.

## Dictionary Rule

The Dictionary rule rejects passwords that are vulnerable to guessing, hybrid, and precomputed
attacks. These attacks can crack weak passwords in seconds, and they can be very effective if
passwords are based on common words.

![ppe_rules_5](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_5.webp)

There are two Dictionary rules in each password policy. You can use the second rule with a different
dictionary file, or to enforce a more tolerant policy for passphrases by disabling the primary rule
for long passwords.

Select the **Enabled** check box to enable the Dictionary rule.

Select the **Detect inclusion of non-alpha characters** check box if Password Policy Enforcer should
remove all non-alphabetic characters during analysis. This allows Password Policy Enforcer to reject
passwords such as "myp8asswor8d."

Select the **Detect character substitution** check box if Password Policy Enforcer should reject
passwords that rely on character substitution to comply with this rule.

Select the **Bi-directional analysis** check box if Password Policy Enforcer should additionally
test passwords with their characters reversed. Enabling bi-directional analysis stops users from
circumventing this rule by reversing the order of characters in their password. For example, a user
may enter "drowssapym" instead of "mypassword".

Select the Wildcard analysis check box if Password Policy Enforcer should search for wildcard
templates in the dictionary file. Wildcard templates are specially formatted dictionary words that
Password Policy Enforcer uses to reject a range of passwords. The Dictionary rule supports two
wildcard template formats:

| Format | Example   | Description                                                                      |
| ------ | --------- | -------------------------------------------------------------------------------- | --- | --- | --- | --------- | --- | ------- | --- | --- | --- | --- | --- | --- | --------------------------------------------------------------------------------- | --- | ---------------------------------------------------------------------------------------- | --- |
| Prefix |           |                                                                                  |     | --- |     | !!BAN\*!! |     | !!2\*!! |     |     |     |     | --- |     | Rejects passwords that start with BAN. For example: band, banish, ban, bank, etc. |     | Rejects passwords that start with the numeric character 2. For example: 2ABC, 2123, etc. |     |
| Suffix | !!\*ING!! | Rejects passwords that end with ING. For example: pushing, howling, trying, etc. |

Partial matching is performed even if Wildcard analysis is disabled. For example, the dictionary
word "password" will reject the passwords "My**Password**$", "**Password**100", and
"12**password**34" even if Wildcard analysis is disabled.

Wildcard analysis should only be used to limit matching to the characters at the start or end of a
password.

Enabling Wildcard analysis slightly increases search times, so only enable this option if the
dictionary file contains wildcard templates. The sample dictionary file included with Password
Policy Enforcer does not contain any wildcard templates.

Choose a value from the Tolerance drop-down list to specify the maximum number of consecutive
matching characters that Password Policy Enforcer will tolerate before rejecting a password. For
example, the dictionary word "**sword**", and the password "4my**sword**%" contain five consecutive
matching characters (shown in bold type). Password Policy Enforcer will reject this password if the
tolerance is four (or lower), and accept it if the tolerance is five (or higher).

Click the **Browse** button to select a dictionary file, or type a path into the text box. The path
can contain environment variables like %SystemRoot%. A sample dictionary is installed in the
\Program Files (x86)\Password Policy Enforcer\ folder. The dictionary file should be read from a
local disk. Using a shared dictionary degrades performance, and could jeopardize security.

**NOTE:** The `\Program Files (x86)\` folder does not exist on 32-bit Windows, so move the
dictionary into the `\Program Files\Password Policy Enforcer\` folder if you have 32-bit and 64-bit
computers sharing a common Password Policy Enforcer configuration.

Click the **Sort** button if the dictionary file is being used with Password Policy Enforcer for the
first time, or if words have been added to the file since it was last sorted. The Password Policy
Enforcer management console will sort and reformat the file so that Password Policy Enforcer can use
it. Sorting also removes duplicate words, so the sorted file may be smaller than the original.

Click the **Messages** tab to customize the Password Policy Client rule inserts. If both Dictionary
rules have identical inserts, then only one of the inserts is shown in the corresponding PPC message
if the password is rejected by both rules.

### Sample Dictionary File

A sample dictionary file called DICT.TXT is installed in the \Program Files (x86)

\Password Policy Enforcer\ folder. This file is sorted and ready to use. It contains approximately
257,000 words, names, and acronyms.

### Creating a Custom Dictionary

You can add words to the sample dictionary file, or download larger dictionary files from the
Internet. Always sort a dictionary file before using it with Password Policy Enforcer, and make sure
that all computers have a local copy of the updated and sorted file.

### Dictionary File Replication

Password Policy Enforcer does not distribute dictionary file updates to other computers, but you can
use the Windows Distributed File System to ensure that all domain controllers have the latest
dictionary file. Copy the dictionary file into the Sysvol share on one domain controller, and the
Distributed File System will copy the file into the Sysvol share of all other domain controllers.
Configure the Dictionary rule to read the file from \\127.0.0.1\sysvol\your.domain\filename.txt

The path above only works if the computer has a Sysvol share. This won't be the case if you are
using a workstation for policy testing, or if you are using Password Policy Enforcer to enforce
local polices. If you are using Password Policy Enforcer for local policies and want all computers
to receive dictionary file updates, then use the Sysvol share for file replication and a script or
scheduled task to copy the file to a local folder.

## Compromised Rule

The Compromised rule rejects passwords from prior breaches. These passwords should not be used as
they are vulnerable to credential stuffing attacks.

![ppe_rules_6](/img/product_docs/passwordreset/3.23/password_policy_enforcer/administration/ppe_rules_6.webp)

Select the **Enabled** check box to enable the Compromised rule.

Click the **...** (ellipsis) button beside each text box to select a hash file. You can also type a
path into the text box. The path can contain environment variables like

%SystemRoot%. Hash files should be read from a local disk. Using shared hash files degrades
performance, and could jeopardize security.

Click the **Messages** tab to customize the Password Policy Client rule inserts.

### Downloading and Preparing a Hash File

The Compromised rule can use the data from [haveibeenpwned.com](https://haveibeenpwned.com/). You
can download the current data file from
[https://haveibeenpwned.com/Passwords](https://haveibeenpwned.com/Passwords).

Use the HIBPPrep utility to prepare the file for use with Password Policy Enforcer. HIBPPrep copies
the hashes to a new file without the prevalence information. The resulting file is about 30% smaller
than the original. HIBPPrep can also create a smaller file with fewer hashes to enforce a less
restrictive policy. Do not limit the file size due to performance concerns as the Compromised rule
typically searches the whole file in under a millisecond and only uses a few kilobytes of memory.

You can download HIBPPrep from
[https://www.anixis.com/ftp/ppe/HIBPPrep100.zip](https://www.anixis.com/ftp/ppe/HIBPPrep100.zip)

Further instructions are in the Readme.txt file inside the zip file.

### Creating a Custom Hash File

You can create your own hash file for the Compromised rule. Each line should contain one SHA-1 hash
in hexadecimal format (40 characters). Use uppercase hexadecimal characters, and save the file in
the DOS/Windows format with a CR and LF character at the end of each line. Sort the hashes in
ascending order. The file should not contain any empty lines. Use the Test Policies page to ensure
the file works correctly. See the
[Managing Policies](/docs/passwordreset/3.23/password_policy_enforcer/administration/managing_policies.md)
topic for additional information.

### Has File Replication

Password Policy Enforcer does not distribute hash file updates to other computers, but you can use
the Windows Distributed File System to ensure that all domain controllers have the latest hash
files. Copy the hash files into the Sysvol share on one domain controller, and the Distributed File
System will copy the files into the Sysvol share of all other domain controllers. Configure the
Compromised rule to read the files from \\127.0.0.1\sysvol\your.domain\filename.txt

The path above only works if the computer has a Sysvol share. This won't be the case if you are
using a workstation for policy testing, or if you are using Password Policy Enforcer to enforce
local policies. If you are using Password Policy Enforcer for local policies and want all computers
to receive hash file updates, then use the Sysvol share for file replication and a script or
scheduled task to copy the file to a local folder.

## History Rule

The History rule rejects passwords that are identical to recently used passwords. Password reuse
should be avoided because it defeats the purpose of regular password changes. Password Policy
Enforcer can stop users from reusing passwords for a specified number of password changes or a
number of days.

![ppe_rules_7](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_7.webp)

Select the **Enabled** check box to enable the History rule.

Select the **one of the last** option to stop passwords from being reused for a specified number of
password changes. Choose the number of password changes from the drop-down list.

Select the **password used in the last** option to stop passwords from being reused for a specified
number of days. Type the number of days in the text box.

Choose an item from the **Hash function** drop-down list. Argon2 is recommended for best security.
The Argon2 option uses 100,000 times more computing power to create a hash, so an attacker needs
100,000 more computing power to crack Argon2 hashes. Argon2 increases password change times by 400%,
so a domain controller that can handle 1,000 password changes a minute with SHA-256 can be expected
to handle 250 password changes a minute with Argon2. All numbers are approximate. Use Argon2 if your
domain controllers can handle the load.

**NOTE:** Changing the **Hash function** does not modify existing history records. It sets the
function to be used for new password history records. If a user has Argon2 and SHA-256 hashes in
their password history, then Password Policy Enforcer calculates both the Argon2 and SHA-256 hashes
during a password change to ensure the new password is not in the password history.

The History rule is normally not enforced when a password is reset. Select the **Enforce this rule
when a password is reset** check box to override the default behavior. You must also select the
**Enforce policy when password is reset** option in the PPS Properties page to enforce this rule
when a password is reset.

Click the **Messages** tab to customize the Password Policy Client rule inserts.

**NOTE:** The History rule is not enforced when testing passwords from the Test Policies page.

Password Policy Enforcer updates a user's password history whenever their password changes. The
password history is updated even if Password Policy Enforcer or the assigned policy is disabled. A
user's password history is deleted if the user does not have an assigned policy, or if the History
rule is disabled at the time of the password change.

Password Policy Enforcer's password history is stored in Active Directory for domain user accounts,
and in the registry for local user accounts. You can create a new Active Directory attribute for the
password history, or configure Password Policy Enforcer to use an existing attribute.

Disable Password Policy Enforcer's History rule if you do not want Password Policy Enforcer to store
the password history.

**NOTE:** Password Policy Enforcer does not store passwords in the password history, it only stores
the Argon2 or SHA-256 hashes. A salt protects the hashes from precomputed attacks, including rainbow
tables. If you do not want Password Policy Enforcer to store a password history, then leave the
History rule disabled. You can use the Windows History rule together with Password Policy Enforcer's
other rules to enforce your password policy.

Password Policy Enforcer can store up to 100 password hashes for each user, but it only stores the
minimum needed to enforce the current password policy. For example, if Password Policy Enforcer is
configured to reject the last 24 passwords, then only the last 24 password hashes are stored.
Reconfiguring Password Policy Enforcer to reject the last 30 passwords will not have an immediate
effect as only 24 password hashes are currently stored. The full effect of the new configuration
will be realized after users change their passwords six more times as Password Policy Enforcer will
then have 30 stored password hashes for each user.

Leave both the Windows and Password Policy Enforcer History rules enabled when transitioning from
one to the other. This allows the old rule to enforce the policy until the new rule has built up its
password history. The old rule can be disabled after users have completed the required number of
password changes to enforce the new rule.

As Password Policy Enforcer is limited to storing the last 100 password hashes, it is possible for
the History rule to run out of storage space before the specified number of days. Use the Minimum
Age rule to avoid this problem. For example, if the History rule is configured to not allow password
reuse for 365 days, then set the minimum password age to four or more days. Even if a user changes
their password every four days, they can only perform 91 password changes in 365 days.

### Creating a New Attribute for the Password History

Windows stores a domain user's password history in two Active Directory attributes, but these
attributes cannot be used by other applications. Password Policy Enforcer can store the password
history in a new or existing attribute. A new attribute is recommended, but you can use an existing
attribute if you do not want to extend the AD schema. An AD attribute is only needed for domain user
accounts because the password history for local user accounts is stored in the registry.

**CAUTION:** Password Policy Enforcer's password history attribute is confidential to stop
authenticated users from accessing the password history of other users. See the Microsoft Article
[Mark an attribute as confidential in Windows Server 2003 Service Pack 1](http://support.microsoft.com/kb/922836)
Microsoft article for additional information. Confidential attributes have additional protection in
Active Directory, but they are not as well protected as the Windows password history attributes.
There is a higher risk of unauthorized access to the password history if it is stored outside the
Windows password history attributes.

Follow the steps below to create a new Active Directory attribute for the password history.

**Step 1 –** Log on to the server holding the Schema Operations Master role with an account that is
a member of the Schema Admins group.

**Step 2 –** Open a Command Prompt window to the Password Policy Enforcer installation folder.

(\Program Files (x86)\Password Policy Enforcer\)

**Step 3 –** Type the following command:

: ldifde -i -f History.ldf -c "DC=X" "DC=yourdomain,DC=yourdomain"

Replacing the last parameter with your domain's DN.

**Step 4 –** Press **ENTER** and check the output for errors.

![ppe_rules_8](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_8.webp)

### Using an Existing Attribute for the Password History

Password Policy Enforcer can store the password history in an existing attribute. The desktopProfile
attribute is well suited because it is not used by Windows. Other attributes are also suitable if
they are not being used. Contact Netwrix support[ ](mailto:support@anixis.com)if you would like to
use an existing attribute for the password history.

### Password Histories for Local User Accounts

The password histories of local user accounts are stored in the HKLM\SECURITY\PPE Password History\
registry key. Users are not granted access the HKLM\SECURITY\ registry key by default, so a user
cannot read the password history of any user (including themselves). This is also true for members
of the Administrators group, but administrators can change the default permissions. If an
administrator accesses the password history they might be able to extract the hashes for cracking,
but they cannot extract the passwords directly because the password history does not contain any
passwords.

**CAUTION:** The password history of a local user account is not automatically deleted when the user
account is deleted. If a local user account is deleted, then another local user account is created
on the same computer with the same username, the new user will inherit the deleted user's password
history. The default registry permissions stop users from accessing their own password history, so
it is difficult for the new user to use this information. They could try to guess the deleted user's
password during a password change to see if it is rejected by the History rule, but they would only
have a few attempts to guess correctly before the old hashes are overwritten with new hashes. The
user's current password is validated, and the Windows Minimum Age rule is enforced before the
password history is checked, so every compliant and incorrect password guessed will overwrite one
hash in the password history. This information applies only to local user accounts. The password
history for domain user accounts is deleted when users are deleted.

## Similarity Rule

The Similarity rule rejects passwords that are similar to a user's current password. Password
similarity may indicate that a user is serializing their passwords. For example, "password1",
"password2", "password3", etc. Password serialization should be avoided because it may allow an
attacker to guess the new password.

![ppe_rules_9](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_9.webp)

Select the **Enabled** check box to enable the Similarity rule.

- Select the Detect character substitution check box if Password Policy Enforcer should reject
  passwords that rely on character substitution to comply with this rule.
- Select the **Bi-directional analysis** check box if Password Policy Enforcer should additionally
  test passwords with their characters reversed. Enabling bi-directional analysis stops users from
  circumventing this rule by reversing the order of characters in their password. For example, a
  user may enter "drowssapdloym" instead of "myoldpassword".
- Choose a value from the **Tolerance** drop-down list to specify the maximum number of consecutive
  matching characters that Password Policy Enforcer will tolerate before rejecting a password. For
  example, the two passwords "old**passwd**" and "new**passwd**" contain six consecutive matching
  characters (shown in bold type). Password Policy Enforcer will reject the new password if the
  tolerance is five (or lower), and accept it if the tolerance is six (or higher). Choose the
  **Auto** value to reject passwords that contain the user's entire current password.

**NOTE:** Click the Messages tab to customize the Password Policy Client rule inserts. This rule is
only enforced if the Password Policy Client is installed. It does not store or transmit passwords or
password hashes.

## User Logon Name Rule

The User Logon Name rule rejects passwords that are similar to a user's logon name (user name).
Passwords that are similar to a user's logon name are not desirable because they are easily guessed.

![ppe_rules_10](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_10.webp)

- Select the Enabled check box to enable the User Logon Name rule.
- Select the Detect character substitution check box if Password Policy Enforcer should reject
  passwords that rely on character substitution to comply with this rule.

- Select the **Bi-directional analysis** check box if Password Policy Enforcer should additionally
  test passwords with their characters reversed. Enabling bi-directional analysis stops users from
  circumventing this rule by reversing the order of characters in their password. For example, a
  user may enter "emannogolym" instead of "mylogonname".
- Choose a value from the **Tolerance** drop-down list to specify the maximum number of consecutive
  matching characters that Password Policy Enforcer will tolerate before rejecting a password. For
  example, the logon name "mary**jones**", and the password "**Jones**town" contain five consecutive
  matching characters (shown in bold type). Password Policy Enforcer will reject this password if
  the tolerance is four (or lower), and accept it if the tolerance is five (or higher). Choose the
  **Auto** value to reject passwords that contain the user's entire logon name.
- Click the **Messages** tab to customize the Password Policy Client rule.

## User Display Name Rule

The User Display Name rule rejects passwords that are similar to a user's Active Directory display
name (full name for local accounts). Passwords that are similar to a user's display name are not
desirable because they are easily guessed.

![ppe_rules_11](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_11.webp)

- Select the **Enabled** check box to enable the User Display Name rule.
- Select the Detect character substitution check box if Password Policy Enforcer should reject
  passwords that rely on character substitution to comply with this rule.
- Select the **Bi-directional analysis** check box if Password Policy Enforcer should additionally
  test passwords with their characters reversed. Enabling bi-directional analysis stops users from
  circumventing this rule by reversing the order of characters in their password. For example, a
  user may enter "emanyalpsidym" instead of "mydisplayname".
- Choose a value from the **Tolerance** drop-down list to specify the maximum number of consecutive
  matching characters that Password Policy Enforcer will tolerate before rejecting a password. For
  example, the display name "John **Smith**ers", and the password "12**smith**town" contain five
  consecutive matching characters (shown in bold type). Password Policy Enforcer will reject this
  password if the tolerance is four (or lower), and accept it if the tolerance is five (or higher).
  Choose the **Auto** value to reject passwords that contain the user's entire display name.
- Click the **Messages** tab to customize the Password Policy Client rule inserts.

## Character Rules

Password Policy Enforcer has seven Character rules that reject passwords if they contain, or do not
contain certain characters. These rules can increase password strength or ensure password
compatibility with other systems.

![ppe_rules_12](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_12.webp)

All the Character rules work identically, but each has their own default character set. A character
set is the collection of characters that each rule searches for when checking a password. You can
use the Character rules with their default character sets, or define your own. The default character
sets are:

| Rule        | Default character set                              |
| ----------- | -------------------------------------------------- |
| Alpha Lower | Lowercase alphabetic (a - z)                       |
| Alpha Upper | Uppercase alphabetic (A - Z)                       |
| Alpha       | Uppercase and lowercase alphabetic (a - z & A - Z) |
| Numeric     | Numerals (0 - 9)                                   |
| Special     | All characters not included above                  |
| High        | All characters above ANSI 126                      |
| Custom      | No default characters                              |

Select the **Enabled** check box to enable the Character rule.

Select the **contain** option if this rule should ensure that new passwords contain certain
characters. Only one character is required by default, but you can specify a different value by
choosing the required number of characters from the drop-down list beside the **contain** option.

Select the **not contain any...** option if this rule should ensure that new passwords do not
contain certain characters.

If you want to restrict this rule to certain character positions, then choose the starting position
from the **in position** drop-down list, and the ending position from the **to** drop-down list. For
example, you may want to enforce a rule that requires a numeric character in the second character
position to maintain compatibility with some other system.

Select the **Embedded** check box if users are required to embed these characters within their
passwords. For example, the passwords "12hello", "1hello", and "hello$987" do not contain any
embedded numeric characters, but these passwords do contain embedded numeric characters (shown in
bold type): "he**7**llo", "4he**3**llo", "23hello**7**$45". Embedded numeric and special characters
can help to protect passwords from cracking attacks.

Type a character set name in the **Name** text box. The Password Policy Client displays the new
name, but the Password Policy Enforcer management console continues to display the original
character set name.

Type some characters in the **Characters** text box if you would like to define a custom character
set to replace the default. For example, enter "AaEeIiOoUu" to create a vowel character set.

Click the **Messages** tab to customize the Password Policy Client rule inserts.

**NOTE:** The First Character, Last Character, and Complexity rules are easier to configure, and
easier for users to understand. Use these rules instead of the Character rules if they can enforce
your desired policy.

### Enforcing Complex Character Requirements

Character rules can be combined to enforce complex password requirements. For example, you may need
to enforce a policy such as "passwords must contain a numeric character, but not in the first two
positions" to ensure compatibility with some other system. This is done by using two of the
Character rules. The first rule (shown on the left below) ensures that passwords contain at least
one numeric character. The second rule ensures that passwords do not contain any numeric characters
in the first two positions.

|                                                                                                                           |                                                                                                                           |
| ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| ![ppe_rules_13](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_13.webp) | ![ppe_rules_14](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_14.webp) |

Password Policy Enforcer has only one Numeric rule, so the second requirement must be enforced by
one of the other rules. Any unused Character rule can be used for this purpose by changing its name
and default character set. In this Example, the Custom rule was chosen as it was not being used. The
character set name was changed to "numeric", and the character set was defined as "1234567890".

## First and Last Character Rules

The First and Last Character rules reject passwords that do not begin or end with an appropriate
character. These rules are typically used to ensure password compatibility with other systems.

|                                                                                                                           |                                                                                                                           |
| ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| ![ppe_rules_15](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_15.webp) | ![ppe_rules_16](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_16.webp) |

Select the **Enabled** check box to enable the First or Last Character rule.

Select the **begin** (First Character rule) or **end** (Last Character rule) option if you want to
specify the **acceptable** character sets.

Select the **not begin** (First Character rule) or **not end** (Last Character rule) option if you
want to specify the **unacceptable** character.

Choose one or more character sets by selecting the check boxes beside the character set names.

**NOTE:** Click the Messages tab to customize the Password Policy Client rule inserts. The First and
Last Character rules use custom character set definitions from the Character rules, even if the
Character rules are disabled.

## Keyboard Pattern Rule

The Keyboard Pattern rule rejects passwords that contain keyboard patterns such as "qwerty".
Passwords should not contain keyboard patterns because they are vulnerable to cracking attacks and
shoulder surfing (observing users as they enter their password).

![ppe_rules_17](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_17.webp)

The examples for this rule are taken from a US keyboard layout. These patterns may not exist on
other keyboard layouts.

- Select the **Enabled** check box to enable the Keyboard Pattern rule.
- Choose the pattern detection mode from the **keyboard patterns** drop-down list. The Horizontal
  mode only detects horizontal patterns such as "qwerty" and "zxcvbn". The Vertical mode only
  detects vertical patterns such as "4esz" and "4rfc". The "Horizontal or vertical" mode detects
  patterns in both axes.
- Select the **Detect direction change** check box if Password Policy Enforcer should detect
  keyboard patterns that contain direction changes. For example, "qwewq" and "4rfr4" are both
  recognized as five-character keyboard patterns if direction change detection is enabled.

**NOTE:** Password Policy Enforcer detects direction changes in both axes if the pattern detection
mode is set to "Horizontal or vertical". For example, "qawsed", "qwedsa", "qwedcv", and "qwsazx" are
all recognized as six-character keyboard patterns if direction change detection is enabled and the
pattern detection mode is set to "Horizontal or vertical".

- Select the **Detect key repeat** check box if Password Policy Enforcer should detect keyboard
  patterns that contain repeated keystrokes. For example, "qwwert" and "qwwwer" are both recognized
  as six-character keyboard patterns if key repeat detection is enabled.
- Select the **Detect key skip** check box if Password Policy Enforcer should detect keyboard
  patterns that contain a horizontally skipped key. For example, "qwryui" is recognized as a six-
  character keyboard pattern if key skip detection is enabled.
- Choose a value from the **Tolerance** drop-down list to specify the longest keyboard pattern that
  Password Policy Enforcer will tolerate before rejecting a password. For example, the password
  "my**qwer**pw" contains a four-character keyboard pattern (shown in bold type). Password Policy
  Enforcer will reject this password if the tolerance is set to three (or lower), and accept it if
  the tolerance is set to four (or higher).
- Click the **Keyboard Layouts** button to select which keyboard layouts Password Policy Enforcer
  uses for pattern detection. You must select at least one layout.

Click the **Messages** tab to customize the Password Policy Client rule inserts.

**NOTE:** Modifier keys such as Shift and AltGr will not evade pattern detection. Key positions can
differ, even in keyboards with matching layouts. The Keyboard Pattern rule may not detect some
patterns because of these differences. Please report any missed patterns to
[Netwrix](mailto:support@anixis.com) support.

## Character Pattern Rule

The Character Pattern rule rejects passwords that contain character patterns such as "abcde".
Passwords should not contain character patterns because they can weaken the password.

![ppe_rules_19](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_19.webp)

- Select the **Enabled** check box to enable the Character Pattern rule.
- Select the Detect character substitution check box if Password Policy Enforcer should reject
  passwords that rely on character substitution to comply with this rule.
- Select the **Bi-directional analysis** check box if Password Policy Enforcer should additionally
  test passwords with their characters reversed. Enabling bi-directional analysis stops users from
  circumventing this rule by reversing the order of characters in their password. For example, a
  user may enter "edcba" instead of "abcde".
- Choose a value from the **Tolerance** drop-down list to specify the longest pattern that Password
  Policy Enforcer will tolerate before rejecting a password. For example, the password
  "password**wxyz**" contains a four-character pattern (shown in bold type). Password Policy
  Enforcer will reject this password if the tolerance is set to three (or lower), and accept it if
  the tolerance is set to four (or higher). Choose the **Auto** value if passwords should be
  rejected if they only contain a single, continuous, character pattern. For example, "abcde" would
  be rejected, but "abcdz" and "abc123" would not.
- Click the **Character Patterns** button to select which character patterns Password Policy
  Enforcer will detect. You must select at least one pattern.
- Click the **Messages** tab to customize the Password Policy Client rule inserts.

## Repeating Pattern Rule

The Repeating Pattern rule rejects passwords that contain repeating character sequences. Users may
use repetition to artificially increase the length of a short password. This should be avoided as it
can weaken the password.

![ppe_rules_17](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_17.webp)

- Select the **Enabled** check box to enable the Repeating Pattern rule.
- Select the Detect character substitution check box if Password Policy Enforcer should reject
  passwords that rely on character substitution to comply with this rule.
- Select the **Bi-directional analysis** check box if Password Policy Enforcer should search for
  patterns with their characters reversed. Enabling bi-directional analysis stops users from
  circumventing this rule by reversing the order of characters in the repeated pattern. For example,
  a user may enter "password@drowssap" instead of "password@password".
- Choose a value from the **Tolerance** drop-down list to specify the maximum number of consecutive
  matching characters that Password Policy Enforcer will tolerate before rejecting a password. For
  example, the password "**mypwd**4**mypwd**5" contains a five- character repeating pattern (shown
  in bold type). Password Policy Enforcer will reject this password if the tolerance is four (or
  lower), and accept it if the tolerance is five (or higher).
- Click the **Messages** tab to customize the Password Policy Client rule inserts.

## Repeating Characters Rule

The Repeating Characters rule rejects passwords that contain excessive character repetition.
Reducing character repetition can increase resistance to both brute-force and dictionary cracking
algorithms. The Repeating Characters rule is not case sensitive, so "mypaSssSword" contains four
consecutive repeating characters (SssS).

![ppe_rules_21](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_21.webp)

- Select the **Enabled** check box to enable the Repeating Characters rule.
- Choose the maximum number of consecutive repeating characters that passwords can contain from the
  **consecutive repeating characters** drop-down list.
- Click the **Messages** tab to customize the Password Policy Client rule inserts.

## Unique Characters Rule

The Unique Characters rule rejects passwords that do not contain a minimum number of unique
characters. For example, the password "aaaaaaaa" only contains one unique character (a), whereas
"mypassword" contains nine unique characters (mypasword). Increasing the number of unique characters
in a password can increase password strength by avoiding repetitive sequences that are easily
guessed. The Unique Characters rule is case sensitive, so "LoOpHole" contains seven unique
characters (LoOpHle).

![ppe_rules_22](/img/product_docs/passwordpolicyenforcer/10.2/administration/ppe_rules_22.webp)

- Select the **Enabled** check box to enable the Unique Characters rule.
- Choose the minimum number of unique characters that passwords must contain from the **unique
  characters** drop-down list.
- Click the **Messages** tab to customize the Password Policy Client rule inserts.
