---
title: "FortiFlex WebUI"
date: 2025-06-10
weight: 31
chapter: false
---

|                            |                                                                                                                                                                   |  
|:--------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Goal**                   | Gain Experience with the FortiFlex WebUI                                                                                                                          |
| **Task**                   | Create a FortiFlex configuration and entitlement, deploy a FortiGate VM in Azure using the entitlement, and then update the configuration to increase vCPU count.
| **Validation** | FortiFlex Licensed 4vCPU FortiGate VM in Azure with matching SN and License.                                                                                      |

In this section, you'll learn how to manage FortiFlex entitlements through the FortiCloud web interface, providing a foundational understanding of FortFlex,
{{% notice note %}}
If you need help accessing Azure FortiCloud/FortiFlex Portal, please refer to the [Workshop Setup Guide](../02-quickstart/setup-guide.html) page from QuickStart.
{{% /notice %}}



### Step 1: Create a Configuration

Every FortiFlex  subscription starts with a configuration. A configuration defines the product type, form factor, and service package for your FortiFlex subscription. You can create multiple configurations to manage different products or services.

{{< tabs >}} 

{{% tab title="Access FortiFlex Dashboard" %}}

**Start from the FortiCloud Dashboard**
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

  - Name: **`XPerts25-FGT-VM`** (or any name you prefer)
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

Click on **List** to go back to the Entitlement Listing and retrieve the Entitlement Token
{{% /tab %}}

{{% tab title="License File Token" %}}
From the entitlement details page, copy the License File Token. You will need this token to activate your FortiGate VM in the next step. {{< figure src="entitle-token.png" alt="Entitlement Token" >}}
{{% /tab %}}
{{< /tabs >}}

### Step 3: Create a FortiGate VM in Azure & License with Flex Entitlement

Now that you have an entitlement, you can assign it to your FortiGate VM in Azure.
Login to the Azure portal and follow these steps:

{{< tabs >}}

{{% tab title="Azure Marketplace" %}}
Navigate into your Resource Group and click on the **+ Create** located at the top left of the tool bar.   You will be redirected to the Azure Marketplace.

In the Marketplace search bar, type: **`Fortinet FortiGate`** and then enter.  Navigate to the **Fortinet FortiGate Next-Generation Firewall** offering from Fortinet and select **Create** and **Single VM**.

{{< figure src="azure-mktp.png" alt="Azure Marketplace" >}}

 You will be redirected to the **Create Single VM** template.

{{% notice warning %}}
Make sure you select the **BYOL** (Bring Your Own License) option.  This is important as it allows you to use your FortiFlex entitlement.  When you click **Create** on the listing, you should see options for **Active-Active, Active-Passive, and Single VM**.  

If you see anything referencing **PAYG (Pay-As-You-Go)**, you are viewing the wrong listing.
{{% /notice %}}

{{% /tab %}}

{{% tab title="Create FGT VM" %}}

1. Under the **Basics** tab, the **Subscription** and **Resource Groups** should already be filled in with your assigned info.  If not, see the screen shot below for details.

{{< notice note >}}
Use the **flexXX** username you've been assigned. Replace **[XX]** with your specific number.
{{% /notice %}}

 - Under **Instance details**, select/enter the following:
     - **Region**: **East US**
     - **FGT VM instance Architecture**: **ARM64**
     - **FortiGate administrative username**: `flex[XX]`
     - **FortiGate password**/**Confirm password**:  `FortinetAzure2025!`
     - **Fortigate Name Prefix**:  `flex[XX]`
     - **Resource Group**: `flex[XX]-flex104-workshop`
 - Select **Next**.

 {{< figure src="createVM-basic.png" alt="VM Creation Basics" >}}

{{% /tab %}} 


{{% tab title="Assign Entitlement" %}}

In the Instance Details tab, scroll down to the **License** section, and check the box for **Use FortiFlex Entitlement** entering the License File Token you copied earlier.

{{< figure src="createVM-FlexLicense.png" alt="VM Creation Flex License" >}}

{{% /tab %}}

{{% tab title="Disable Accel Net" %}}

In the Networking tab, scroll down to the **Accelerated Networking** section and select **Disabled**. This feature can be enabled with specific instance types but for this example it's not relevant.

{{< figure src="createVM-accelnet.png" alt="VM Networking" >}}

{{% /tab %}}

{{% tab title="Review & Create" %}}
Review all the settings in the **Review + create** tab. Ensure that everything is correct, especially the License File Token. Click on **Create** to deploy the FortiGate VM.

{{< figure src="createVM-create.png" alt="VM Create" >}}

{{% /tab %}}

{{% tab title="Deploy in progress" %}}
You'll see the deployment in progress. This may take a few minutes. Once completed, you can navigate to the resource to manage your FortiGate VM.

{{< figure src="azure-vm-create-in-progress.png" alt="VM in progress" >}}
{{< figure src="azure-vm-deploy-complete.png" alt="VM Complete" >}}
{{% /tab %}}
{{< /tabs >}}

### Step 4: Verify the FortiGate VM Licensing

{{< tabs >}}
{{% tab title="Access FortiGate VM" %}}
From the Resource Group, **click on** to the FortiGate VM you just created. Note the public IP address assigned to the VM. You can use this IP to access the FortiGate CLI or GUI.
{{< figure src="azure-rg-vm.png" alt="VRG VM" >}}

Copy the Public IP address. {{< figure src="azure-vm-Pubip.png" alt="VM Public IP" >}}
{{% /tab %}}

{{% tab title="FGT Web UI" %}}
- In a **new browser tab**, enter the **public IP address** of the FortiGate VM in the address bar
- Accept the security warnings for the unsigned Cert. 
- You will be prompted to log in. 
- Use the username and password you set during the VM creation (e.g., `flexXX` and `FortinetAzure2025!`).

{{< figure src="fgt-login.png" alt="FGT Login" >}}

You can skip the inital setup be choosing **Later**
{{% /tab %}}

{{% tab title="FGT License"  %}}
 You'll see the FortiGate Status Dashboard where the License will show 2 vCPU.  The SN will match the entitlement you created in FortiFlex.

<div>
   {{< figure src="fgt-vm-sn.png" alt="FGT SN" >}}
   {{< figure src="flex-vm-sn.png" alt="Flex SN" >}}
</div>

You can also verify the license via CLI.
```get system status``` 
You will see the matching SN, with Valid License, and the number of vCPU's allowedreflecting the assigned entitlement. {{< figure src="fgt-SYSTEM-STATUS.png" alt="FGT License Info" >}}
{{% /tab %}}

{{< /tabs >}}

### Step 5: Update the Flex Config & Entitlement to add Additional new vCPU count
Next, we'll update the FortiFlex configuration to increase the licensed vCPU count.

{{< tabs >}} 

{{% tab title="Edit Configuration"%}}
In the FortiFlex dashboard, navigate to the Configurations tab. Select the configuration you created earlier and click on the edit icon. {{< figure src="flex-config-edit.png" alt="Edit Config" >}}
Click **Next** to continue past the product selection screen. 
{{% /tab %}}

{{% tab title="Change vCPUs"%}}
Update the number of CPU's to **4** and click **Next** until you reach the review screen. {{< figure src="flex-config-cpu-increase.png" alt="Edit Config vCPU" >}}
{{% /tab %}}

{{% tab title="Review & Submit"%}}
Click **Submit** to save the changes

You will see a warning message, and you should click to **Confirm** the changes. {{< figure src="flex-config-edit-confirm.png" alt="Edit Config Confirm" >}}

The entitlement linked this configuration will automatically reflect the vCPU change.
{{% /tab %}}


{{< /tabs >}}

### Step 6: Double the vCPU on the Azure FortiGate VM
Now, we'll change the VM size in Azure to double the vCPU from 2 to 4.

{{< tabs >}} 

{{% tab title="Resize the VM" %}}
Go to the VM Overview Page and then on left side click on **Availability + scale** and then **Size**. Select a size that has 4 vCPUs (e.g., Standard D4ps V6) and click "Resize". {{< figure src="azure-vm-resize.png" alt="Azure Resize VM" >}}

You'll see a confirmation message that the resize is in progress. This may take a few minutes. 

Proceed when you see the successful message {{< figure src="azure-vm-resize-success.png" alt="Azure Resize Success" >}}
{{% /tab %}}

{{% tab title="Start the VM"%}}
After resizing, start the FortiGate VM again from the Azure portal. {{< figure src="azure-vm-start.png" alt="Azure Start VM" >}}
{{% /tab %}}

{{% tab title="Verify CPU Count" %}}
On the VM Overview Page, you can verify that the VM size has been updated to reflect the new vCPU count. {{< figure src="azure-vm-4vcpu.png" alt="Azure VM Size" >}}
{{% /tab %}}

{{< /tabs >}}

### Step 7: Add the additional CPU's to FortiGate


Finally, log back into the FortiGate VM WebUI to verify that the license now reflects the updated vCPU count, and add the additional CPU's to the FortiGate configuration.

{{< tabs >}}
{{% tab title="Access FortiGate VM" %}}
From the Resource Group, **click on** to the FortiGate VM you just created. Note the public IP address assigned to the VM. You can use this IP to access the FortiGate CLI or GUI.
{{< figure src="azure-rg-vm.png" alt="VRG VM" >}}
Copy the Public IP address. {{< figure src="azure-vm-Pubip.png" alt="VM Public IP" >}}
{{% /tab %}}

{{% tab title="FGT Web UI" %}}
- In a **new browser tab**, enter the **public IP address** of the FortiGate VM in the address bar
- Accept the security warnings for the unsigned Cert. 
- You will be prompted to log in. 
  - Use the username and password you set during the VM creation (e.g., `flexXX` and `FortinetAzure2025!`).
  - You can skip the inital setup by choosing **Later**
  - You'll see the FortiGate Status Dashboard where the License will show 2/4 Allocated vCPU 
  - You can also verify the vCPU via CLI.
  - ```get system status```
  - You will **2/4 vCPU**. {{< figure src="vm-4cpu-lic.png" alt="FGT License Info 4vCPU" >}}
{{% /tab %}}
   
{{% tab title="Add CPU's to FGT" %}}
To add the additional CPU's to the FortiGate configuration, open the system CLI and run the following commands:

```bash
exec cpu add 2
```

Then verify the CPU count again:

```bash
get system status
```
You should now see **4/4 vCPU** allocated. {{< figure src="vm-4-4-cpu-lic.png" alt="FGT License Info 4vCPU Added" >}}
{{% /tab %}}
{{< /tabs >}}