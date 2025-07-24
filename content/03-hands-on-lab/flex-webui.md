---
title: "FortiFlex WebUI"
date: 2025-06-10
weight: 31
chapter: false
---

In this section, you'll learn how to manage FortiFlex entitlements through the FortiCloud web interface, providing a foundational understanding of FortFlex,

### Step 1: Create a Configuration

Every FortiFlex  subscription starts with a configuration. A configuration defines the product type, form factor, and service package for your FortiFlex subscription. You can create multiple configurations to manage different products or services.

{{< tabs >}} 

{{% tab title="Access FortiFlex Dashboard" %}}

**Login to Fortinet Support Portal**
- Navigate to [https://support.fortinet.com](https://support.fortinet.com)
- Use your credentials to log in
- Click on "FortiFlex" in the navigation menu {{< figure src="flex-menu.png" alt="FCLD Menu" >}}
{{% /tab %}}

{{% tab title="Create new Configuration" %}}

**Navigate to Configurations**
- In the FortiFlex dashboard, click "Configurations"
- You should see an empty list or existing lab configurations {{< figure src="flex-configsempty.png" alt="FCLD Menu" >}}
- Click the **+ New Configuration** button
{{% /tab %}}

{{% tab title="Config Wizard" %}}
You'll see the configuration wizard. Enter details as follows: 

  - Name: **XPerts25-FGT-VM** (or any name you prefer)
  - Select Form Factor: **Virtual Machines**
  - Product Type: **FortiGate Virtual Machine - Service Bundle**
  - Click **Next** {{< figure src="config-new.png" alt="Config Wizard" >}}
{{% /tab %}}

{{% tab title="Config Details" %}}
On the next screen, set the following details:

  - Number of CPU's: **2**
  - Service Package: **UTP**
  - Leave Virtual domains set to **0**
  - Click **Next** {{< figure src="config-details.png" alt="Config Details" >}}
{{% /tab %}}

{{% tab title="Config Review & Submit" %}}
Review the details of your configuration and click **Submit** {{< figure src="config-review.png" alt="Config Review" >}}
{{% /tab %}}

{{% tab title="Config Success" %}}
You'll see the config successfully created  {{< figure src="config-success.png" alt="Config Success" >}}
{{% /tab %}}
{{< /tabs >}}

### Step 2: Create an Entitlement

Once you have a configuration, you can create entitlements. An entitlement is a license that allows you to use the product defined in your configuration.

{{< tabs >}} 

{{% tab title="Create Entitlement"%}}
Navigate to the Flex Entitlements tab and click **+ New Entitlement** {{< figure src="entitle-new.png" alt="Flex Entitlements" >}}
{{% /tab %}}

{{% tab title="Entitlement Wizard" %}}
Fill in the following details in the entitlement wizard:

  - Product Type: Select **FortiGate Virtual Machine - Service Bundle**
  - Select the configuration you created above in Step 1 from the dropdown
  - Click **Next** {{< figure src="entitle-details.png" alt="Entitlement Wizard" >}}
{{% /tab %}}

{{% tab title="Entitlement Review & Submit" %}}
Review the details of your entitlement and click **Submit** {{< figure src="entitle-confirm.png" alt="Entitlement Review" >}}
{{% /tab %}}

{{% tab title="Entitlement Success" %}}
You'll see the entitlement successfully created. Serial Number for future reference. {{< figure src="entitle-success.png" alt="Entitlement Success" >}}
{{% /tab %}}

{{% tab title="License File Token" %}}
From the entitlement details page, copy the License File Token. You will need this token to activate your FortiGate VM in the next step. {{< figure src="entitle-token.png" alt="Entitlement Token" >}}
{{% /tab %}}
{{< /tabs >}}

### Step 3: Create a FortiGate VM in Azure & License with Flex Entitlement

Now that you have an entitlement, you can assign it to your FortiGate VM in Azure.
Login to the Azure portal and follow these steps:

{{< tabs >}}

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

{{% tab title="Azure Marketplace" %}}
Navigate into your Resource Group and click on the **+ Create** located at the top left of the tool bar.   You will be redirected to the Azure Marketplace.

In the Marketplace search bar, enter **Fortinet FortiGate** and then enter.  Navigate to the **Fortinet FortiGate Next-Generation Firewall** offering from Fortinet and select **Create** and **Single VM**.

{{< figure src="azure-mktp.png" alt="Azure Marketplace" >}}

 You will be redirected to the **Create Single VM** template.

{{% /tab %}}

{{% tab title="Create FGT VM" %}}

{{< figure src="Azure-FGT-Marketplace.png" alt="Azure FGT Marketplace" >}}



1. Under the **Basics** tab, the **Subscription** and **Resource Groups** should already be filled in with your assigned info.  If not, see the screen shot below for details.

    - Under **Instance details**, select/enter the following:
        - **Region**:  "**East US**"  
        - **FGT VM instance Architecture**:  "**ARM64**"
        - **FortiGate administrative username**:  "**flexxx**"
        - **FortiGate password**/**Confirm password**:  "**FortinetAzure2025!**"
        - **Fortigate Name Prefix**:  "**flexxx**"
    - Select **Next**.

 {{< figure src="createVM-basic.png" alt="VM Creation Basics" >}}

{{% /tab %}} 


{{% tab title="Assign Entitlement" %}}
In the Instance Details tab, scroll down to the **License** section, and check the box for **Use FortiFlex Entitlement** entering the License File Token you copied earlier. {{< figure src="fgt-license.png" alt="FGT License" >}}

{{< figure src="createVM-FlexLicense.png" alt="VM Creation Flex License" >}}

-------------------


```
execute vm-license <paste-your-token-here>
```
You should see a confirmation message indicating the entitlement was successfully assigned. {{< figure src="fgt-token.png" alt="FGT Assign Token" >}}
{{% /tab %}}

{{% tab title="Create VM" %}}

In the Networking tab, scroll down to the **Accelerated Networking** section and select **Disabled**. This feature can be enabled with specific instance types but for this example it's not relevant.

{{< figure src="createVM-accelnet.png" alt="VM Networking" >}}

{{% /tab %}}

{{% tab title="Review & Create" %}}
Review all the settings in the **Review + create** tab. Ensure that everything is correct, especially the License File Token. Click on **Create** to deploy the FortiGate VM.

{{< figure src="createVM-create.png" alt="VM Create" >}}

{{% /tab %}}

{{% tab title="Verify Licensing" %}}
To verify the license assignment, run the following command on the FortiGate VM CLI:

```get system status``` 
You should see the license information reflecting the assigned entitlement. {{< figure src="fgt-license.png" alt="FGT License Info" >}}
{{% /tab %}}

{{% tab title="FortiGate GUI" %}}
You can also log in to the FortiGate GUI using the public IP address of the VM. Navigate to the dashboard to see the license status and other system information. {{< figure src="fgt-gui.png" alt="FGT GUI" >}}
{{% /tab %}}
{{< /tabs >}}

### Step 4: Double the vCPU on the Azure FortiGate VM
You can change the VM size in Azure to double the vCPU from 2 to 4.

{{< tabs >}} 

{{% tab title="Stop the VM" %}}
In the Azure portal, stop the FortiGate VM before resizing it. {{< figure src="azure-stop.png" alt="Azure Stop VM" >}}
{{% /tab %}}

{{% tab title="Resize the VM" %}}
Once the VM is stopped, click on "Size" in the VM settings. Select a size that has 4 vCPUs (e.g., Standard_DS2_v2) and click "Resize". {{< figure src="azure-resize.png" alt="Azure Resize VM" >}}
{{% /tab %}}

{{% tab title="Start the VM"%}}
After resizing, start the FortiGate VM again from the Azure portal. {{< figure src="azure-start.png" alt="Azure Start VM" >}}
{{% /tab %}}

{{% tab title="Verify on FortiGate"%}}
Log back into the FortiGate VM CLI and run `get system status` to verify that the vCPU count has been updated to 4. {{< figure src="fgt-vcpu.png" alt="FGT Verify vCPU" >}}
{{% /tab %}}

{{% tab title="Verify on FortiCloud"%}}
You can also check the FortiFlex dashboard to see if the configuration reflects the updated vCPU count. {{< figure src="flex-vcpu.png" alt="FortiFlex Verify vCPU" >}}
{{% /tab %}}

{{< /tabs >}}

### Step 5: Update the Flex Config & Entitlement to reflect the new vCPU count
After resizing the VM, you need to update the configuration & entitlement in FortiFlex to match the new vCPU count.

{{< tabs >}} 

{{% tab title="Edit Configuration"%}}
In the FortiFlex dashboard, navigate to the Configurations tab. Select the configuration you created earlier and click on the edit icon. {{< figure src="config-edit.png" alt="Edit Config" >}}
Click next to continue past the product selection screen. {{< figure src="config-edit1.png" alt="Edit Config Next" >}}
{{% /tab %}}

{{% tab title="Change vCPUs"%}}
Update the number of CPU's to **4** and click **Next** until you reach the review screen. {{< figure src="config-edit2.png" alt="Edit Config vCPU" >}}
{{% /tab %}}

{{% tab title="Review & Submit"%}}
Click **Submit** to save the changes. {{< figure src="config-edit-confirm.png" alt="Edit Config vCPU" >}}

You will see a warning message, and you should click to **Confirm** the changes. {{< figure src="config-review-confirm.png" alt="Edit Config Confirm" >}}
{{% /tab %}}

{{% tab title="Confirm Entitlement Change"%}}
The entitlement linked to this configuration will automatically reflect the vCPU change. Confirm via XYZ {{< figure src="entitle-check.png" alt="Check Entitlement" >}}
{{% /tab %}}

{{< /tabs >}}