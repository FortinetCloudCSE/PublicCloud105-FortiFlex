---
title: Workshop Setup Guide
date: 2025-06-10
weight: 21
chapter: false
---

## Prerequisites Checklist

Before starting the hands-on lab, ensure you have completed the following setup steps and have the necessary tools ready:

- [ ] **Azure Portal Access**: Valid Azure subscription credentials
- [ ] **Fortinet Support Portal Account**: Registered account with FortiFlex access
- [ ] **Postman**: Desktop application, Web Version, or Azure VM
- [ ] **Web Browser**: Chrome, Firefox, or Edge (latest version)
- [ ] **Lab Environment Access**: Resource group and permissions provided by instructor

{{% notice tip %}}
Login URL's for all the portals used in this Workshop are perma-linked in the left navbar for easy reference!

To have the best experience, use a single browser for the entire workshop and all related logins.
{{% /notice %}}


## Step 1: Azure Portal & Cloudshell Access

Use these steps to access your Azure Portal environment.

{{< tabs >}}
{{% tab title="Azure Portal & Cloudshell Setup" %}}
Open a browser and access the following URL: **[https://portal.azure.com](https://portal.azure.com)**

Use the credentials provided in the email you got from **<fortinetsecdevops@gmail.com>**.

 - **Username**:  "**<flexxx@fortinetcloud.onmicrosoft.com>**"
1. Enter Temporary access credentials, and click **Sign In**
   {{< figure src="Azure-AccessPass.png" alt="Azure Access Pass" >}}

1. Click **No** on the 'Stay signed in?' prompt
1. Click **Get started** on the 'Welcome to Microsoft Azure' page.
1. Click **Skip** on the 'How do you plan to use Azure' page.
1. Click **Skip** on the 'Now, let show you around Azure' page.

{{% /tab %}}
{{% tab title="Verify Resource Group" %}}

   - After login, you should see the Azure dashboard
   - Locate your assigned resource group: `flex[XX]`
     {{< figure src="Azure-portal-RG.png" alt="Azure Resource Group" >}}

{{% /tab %}}

{{% tab title="Open Cloud Shell" %}}
1. Click the **Cloud Shell** icon in the top navigation bar and Select **Bash** as the shell type
{{< figure src="cloudshell-06.png" alt="Azure Cloud Shell" >}}

2. Wait for the Cloud Shell to initialize

* Next, you will see a "Getting started" page.
    * Select **Mount Storage Account**
    * Choose **Internal-Training** as the Storage account subscription
    * Click Apply

    {{< figure src="cloudshell-07.png" alt="Azure Cloud Shell Storage" >}}
{{% /tab %}}
{{% tab title="Mount Storage" %}}
* On the Mount storage account  screen 
  * click **Select existing storage account**
  * click **Next**

    {{< figure src="cloudshell-08.png" alt="Azure Cloud Shell Storage Mount" >}}
{{% /tab %}}

{{% tab title="Storage Account" %}}
* On the Select storage account screen (values in drop down)
  * choose **Internal-Training** as description
  * resource group will be **[XX]flex-flex105-workshop** where **[XX]** is your unique student number
  * storage account name will be "student number" followed by some random numbers and letters
  * File share will be **cloudshellshare**
  * Click **Select**

    {{< figure src="cloudshell-09.png" alt="Azure Cloud Shell Storage Account" >}}
  
{{% /tab %}}
{{< /tabs >}}


## Step 2: Fortinet Support Portal Access

{{% notice style="tip" %}}
We've provisioned a Fortinet Support Portal account with appropriate Flex entitlements for this workshop  Same credentials as the Azure Portal, slightly different logon procedure.  **YOU MUST LOGIN USING THIS URL** which is conveniently perma-listed on the left navbar, and as long as you use the same browser as your Azure login, you should be signed in with SAML SSO.

If your FortiCloud Login times out, click on the **FortiCloud Login** Link from the Left Navbar to get automatically logged back in.
{{% /notice %}}


{{< tabs >}}

{{% tab title="Fortinet Support Portal" %}}

Browse to the following URL: **[https://customersso1.fortinet.com/saml-idp/proxy/demo_sallam_okta/login/](https://customersso1.fortinet.com/saml-idp/proxy/demo_sallam_okta/login/)**

{{% notice style="warning" %}}
**Important**: PLEASE URL EXACTLY AS ABOVE, ENDING WITH <kbd>/</kbd>. Do not use general Fortinet Support Portal URL.
{{% /notice %}}

{{% /tab %}}
{{% tab title="Login Steps" %}}
Enter the credentials provided in the email you got from <fortinetsecdevops@gmail.com>

 - **Username**:  "**flex[XX]@fortinetcloud.onmicrosoft.com**"
 - **Temporary Access Password**:  "**[TemporaryPassword]**"

- You can choose **No** to "stay Signed In"
- You may have to click **"Login"** at the SAML Login Portal
{{% /tab %}}

{{% tab title="FortiFlex Dashboard" %}}
From the FortiCloud Main Portal, look for "FortiFlex" in the main navigation menu
   - Click to enter the FortiFlex dashboard

  {{< figure src="flex-menu.png" alt="FortiFlex Dashboard" class="center" >}}
{{% /tab %}}

{{< /tabs >}}




## Step 3: Postman Options

We will be using an existing Postman Collection to interact with the FortiFlex API
1. [Postman desktop application](https://www.postman.com/) will provide the best user experience and is a great tool for working with API's
2. If you can't install the Desktop client for some reason, you can use [Postman's web version](https://identity.getpostman.com/login?continue=https%3A%2F%2Fgo.postman.co%2Fhome) requiring a login (you can use your personal email)

### Installing Postman

**Option 1: Desktop Application (Recommended)**
<span style="font-size:2em; animation: pointLeft 1s infinite alternate;">👈</span>

<style>
@keyframes pointLeft {
  0% { transform: translateX(0); }
  100% { transform: translateX(-10px); }
}
</style>
1. Download from [https://www.postman.com/downloads/](https://www.postman.com/downloads/)
2. Install following the standard process for your operating system
3. Create a free Postman account when prompted

**Option 2: Web Version**
1. Go to [https://web.postman.co/](https://web.postman.co/)
2. Sign in with your Google or create a Postman account


**Setup Complete?** Let's address some common questions before diving into the lab.

