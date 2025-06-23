# Batch 4: Complete Hands-On Lab Content

## Manual Operations Lab (Part 1)

```bash
# Create content/03-hands-on-lab/manual-operations.md
cat > content/03-hands-on-lab/manual-operations.md << 'EOF'
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
EOF
```

## API Automation Lab (Part 2)

```bash
# Create content/03-hands-on-lab/api-automation.md
cat > content/03-hands-on-lab/api-automation.md << 'EOF'
---
title: "Automation using FortiFlex API"
date: 2025-06-10
weight: 32
chapter: false
---

# Automation using FortiFlex API

In this section, you'll learn how to automate FortiFlex operations using the REST API and Postman, then explore serverless automation with Azure Functions.

## Lab Exercise 5: FortiFlex API with Postman

### Step 1: API Authentication Setup

1. **Generate API Key**
   - In FortiFlex WebUI, go to "Administration" → "API Keys"
   - Click "Generate New API Key"
   - Provide description: `Workshop API Key Student[XX]`
   - Copy the generated key (you won't see it again!)

   ![API Key Generation](/images/api-key-generation.png)

2. **Configure Postman Environment**
   - Open Postman application
   - Click on "Environments" (gear icon)
   - Select your "FortiFlex Lab" environment
   - Update the `apiKey` variable with your generated key

   ![Postman API Key Config](/images/postman-api-key.png)

3. **Test Authentication**
   - In the FortiFlex collection, find "Get Account Info"
   - Click "Send" to test your API access
   - You should receive a 200 response with account details

   ![API Auth Test](/images/api-auth-test.png)

### Step 2: Review FortiFlex API Structure

1. **Explore API Collection**
   The FortiFlex API collection includes these key endpoints:

   **Configuration Management**:
   - `GET /configs` - List all configurations
   - `POST /configs` - Create new configuration
   - `GET /configs/{id}` - Get specific configuration
   - `PUT /configs/{id}` - Update configuration
   - `DELETE /configs/{id}` - Delete configuration

   **Entitlement Management**:
   - `GET /entitlements` - List all entitlements
   - `POST /entitlements` - Create new entitlement
   - `GET /entitlements/{id}` - Get specific entitlement
   - `PUT /entitlements/{id}` - Update entitlement
   - `DELETE /entitlements/{id}` - Delete entitlement

   **Usage and Billing**:
   - `GET /usage` - Get usage statistics
   - `GET /points` - Get points balance
   - `GET /billing` - Get billing information

2. **Understand Request Structure**
   
   **Authentication Header**:
   ```
   Authorization: Bearer {{apiKey}}
   ```

   **Content Type**:
   ```
   Content-Type: application/json
   ```

   **Base URL**:
   ```
   {{baseUrl}}/api/fortiflex/v2
   ```

### Step 3: Create Configuration via API

1. **Prepare Configuration Request**
   - In Postman, find "Create Configuration" request
   - Review the request body template:

   ```json
   {
     "name": "API-Config-Student{{studentNumber}}",
     "description": "Configuration created via API for workshop",
     "productType": "FortiGate VM",
     "platform": {
       "type": "azure",
       "region": "eastus"
     },
     "vmConfiguration": {
       "cpu": 2,
       "ram": 8,
       "bandwidth": 1000
     },
     "supportLevel": "standard",
     "tags": [
       {
         "key": "Environment",
         "value": "Workshop"
       },
       {
         "key": "Student",
         "value": "{{studentNumber}}"
       }
     ]
   }
   ```

2. **Execute Configuration Creation**
   - Update `{{studentNumber}}` with your assigned number
   - Click "Send" to create the configuration
   - Note the configuration ID in the response

   ![API Create Configuration](/images/api-create-config.png)

3. **Verify Configuration Creation**
   - Send the "Get Configurations" request
   - Find your newly created configuration in the list
   - Compare with the WebUI to confirm it appears there too

### Step 4: Create Entitlement via API

1. **Prepare Entitlement Request**
   - Use the "Create Entitlement" request
   - Update the request body with your configuration ID:

   ```json
   {
     "configId": "{{configurationId}}",
     "description": "API-created entitlement for Student{{studentNumber}}",
     "count": 1,
     "startTime": "immediate",
     "tags": [
       {
         "key": "CreatedBy",
         "value": "API"
       },
       {
         "key": "Workshop",
         "value": "FortiFlex-FinOps"
       }
     ]
   }
   ```

2. **Execute Entitlement Creation**
   - Replace `{{configurationId}}` with the ID from Step 3
   - Send the request
   - Save the entitlement ID from the response

   ![API Create Entitlement](/images/api-create-entitlement.png)

3. **Monitor Entitlement Status**
   - Use "Get Entitlement by ID" request
   - Check status every 30 seconds until "Active"
   - Note the serial number for licensing

### Step 5: API-Based Entitlement Management

1. **Update Entitlement via API**
   - Find the "Update Entitlement" request
   - Practice updating the description:

   ```json
   {
     "description": "Updated via API - Student{{studentNumber}} - Modified {{timestamp}}"
   }
   ```

2. **Query Usage Information**
   - Use "Get Usage Statistics" request
   - Filter for your specific entitlements
   - Analyze point consumption patterns

   ![API Usage Stats](/images/api-usage-stats.png)

3. **Stop/Start Entitlement**
   - Practice stopping: Send PATCH request with `{"status": "stopped"}`
   - Verify status change in response
   - Restart: Send PATCH request with `{"status": "active"}`

## Lab Exercise 6: Azure Serverless Automation

### Step 1: Create Azure Function App

1. **Navigate to Azure Portal**
   - Go to your resource group
   - Click "Create" → "Function App"

2. **Configure Function App**
   - **Function App Name**: `fortiflex-automation-student[XX]`
   - **Runtime stack**: Node.js
   - **Version**: Latest LTS
   - **Region**: Same as your other resources
   - **Plan**: Consumption (serverless)

   ![Azure Function App Creation](/images/azure-function-creation.png)

3. **Complete Function App Deployment**
   - Review settings and create
   - Wait for deployment to complete

### Step 2: Create HTTP Trigger Function

1. **Access Function App**
   - Navigate to your new Function App
   - Click "Functions" in the left menu
   - Click "Create function"

2. **Configure HTTP Trigger**
   - **Template**: HTTP trigger
   - **Function name**: `ScaleFortiGate`
   - **Authorization level**: Function
   - Click "Create"

   ![HTTP Trigger Creation](/images/http-trigger-creation.png)

### Step 3: Implement FortiFlex API Integration

1. **Open Function Code Editor**
   - Click on your new function
   - Go to "Code + Test"
   - Replace the default code with the following:

   ```javascript
   const axios = require('axios');

   module.exports = async function (context, req) {
       context.log('FortiFlex scaling function triggered');
       
       // Configuration
       const FORTIFLEX_API_BASE = 'https://support.fortinet.com/ES/api/fortiflex/v2';
       const API_KEY = process.env.FORTIFLEX_API_KEY;
       
       // Request validation
       if (!req.body || !req.body.entitlementId || !req.body.newCpuCount) {
           context.res = {
               status: 400,
               body: "Please provide entitlementId and newCpuCount in request body"
           };
           return;
       }
       
       try {
           const { entitlementId, newCpuCount } = req.body;
           
           // Step 1: Get current entitlement details
           const currentEntitlement = await axios.get(
               `${FORTIFLEX_API_BASE}/entitlements/${entitlementId}`,
               {
                   headers: {
                       'Authorization': `Bearer ${API_KEY}`,
                       'Content-Type': 'application/json'
                   }
               }
           );
           
           // Step 2: Stop current entitlement
           await axios.patch(
               `${FORTIFLEX_API_BASE}/entitlements/${entitlementId}`,
               { status: 'stopped' },
               {
                   headers: {
                       'Authorization': `Bearer ${API_KEY}`,
                       'Content-Type': 'application/json'
                   }
               }
           );
           
           // Step 3: Create new configuration with updated CPU count
           const newConfig = await axios.post(
               `${FORTIFLEX_API_BASE}/configs`,
               {
                   name: `Auto-scaled-${newCpuCount}CPU-${Date.now()}`,
                   description: `Auto-generated config for ${newCpuCount} CPU scaling`,
                   productType: 'FortiGate VM',
                   platform: {
                       type: 'azure',
                       region: 'eastus'
                   },
                   vmConfiguration: {
                       cpu: newCpuCount,
                       ram: newCpuCount * 4, // 4GB RAM per CPU
                       bandwidth: 1000
                   },
                   supportLevel: 'standard'
               },
               {
                   headers: {
                       'Authorization': `Bearer ${API_KEY}`,
                       'Content-Type': 'application/json'
                   }
               }
           );
           
           // Step 4: Create new entitlement with new configuration
           const newEntitlement = await axios.post(
               `${FORTIFLEX_API_BASE}/entitlements`,
               {
                   configId: newConfig.data.id,
                   description: `Scaled entitlement - ${newCpuCount} CPU`,
                   count: 1,
                   startTime: 'immediate'
               },
               {
                   headers: {
                       'Authorization': `Bearer ${API_KEY}`,
                       'Content-Type': 'application/json'
                   }
               }
           );
           
           context.res = {
               status: 200,
               body: {
                   message: `Successfully scaled FortiGate to ${newCpuCount} CPU`,
                   oldEntitlementId: entitlementId,
                   newEntitlementId: newEntitlement.data.id,
                   newConfigId: newConfig.data.id,
                   serialNumber: newEntitlement.data.serialNumber
               }
           };
           
       } catch (error) {
           context.log.error('Error scaling FortiGate:', error);
           context.res = {
               status: 500,
               body: {
                   error: 'Failed to scale FortiGate',
                   details: error.message
               }
           };
       }
   };
   ```

2. **Add Environment Variables**
   - Go to Function App → "Configuration"
   - Add new application setting:
     - **Name**: `FORTIFLEX_API_KEY`
     - **Value**: Your FortiFlex API key
   - Save the configuration

   ![Function App Environment Variables](/images/function-env-vars.png)

3. **Install Dependencies**
   - In the Function App, go to "Console"
   - Run: `npm install axios`
   - Wait for installation to complete

### Step 4: Test Serverless Automation

1. **Test the Function**
   - Go back to your function's "Code + Test" tab
   - Click "Test/Run"
   - Use this test payload:

   ```json
   {
       "entitlementId": "your-entitlement-id-here",
       "newCpuCount": 4
   }
   ```

   ![Function Test](/images/function-test.png)

2. **Monitor Execution**
   - Check the "Logs" tab for execution details
   - Verify the function completes successfully
   - Note the new entitlement and configuration IDs

3. **Verify Results**
   - Check FortiFlex WebUI for new configuration and entitlement
   - Confirm old entitlement is stopped
   - Verify new entitlement is active

### Step 5: Advanced Automation Scenarios

1. **Schedule-Based Scaling**
   Create a Timer trigger function for automatic scaling:

   ```javascript
   // Timer trigger for off-hours scaling down
   module.exports = async function (context, myTimer) {
       const currentHour = new Date().getHours();
       
       // Scale down after 6 PM, scale up at 8 AM
       if (currentHour >= 18 || currentHour < 8) {
           await scaleToSize(1); // Scale to 1 CPU for cost savings
       } else {
           await scaleToSize(4); // Scale to 4 CPU for business hours
       }
   };
   ```

2. **Webhook Integration**
   - Configure the function to respond to Azure Monitor alerts
   - Auto-scale based on CPU utilization or network traffic
   - Integrate with external monitoring systems

3. **Multi-Tenant Automation**
   - Extend the function to handle multiple customers
   - Use tags to identify and manage different tenant entitlements
   - Implement approval workflows for scaling operations

## Lab Exercise 7: Infrastructure-as-Code Integration

### Step 1: Terraform Integration Example

1. **Review Terraform Provider**
   Here's an example of managing FortiFlex with Terraform:

   ```hcl
   # Configure the FortiFlex provider
   terraform {
     required_providers {
       fortios = {
         source = "fortinetdev/fortios"
         version = "~> 1.0"
       }
     }
   }

   # Create FortiFlex configuration
   resource "fortios_system_fortiflex" "workshop_config" {
     name         = "terraform-config-student-${var.student_number}"
     description  = "Terraform managed FortiFlex configuration"
     product_type = "FortiGate VM"
     
     platform {
       type   = "azure"
       region = "eastus"
     }
     
     vm_configuration {
       cpu       = var.cpu_count
       ram       = var.cpu_count * 4
       bandwidth = 1000
     }
     
     tags = {
       Environment = "Workshop"
       Student     = var.student_number
       ManagedBy   = "Terraform"
     }
   }

   # Create entitlement
   resource "fortios_system_fortiflex_entitlement" "workshop_entitlement" {
     config_id   = fortios_system_fortiflex.workshop_config.id
     description = "Terraform managed entitlement"
     count       = 1
     
     tags = {
       Environment = "Workshop"
       CreatedBy   = "Terraform"
     }
   }
   ```

2. **Variable Management**
   ```hcl
   variable "student_number" {
     description = "Student number for workshop"
     type        = string
   }

   variable "cpu_count" {
     description = "Number of CPUs for FortiGate"
     type        = number
     default     = 2
   }

   output "entitlement_id" {
     value = fortios_system_fortiflex_entitlement.workshop_entitlement.id
   }

   output "serial_number" {
     value = fortios_system_fortiflex_entitlement.workshop_entitlement.serial_number
   }
   ```

{{% notice success %}}
**API Automation Complete!** You've successfully:
- Authenticated with the FortiFlex API using Postman
- Created configurations and entitlements programmatically
- Built serverless automation functions in Azure
- Explored Infrastructure-as-Code integration patterns
- Implemented automated scaling based on business logic
{{% /notice %}}

## Key Takeaways from API Automation

**Speed**: API operations complete in seconds vs minutes for manual operations.

**Consistency**: Automated processes eliminate human error and ensure standardization.

**Integration**: APIs enable seamless integration with existing DevOps and FinOps workflows.

**Scalability**: Serverless functions can handle multiple concurrent scaling requests.

**Cost Optimization**: Automated scheduling can significantly reduce costs during off-hours.

**Best Practices Learned**:
- Always validate API responses before proceeding to next steps
- Implement proper error handling and retry logic
- Use environment variables for sensitive data like API keys
- Tag all resources for proper cost allocation and management
- Monitor API rate limits to avoid throttling

---

**Congratulations!** You've completed the hands-on FortiFlex workshop. Let's wrap up with key takeaways and next steps.

[Next: Workshop Summary →](./summary/)
EOF
```

## Commit Batch 4

```bash
# Add and commit the complete hands-on lab content
git add content/03-hands-on-lab/manual-operations.md content/03-hands-on-lab/api-automation.md
git commit -m "Add complete hands-on lab exercises: manual operations and API automation"
git push origin main
```

**Batch 4 Complete!** 🚀

This is the **CORE** of your workshop - you now have:

- ✅ **Complete Manual Operations** (Lab Exercises 1-4):
  - Creating FortiFlex configurations step-by-step
  - Entitling FortiGate VMs with Azure integration
  - Scaling from 2CPU to 4CPU with cost analysis
  - Best practices and real-world scenarios

- ✅ **Complete API Automation** (Lab Exercises 5-7):
  - Full Postman collection integration
  - Azure Functions serverless automation with complete JavaScript code
  - Infrastructure-as-Code Terraform examples
  - Advanced scaling scenarios and production patterns

- ✅ **Production-Ready Content**:
  - Real error handling and retry logic
  - Environment variable management
  - Security best practices
  - Cost optimization strategies

**Ready for the Final Batch?** Batch 5 will include:

1. **Workshop Summary** - Key takeaways and implementation roadmap
2. **Terraform Infrastructure** - Complete lab environment automation
3. **Instructor Documentation** - Setup guides and troubleshooting
4. **Scripts & Automation** - One-click workshop deployment

This final batch transforms your content into a **complete enterprise workshop package** ready for delivery!

Ready to finish strong? 💪