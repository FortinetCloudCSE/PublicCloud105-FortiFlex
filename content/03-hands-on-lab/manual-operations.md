---
title: "Manual Device Entitlement with FortiFlex WebUI"
date: 2025-06-10
weight: 31
chapter: false
---

# Manual Device Entitlement with FortiFlex WebUI

In this section, you'll learn how to manually manage FortiFlex entitlements through the web interface. This provides the foundation before moving to API automation.

## Lab Exercise 1: Create a Configuration

### Step 1: Access FortiFlex Dashboard

1. **Login to Fortinet Support Portal**
   - Navigate to [https://support.fortinet.com](https://support.fortinet.com)
   - Use your lab credentials to log in
   - Click on "FortiFlex" in the navigation menu

2. **Navigate to Configurations**
   - In the FortiFlex dashboard, click "Configurations"
   - You should see an empty list or existing lab configurations
   
   ![FortiFlex Configurations](/images/fortiflex-configs-empty.png)

### Step 2: Create New Configuration

1. **Start Configuration Creation**
   - Click the "Create Configuration" button
   - You'll see the configuration wizard

   ![Create Configuration Button](/images/create-config-button.png)

2. **Basic Configuration Settings**
   - **Configuration Name**: `FortiGate-Azure-Student[XX]`
     - Replace `[XX]` with your assigned student number
   - **Description**: `Workshop configuration for Azure FortiGate deployment`
   - **Product Type**: Select "FortiGate VM"

   ![Configuration Basic Settings](/images/config-basic-settings.png)

3. **Platform Configuration**
   - **Cloud Platform**: Select "Microsoft Azure"
   - **Region**: Choose "East US" (or your preferred Azure region)
   - **VM Series**: Select "FortiGate VM Standard"

   ![Platform Configuration](/images/config-platform-settings.png)

4. **Resource Configuration**
   - **CPU Configuration**: Start with "2 vCPU"
   - **RAM**: This will auto-populate based on CPU selection
   - **Bandwidth**: Leave at default setting
   - **Storage**: Use default settings

   ![Resource Configuration](/images/config-resource-settings.png)

5. **Advanced Settings** (Optional)
   - **Support Level**: Select "Standard Support"
   - **Additional Features**: Leave defaults for now
   - **Tags**: Add any relevant tags for organization

6. **Review and Create**
   - Review all settings on the summary page
   - Click "Create Configuration"
   - Wait for confirmation message

   ![Configuration Summary](/images/config-summary.png)

### Step 3: Verify Configuration Creation

1. **Check Configuration List**
   - Return to the Configurations main page
   - Verify your new configuration appears in the list
   - Note the configuration ID (you'll need this later)

   ![Configuration List](/images/config-list-with-new.png)

2. **Review Configuration Details**
   - Click on your configuration name
   - Review all the settings you configured
   - Make note of the point consumption rate (points per hour)

{{% notice tip %}}
**Understanding Point Consumption**: A 2 vCPU FortiGate typically consumes 2 points per hour. This rate scales with the VM size.
{{% /notice %}}

## Lab Exercise 2: Entitle a 2CPU VM FortiGate Device

### Step 1: Create Azure Virtual Machine

Before creating the FortiFlex entitlement, we need to deploy the FortiGate VM in Azure.

1. **Navigate to Azure Portal**
   - Open [https://portal.azure.com](https://portal.azure.com) in a new tab
   - Navigate to your resource group: `fortiflex-lab-student[XX]`

2. **Create Virtual Machine**
   - Click "Create" → "Virtual machine"
   - **Basics Tab**:
     - **Subscription**: Use your lab subscription
     - **Resource Group**: `fortiflex-lab-student[XX]`
     - **Virtual machine name**: `FortiGate-Student[XX]`
     - **Region**: Same as your FortiFlex configuration
     - **Image**: Search for "Fortinet FortiGate" and select the latest version

   ![Azure VM Creation - Basics](/images/azure-vm-basics.png)

3. **VM Size Configuration**
   - **Size**: Select "Standard_D2s_v3" (2 vCPUs, 8 GB RAM)
   - This matches our FortiFlex 2CPU configuration

   ![Azure VM Size Selection](/images/azure-vm-size.png)

4. **Networking Configuration**
   - **Virtual network**: Select `fortiflex-vnet`
   - **Subnet**: Select the external subnet
   - **Public IP**: Create new
   - **Network security group**: Use existing lab NSG

5. **Complete VM Creation**
   - Review settings and create the VM
   - Wait for deployment to complete (5-10 minutes)
   - Note the VM's serial number from the overview page

### Step 2: Create FortiFlex Entitlement

1. **Return to FortiFlex Dashboard**
   - Navigate back to the FortiFlex portal
   - Click on "Entitlements" in the main menu

   ![Entitlements Navigation](/images/entitlements-nav.png)

2. **Create New Entitlement**
   - Click "Create Entitlement"
   - Select your configuration: `FortiGate-Azure-Student[XX]`

   ![Create Entitlement](/images/create-entitlement.png)

3. **Entitlement Configuration**
   - **Configuration**: Your previously created configuration
   - **Count**: 1 (we're creating one entitlement)
   - **Description**: `Student[XX] FortiGate Workshop VM`
   - **Start Time**: Immediate (leave default)
   - **End Time**: Leave blank for ongoing entitlement

   ![Entitlement Settings](/images/entitlement-settings.png)

4. **Complete Entitlement Creation**
   - Review the settings
   - Note the points consumption estimate
   - Click "Create Entitlement"

   ![Entitlement Creation Confirmation](/images/entitlement-confirm.png)

### Step 3: Apply License to FortiGate

1. **Get Entitlement Details**
   - In the FortiFlex portal, go to your new entitlement
   - Copy the license/serial number provided
   - Note the entitlement ID

   ![Entitlement Details](/images/entitlement-details.png)

2. **Connect to FortiGate**
   - In Azure portal, get your FortiGate's public IP
   - Open browser to `https://[FortiGate-Public-IP]`
   - Accept the SSL certificate warning
   - You should see the FortiGate login screen

   ![FortiGate Login Screen](/images/fortigate-login.png)

3. **Initial FortiGate Setup**
   - Default username: `admin`
   - Default password: Check Azure VM serial number or use blank
   - After login, you'll see the licensing screen

4. **Apply FortiFlex License**
   - The FortiGate should automatically detect the FortiFlex entitlement
   - If not, go to **System** → **Status**
   - Verify the license shows as "Valid" with FortiFlex type

   ![FortiGate License Status](/images/fortigate-license-status.png)

### Step 4: Verify Successful Entitlement

1. **Check FortiFlex Dashboard**
   - Return to FortiFlex portal
   - Go to Entitlements list
   - Your entitlement should show status "Active"
   - Points consumption should show as running

   ![Active Entitlement](/images/entitlement-active.png)

2. **Verify FortiGate Operations**
   - In FortiGate WebUI, navigate through the interface
   - Check **System** → **Status** for license details
   - Verify all features are unlocked

{{% notice success %}}
**Success!** You've successfully created a FortiFlex configuration and entitled a FortiGate VM. The device is now consuming FortiFlex points and all features are available.
{{% /notice %}}

## Lab Exercise 3: Change Device to 4 CPU VM

Now we'll demonstrate FortiFlex's flexibility by scaling up the VM and adjusting the entitlement to match.

### Step 1: Stop Current Entitlement

1. **Access Current Entitlement**
   - In FortiFlex portal, go to "Entitlements"
   - Find your active entitlement for Student[XX]
   - Click on the entitlement name to view details

   ![Current Entitlement](/images/current-entitlement.png)

2. **Stop the Entitlement**
   - Click the "Stop" button in the entitlement details
   - Confirm the action when prompted
   - Wait for status to change to "Stopped"

   ![Stop Entitlement](/images/stop-entitlement.png)

{{% notice warning %}}
**Important**: Always stop the FortiFlex entitlement before resizing the Azure VM to avoid billing discrepancies.
{{% /notice %}}

### Step 2: Resize Azure VM

1. **Navigate to Azure VM**
   - Go to Azure portal
   - Find your FortiGate VM: `FortiGate-Student[XX]`
   - Click on the VM name to open details

2. **Stop the VM**
   - Click "Stop" button in the VM overview
   - Wait for VM to fully stop (status: "Stopped (deallocated)")

   ![Azure VM Stop](/images/azure-vm-stop.png)

3. **Change VM Size**
   - In the left menu, click "Size"
   - Find and select "Standard_D4s_v3" (4 vCPUs, 16 GB RAM)
   - Click "Resize"

   ![Azure VM Resize](/images/azure-vm-resize.png)

4. **Start the VM**
   - After resize completes, click "Start"
   - Wait for VM to boot up completely
   - Verify new size in VM overview

   ![Azure VM New Size](/images/azure-vm-new-size.png)

### Step 3: Create New 4CPU Configuration

Since our original configuration was for 2CPU, we need a new configuration for 4CPU.

1. **Create 4CPU Configuration**
   - Return to FortiFlex → Configurations
   - Click "Create Configuration"
   - Use these settings:
     - **Name**: `FortiGate-Azure-4CPU-Student[XX]`
     - **Description**: `4 vCPU configuration for scaled FortiGate`
     - **Product Type**: FortiGate VM
     - **Platform**: Microsoft Azure
     - **CPU Configuration**: 4 vCPU
     - **Other settings**: Same as previous configuration

   ![4CPU Configuration](/images/4cpu-config.png)

2. **Verify Configuration Creation**
   - Confirm the new configuration appears in the list
   - Note the higher point consumption rate (4 points/hour vs 2 points/hour)

## Lab Exercise 4: Update FortiFlex Entitlement to 4 CPU

### Step 1: Create New 4CPU Entitlement

1. **Create New Entitlement**
   - Go to Entitlements → "Create Entitlement"
   - Select your new 4CPU configuration
   - Use description: `Student[XX] FortiGate 4CPU Scaled`

   ![New 4CPU Entitlement](/images/new-4cpu-entitlement.png)

2. **Complete Entitlement Creation**
   - Review settings and create
   - Wait for entitlement to become active
   - Note the new serial number if different

### Step 2: Verify FortiGate Recognizes New License

1. **Connect to Resized FortiGate**
   - Access FortiGate WebUI using the same IP
   - Login with admin credentials
   - Navigate to **System** → **Status**

2. **Check License Status**
   - Verify license shows as valid
   - Confirm CPU count reflects 4 vCPUs
   - Check that all features remain available

   ![FortiGate 4CPU Status](/images/fortigate-4cpu-status.png)

### Step 3: Monitor Point Consumption

1. **View Usage Dashboard**
   - In FortiFlex portal, go to "Usage & Billing"
   - Select your current month
   - Compare consumption before and after scaling

   ![Usage Comparison](/images/usage-comparison.png)

2. **Analyze Cost Impact**
   - Previous consumption: 2 points/hour
   - New consumption: 4 points/hour (2x increase)
   - Calculate daily/monthly cost difference

{{% notice info %}}
**Cost Calculation Example**: 
- 2CPU: 2 points/hour × 24 hours = 48 points/day
- 4CPU: 4 points/hour × 24 hours = 96 points/day
- Daily increase: 48 points (100% increase)
{{% /notice %}}

### Step 4: Clean Up Original Entitlement

1. **Remove Old Entitlement**
   - Go to Entitlements list
   - Find your stopped 2CPU entitlement
   - Click "Delete" to remove it permanently
   - This prevents accidental reactivation

   ![Delete Old Entitlement](/images/delete-old-entitlement.png)

{{% notice success %}}
**Lab Section Complete!** You've successfully:
- Created FortiFlex configurations for different VM sizes
- Entitled a FortiGate VM with FortiFlex licensing
- Scaled the VM from 2CPU to 4CPU
- Updated the FortiFlex entitlement to match the new size
- Monitored the cost impact of scaling
{{% /notice %}}

## Key Takeaways from Manual Operations

**Flexibility**: FortiFlex allows real-time scaling to match business needs without procurement delays.

**Cost Visibility**: Point consumption scales linearly with VM size, providing predictable cost modeling.

**Operational Simplicity**: The WebUI makes complex licensing operations accessible to non-technical users.

**Best Practices Learned**:
- Always stop entitlements before VM resizing
- Create configurations for each VM size you'll use
- Monitor usage regularly to optimize costs
- Clean up unused entitlements to prevent billing errors

---

**Ready for automation?** Let's explore how to accomplish these same tasks through the FortiFlex API.

[Next: API Automation →](./api-automation/)
