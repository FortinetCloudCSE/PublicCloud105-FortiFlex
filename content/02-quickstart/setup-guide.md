---
title: "Workshop Setup Guide"
date: 2025-06-10
weight: 21
chapter: false
---

# Lab Setup Guide



## Prerequisites Checklist

Before starting the hands-on lab, ensure you have:

- [ ] **Azure Portal Access**: Valid Azure subscription credentials
- [ ] **Fortinet Support Portal Account**: Registered account with FortiFlex access
- [ ] **Postman Installed**: Desktop application or web version
- [ ] **Web Browser**: Chrome, Firefox, or Edge (latest version)
- [ ] **Lab Environment Access**: Resource group and permissions provided by instructor

## Step 1: Azure Portal Access

### Logging into Azure Portal

{{% tab title="Azure Portal" %}}
Open a browser and access the following URL: <https://portal.azure.com>

Use the credentials provided in the email you got from <fortinetsecdevops@gmail.com>.

 - **Username**:  "**<flexxx@fortinetcloud.onmicrosoft.com>**"
1. Enter Temporary access credentials
   {{< figure src="Azure-AccessPass.png" alt="Azure Access Pass" >}}

1. Click **Sign in**.
1. Click **No** on the 'Stay signed in?' prompt
1. Click **Get started** on the 'Welcome to Microsoft Azure' page.
1. Click **Skip** on the 'How do you plan to use Azure' page.
1. Click **Skip** on the 'Now, let show you around Azure' page.
1. Click on the **Home** link in the upper left corner.

    {{< figure src="Azure-Home.png" alt="Azure Home" >}}

{{% /tab %}}

1. **Navigate to Azure Portal**
   - Open your web browser
   - Go to [https://portal.azure.com](https://portal.azure.com)

2. **Sign In**
   - Use your provided lab credentials:
     - **Username**: `flex[XX]@.com`
     - **Password**: `[Provided in your email]`
   
   ![Azure Login Screen](/images/azure-login.png)

3. **Verify Access**
   - After login, you should see the Azure dashboard
   - Locate your assigned resource group: `fortiflex-lab-student[XX]`
   - Verify you can see the pre-configured virtual network

   ![Azure Dashboard](/images/azure-dashboard.png)

### Key Azure Resources

Your lab environment includes:

**Resource Group**: `fortiflex-lab-student[XX]`
- **Virtual Network**: `fortiflex-vnet`
  - **Subnets**: 
    - External: `10.0.1.0/24`
    - Internal: `10.0.2.0/24`
- **Network Security Groups**: Pre-configured with required rules
- **Storage Account**: For VM diagnostics and logs

## Step 2: Fortinet Support Portal Access

### Creating Your Support Portal Account

{{% notice tip %}}
If you already have a Fortinet Support Portal account, skip to the "Accessing FortiFlex" section.
{{% /notice %}}

1. **Navigate to Support Portal**
   - Go to [https://support.fortinet.com](https://support.fortinet.com)
   - Click "Register" in the top right corner

   ![Support Portal Homepage](/images/support-portal-home.png)

2. **Complete Registration**
   - Fill out the registration form with your details
   - Use your corporate email address
   - Select "Partner" as your customer type
   
   ![Registration Form](/images/support-portal-register.png)

3. **Email Verification**
   - Check your email for verification link
   - Click the link to activate your account

### Accessing FortiFlex

1. **Login to Support Portal**
   - Use your registered credentials
   - Navigate to the main dashboard

2. **Access FortiFlex**
   - Look for "FortiFlex" in the main navigation menu
   - Click to enter the FortiFlex dashboard

   ![FortiFlex Navigation](/images/fortiflex-navigation.png)

3. **Verify Access**
   - You should see the FortiFlex dashboard
   - Confirm you can see "Configurations" and "Entitlements" sections

   ![FortiFlex Dashboard](/images/fortiflex-dashboard.png)

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
