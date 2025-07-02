# Certificates

Netwrix Endpoint Policy Manager (formerly PolicyPak) can add or remove certificates within Firefox.
These certificates must be in the binary-encoded DER format and cannot be Base64-encoded. If you
need to learn how to convert a certificate, see the section "Exporting Certificates to the
Binary-Encoded DER Format" below.

Video: To see a video of Endpoint Policy Manager managing Firefox's add-ons, go to
[http://www.endpointpolicymanager.com/video/endpointpolicymanager-manage-firefox-certificates.html](http://www.endpointpolicymanager.com/video/endpointpolicymanager-manage-firefox-certificates.html)

You can see Firefox's certificates under` Options | Advanced | Certificates | View Certificates`, as
shown in Figure 42.

![certificates](/img/product_docs/endpointpolicymanager/applicationsettings/preconfigured/firefox/certificate/certificates.webp)

Figure 42. The Servers tab within the Certificate Manager.

To manage Firefox's certificates, you need to specify the location of the certificate to import
(source) and the location where you want to deliver it (target). The source location can be local,
on a file server, etc.

![certificates_1](/img/product_docs/endpointpolicymanager/applicationsettings/preconfigured/firefox/certificate/certificates_1.webp)

Figure 43. Specifying the Firefox certificate location.

Target locations require a keyword to specify the location. The possible values are listed in
Table 3.

Table 3: Keywords for target locations.

| Keyword    | Location      | Note                                          |
| ---------- | ------------- | --------------------------------------------- |
| Root       | Authorities   | Root and Intermediate Certificate Authorities |
| Trusted    | Servers       |                                               |
| People     | People        |                                               |
| Your Certs | Not Supported |                                               |
| Other      | Not Supported |                                               |

You can also specify how often (in days) the source certificate file should be checked for changes
using the following: `\\DC\Share\Fabrikam-CA.cer, 1, ROOT, add`. If the optional parameter is not
specified, it defaults to 0, meaning that the client-side extension (CSE) will re-read the
certificate file every time Firefox starts. Note that if the file is unavailable or the remote
location is offline, the launch of Firefox is not slowed down. Additionally, you might want to
deliver certificates to all these stores, as shown in Figure 44.

![certificates_2](/img/product_docs/endpointpolicymanager/applicationsettings/preconfigured/firefox/certificate/certificates_2.webp)

Figure 44. Editing the trust settings.

To do so, use the following syntax: `\\Server\Share\FF.cer,1,C;C;C,add`. Note that the certificate
authority is omitted in this correct syntax. For more information on this advanced syntax, see the
following

**NOTE:**
[http://www.endpointpolicymanager.com/knowledge-base/preconfigured-paks/firefox-how-can-i-deliver-certificates-to-certificate-authority-store-and-select-websites-mail-users-and-software-makers.html](http://www.endpointpolicymanager.com/knowledge-base/preconfigured-paks/firefox-how-can-i-deliver-certificates-to-certificate-authority-store-and-select-websites-mail-users-and-software-makers.html).

**NOTE:** In order to decrease network load, you may want to specify the number of days explicitly.

To delete a certificate, you must know its SHA 1 fingerprint. You do not need to specify where the
certificate is currently stored; if the fingerprint matches a certificate in any store, it is
removed.

![certificates_3](/img/product_docs/endpointpolicymanager/applicationsettings/preconfigured/firefox/certificate/certificates_3.webp)

Figure 45. SHA Fingerprint location.

## Exporting Certificates to the Binary-Encoded DER Format

Endpoint Policy Manager can only work with binary-encoded DER certificates. If you have a
certificate of another type, you may import it first into Firefox. Then, you can immediately export
it as a DER file, as shown in Figure 46.

![certificates_4](/img/product_docs/endpointpolicymanager/applicationsettings/preconfigured/firefox/certificate/certificates_4.webp)

Figure 46. Explorting a certificate as a DER.

You can optionally perform the same type of export by looking at the file itself in the Details tab
of Explorer, and then selecting the "Copy to File" button. Then, select "DER encoded binary X.509
(CER)," as shown in Figure 47.

![certificates_5](/img/product_docs/endpointpolicymanager/applicationsettings/preconfigured/firefox/certificate/certificates_5.webp)

Figure 47. Exporting via Explorer.

## Troubleshooting Certificates

If you are not seeing the results you expect, you can look in Endpoint Policy Manager's logs (see
Book 3: Application Settings Manager for more information) as well as Firefox's log. An example of
Endpoint Policy Manager's log showing that certificates are correctly being added can be seen in
Figure 48.

![certificates_6](/img/product_docs/endpointpolicymanager/applicationsettings/preconfigured/firefox/certificate/certificates_6.webp)

Figure 48. The Endpoint Policy Manager log with certificate details.

You can also use Firefox's log by clicking Ctrl+Shift+J on any page. In the log below (Figure 49),
you can see certificates being added to the proper stores.

![certificates_7](/img/product_docs/endpointpolicymanager/applicationsettings/preconfigured/firefox/certificate/certificates_7.webp)

Figure 49. The Firefox log with certificate details.

The most common reasons for certificates not showing up the store you want are the following:

- The certificate is NOT in binary/DER format. See the preceding section "Exporting Certificates to
  the Binary-Encoded DER Format" in order to get certificates into the correct format first.
- The certificate is not designed to work in the store of your choice. For instance, you've selected
  an email certificate and tried to use it in the ROOT or CA store.
- You have misspelled the name of the file. For instance, the file is named

```
\\server\share\file123.cer but you specified 
\\server\share\file123 or 
\\server\share\file123.x509.
```

- When specifying a certificate and the number of days after which Endpoint Policy Manager should
  check for updates, you have transposed the values. The correct way to specify a certificate and
  have Endpoint Policy Manager check for updates every two days is

`\\DC\Share\Fabrikam-CA.cer, 2, CA`, add and not

`\\DC\Share\Fabrikam-CA.cer, CA, 2, add`. In the logs, you would see this transposition error as
shown in Figure 50.

![certificates_8](/img/product_docs/endpointpolicymanager/applicationsettings/preconfigured/firefox/certificate/certificates_8.webp)

Figure 50. Log showing a transposition error.
