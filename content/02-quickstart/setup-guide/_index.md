---
title: "Workshop Setup Guide"
date: 2025-06-10
weight: 21
chapter: false
---

## Prerequisites Checklist

Before starting the hands-on lab, ensure you have:

- [ ] **Azure Portal Access**: Valid Azure subscription credentials
- [ ] **Fortinet Support Portal Account**: Registered account with FortiFlex access
- [ ] **Postman Installed**: Desktop application or web version
- [ ] **Web Browser**: Chrome, Firefox, or Edge (latest version)
- [ ] **Lab Environment Access**: Resource group and permissions provided by instructor

## Step 1: Azure Portal & Cloudshell Access

Use these steps to access your Azure Portal environment.

{{< tabs >}}
{{% tab title="Azure Portal & Cloudshell Setup" %}}
Open a browser and access the following URL: **[https://portal.azure.com]**(https://portal.azure.com)

Use the credentials provided in the email you got from **<fortinetsecdevops@gmail.com>**.

 - **Username**:  "**<flexxx@fortinetcloud.onmicrosoft.com>**"
1. Enter Temporary access credentials, and click **Sign In**
   {{< figure src="Azure-AccessPass.png" alt="Azure Access Pass" >}}

1. Click **No** on the 'Stay signed in?' prompt
1. Click **Get started** on the 'Welcome to Microsoft Azure' page.
1. Click **Skip** on the 'How do you plan to use Azure' page.
1. Click **Skip** on the 'Now, let show you around Azure' page.
1. Click on the **Home** link in the upper left corner.

    {{< figure src="Azure-Home.png" alt="Azure Home" >}}

{{% /tab %}}
{{% tab title="Verify Resource Group" %}}

   - After login, you should see the Azure dashboard
   - Locate your assigned resource group: `flex[XX]`
     {{< figure src="Azure-portal-RG.png" alt="Azure Resource Group" >}}

{{% /tab %}}

{{% tab title="Open Cloud Shell" %}}
1. Click the **Cloud Shell** icon in the top navigation bar and Select **Bash** as the shell type
{{< figure src="cloudshell-06.png" alt="Azure Cloud Shell" >}}
3. Wait for the Cloud Shell to initialize

   
{{% /tab %}}

{{% tab title="Cloudshell storage" %}}
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
  * resource group will be **"student number"-flex105-workshop** 
  * storage account name will be "student number" floolowed by some random numbers and letters
  * File share will be **cloudshellshare**
  * Click **Select**

    {{< figure src="cloudshell-09.png" alt="Azure Cloud Shell Storage Account" >}}
  
{{% /tab %}}
{{< /tabs >}}


## Step 2: Fortinet Support Portal Access

{{% notice style="tip" %}}
We've provisioned a Fortinet Support Portal account with appropriate Flex entitlements for this workshop  Same credentials as the Azure Portal, slightly different logon procedure.
{{% /notice %}}


{{< tabs >}}

{{% tab title="Fortinet Support Portal" %}}

Browse to the following URL: **[https://customersso1.fortinet.com/saml-idp/proxy/demo_sallam_okta/login/]**(https://customersso1.fortinet.com/saml-idp/proxy/demo_sallam_okta/login/)

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

   ![FortiFlex Navigation](/images/fortiflex-navigation.png)

{{% /tab %}}

{{< /tabs >}}




## Step 3: Postman Setup

### Installing Postman

**Option 1: Desktop Application (Recommended)**
1. Download from [https://www.postman.com/downloads/](https://www.postman.com/downloads/)
2. Install following the standard process for your operating system
3. Create a free Postman account when prompted

**Option 2: Web Version**
1. Go to [https://web.postman.co/](https://web.postman.co/)
2. Sign in with your Google or create a Postman account

### Importing FortiFlex Collection

1. **Download the Collection**
   - Go to [https://github.com/FortinetCloudCSE/fortiflexvm-api](https://github.com/FortinetCloudCSE/fortiflexvm-api)
   - Download `FortiFlex-API-Collection.json`

2. **Import into Postman**
   - Open Postman
   - Click "Import" button
   - Select the downloaded JSON file
   - Verify the collection appears in your workspace

   ![Postman Import](/images/postman-import.png)

3. **Configure Environment Variables**
   - Click the gear icon to manage environments
   - Create new environment called "FortiFlex Lab"
   - Add the following variables:
     - `baseUrl`: `https://support.fortinet.com/ES/api/fortiflex`
     - `apiKey`: `[Will be provided during lab]`

   ![Postman Environment](/images/postman-environment.png)

## Step 4: Lab Environment Verification

### Connectivity Test

1. **Test Azure Access**
   - Navigate to your resource group
   - Click on the virtual network
   - Verify you can see subnet configurations

2. **Test FortiFlex Access**
   - Log into the FortiFlex dashboard
   - Try navigating to different sections
   - Verify no error messages appear

3. **Test Postman**
   - Open the imported FortiFlex collection
   - Select the "Get Configurations" request
   - Verify the request structure looks correct

### Troubleshooting Common Issues

**Azure Portal Issues**:
- **Problem**: Can't see resource group
- **Solution**: Verify you're using the correct subscription, check with instructor

**FortiFlex Access Issues**:
- **Problem**: Don't see FortiFlex menu option
- **Solution**: Account may need FortiFlex access enabled, contact instructor

**Postman Issues**:
- **Problem**: Collection won't import
- **Solution**: Download collection again, ensure it's the correct JSON format

## Next Steps

Once you've completed all setup steps:

1. Verify you can access all three platforms (Azure, FortiFlex WebUI, Postman)
2. Take note of your assigned student number for naming conventions
3. Review the FAQ section for common questions
4. Proceed to the hands-on lab when ready

---

**Setup Complete?** Let's address some common questions before diving into the lab.

[Next: FAQ →](./faq/)
