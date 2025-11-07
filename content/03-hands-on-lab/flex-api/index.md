---
title: "FortiFlex API"
date: 2025-06-10
weight: 42
chapter: false
---


|                    |                                                                                   |  
|:------------------:|:----------------------------------------------------------------------------------|
|      **Goal**      | Gain Experience with the FortiFlex API                                            |
|      **Task**      | Import FortiCloud Postman Collection, Authenticate, and explore the FortiFlex API | 
| **Validation**     | Stop and Start FortiFlex Entitlement via Postman                                          |



In this section, you'll learn about the building blocks of automating FortiFlex operations...the FortiFlex REST API

We'll start by setting up Postman with our FortiFlex Collection, then create an API Key in FortiCloud, and finally use Postman to interact with the FortiFlex API. 

Make sure you have Postman setup, and if not check Step 3 of the [Setup Guide!]({{% ref "/02-quickstart/setup-guide/" %}})

### Step 1: Import FortiFlex Postman Collection 
The following steps should remain relatively consistent regardless of how you're using Postman, so open Postman and proceed.

{{< tabs >}}

{{% tab title="Import FortiFlex Postman Collection" %}}
  - In Postman, use an existing collection, or create a new one if you'd like
  - click on **File**-->**Import** in the top left corner, or **Import** button in the top left of the collection
  - On the import dialog, paste the following URL: 
    - `https://raw.githubusercontent.com/FortinetCloudCSE/fortiflexvm-api/refs/heads/main/api/Postman/v2/FortiCloud.postman_collection.json`
  - You should see the **FortiCloud Collection** appear in the left sidebar
  {{< figure src="p-import.png" alt="Postman Import Collection" >}}
{{% /tab %}}

{{% tab title="Postman Collection Variables" %}}
  - All variables used in the collection are stored at the highest level of the Collection (rather than in a seperate environment file)
  - Click on **Collection Title** in the left sidebar, then click on the **Variables** tab
  - You'll see variables for the following

|                    |                                                                                   |                             |
|------------------|----------------------------------------------------------------------------------|---------------------------|
| **API Base URLs**  | BASE URLs for each of the specific Service Endpoints                               | pre-set                     |
| **api_username**   | Used for Authentication                                                            | user-set                    |
| **api_password**   | Used for Authentication                                                            | user-set                    |
| **accountId**      | Specify the FortiCloud Account we're targetting                                    | user-set                    |
| **programSerialNumber** | Specifies the FortiFlex Program Serial Number                                 | auto-set (overridable)      |
| **client_id**      | for authentication (only used to override the automated client_id in the script)   | auto-set (overridable)      |
| **access_token**   | stores Bearer token returned from authentication request for each client_id/request | auto-set                    |
| **expires_at**     | stores token expiration checked on each use to see if refresh needed               | auto-set                    |



{{< figure src="p-collect-vars.png" alt="Postman Collection Variables" >}}
{{% notice tip %}}
In most situations, the only variables you'll need to modify are the **api_user**, **api_password**, and **accountId**.  You will notice the **access_tokens** populate as you launch different API requests 
{{% /notice %}}

{{% /tab %}}
{{% tab title="Explore Collection Script" %}}
  - We've set up the FortiCloud Postman collection to automate the authentication process and store the access token for use in subsequent requests
    - You can see the scripting used to fetch Bearer tokens by clicking on the **Scripts** tab at the top level of the Collection, and viewing the **Pre-request Script**
    - Pseudocode 
      ```
      1. Grab the URL of the request, along with the API Username and Password
      2. Set the authentication client_id depending on the path in the URL
      3. If (No bearer token or it's already expired): get a new bearer token with api_username, api_password, and client_id
      4. Set the bearer token in the request header for the given request type
      ```
      {{< figure src="p-collect-script.png" alt="Postman Collection script" >}}
{{% /tab %}}
{{< /tabs >}}


### Step 2: API Authentication Setup

{{< tabs >}}
{{% tab title="FortiCloud IAM Portal" %}}
From the FortiCloud Portal, click on **Services**-->**IAM**
{{<figure src="fcld-iam.png" alt="FortiCloud IAM Portal"  >}}

{{% /tab %}}
{{% tab title="Create FortiFlex API Key" %}}
Click on **Users (left nav menu) --> Add New --> API User**
{{<figure src="create-api-user.png" alt="Create FortiFlex API User"  >}}
{{% /tab %}}
{{% tab title="API User" %}}
- Enter a description for the API User such as: `flex[XX]` where [XX] is your flex student number
- Choose the **SysAdmin** Permission Profile
- Click Next
{{<figure src="add-api-user.png" alt="API User" >}}
{{% /tab %}}
{{% tab title="API Credentials" %}}
- When the API User is created, you will see a message to download the credentials.
- Click to download, and enter a password to encrypt the file, such as `FortiFlex2025!`

{{<figure src="api-user-cred-download.png" alt="API Credentials" >}}

- You'll get a password-protected zip file with the API credentials.  Open it using the same **password** you entered when downloading the file.
- The folder will contain a single text file with the **apiId** and **password**
- You'll enter the **apiId** and **password** into a Postman Collection Variables the next step

{{% notice tip %}}
Keep these API credentials handy as we'll use them for the rest of the workshop!
{{% /notice %}}
{{% /tab %}}

{{% tab title="Postman Variables" %}}
- Back in Postman, enter the newly created **apiId** and **password** into the Postman Collection Variables
- Copy the `apiId` from the credentials text file into the **api_user** field
- Copy the `password` from the credentials text file into the **api_password** field

{{<figure src="p-collect-vars-save.png" alt="Postman Environment" >}}
{{% notice tip %}}
Postman recently released a newer version with changes to the way variables are stored.  If you happen to have an older version showing Current and Initial values, 
**Important**: Make sure to use the **Current value** field, not the **Initial value** field. The **Current value** is what will be used when you send requests.  Also if you see this, be sure to **save** your values
{{% /notice %}}
{{% /tab %}}

{{% tab title="Verify Successful Auth" %}}

- From the top level FortiCloud Collection, open folder: **FortiFlex V2.0-->Programs**, and then POST Request:  **List**
- Click the **Send** button
{{% notice tip %}}
- Notice how the POST URL is constructed using the **{{flexvm_base_url}}** variable.  This allows for an easy change to the entire collection if the baseURL ever changes
- After the POST returns, open the **Variables in Request** button on the top right and click to view **All Variables**
  - Notice how the **programSerialNumber** variable is populated with the value returned from our Post call!
{{% /notice %}}
{{< figure src="flex-auth-return.png" alt="Postman Auth Token" >}}
- You should see a response with a 200 OK status and 2 different `serialNumber` in the response body

Congratulations, you're now authenticated with the FortiFlex API!
{{% notice warning %}}
If you get an error at this step, please double-check everything and-or check with the Workshop Instructor before proceeding!
{{% /notice %}}

{{% /tab %}}
{{< /tabs >}}

### Step 3: Basic List Actions
Let's take a moment to understand FortiFlex API list actions
{{< tabs >}}

{{% tab title="Configuration List" %}}
To view configurations
- In the Collection's **Configurations** folder, open the **Post/List** request
  - Notice how the request URL is built with the **Base URL Variable**
  - Notice the **Request Body** requires a **programSerialNumber**, which is a variable already populated from our last request to list programs!
    - If yours isn't populated for some reason, For this Workshop, we're focusing on FortiFlex MSSP(postpaid), and the Program SN is: `ELAVMS0000000518`
  - Click **Send**
  - You should see a response with a 200 OK status and a list of configurations and their **id** in the response body
  {{< figure src="p-config-list.png" alt="FortiFlex Configurations List Body"  >}}

{{% /tab %}}
{{% tab title="Entitlement List" %}}
Next, we can retrieve a list of Entitlements by sending a request to the **/entitlements/list** endpoint.
- In the Collection's **Entitlements** folder, open the **Post List** request
- Enter the **configId** returned from the previous request into the **Body** of the **Get Entitlements** request, and click **Send**
{{< figure src="p-entitlements-list.png" alt="FortiFlex Entitlements List" >}}
{{% /tab %}}
{{< /tabs >}}
     
### Step 4: Entitlement Management via API
Let's look at modifying entitlements via the API
{{% notice note %}}
The FortiFlex API is incredibly powerful and can create/modify every type of FortiFlex Config and Entitlement available.  However, doing so in a workshop would be complicated and create a large amount of overhead.  As such, the simplest mechanism to show modification of Flex entites is stopping and starting the entitlement you've already created!

In a production environment, the main use case for stopping and starting entitlements would be in auto-scaling clusters where standby members aren't active all the time, so we don't need incur FortiFlex point deductions while the instances are not in use
{{% /notice %}}

{{< tabs >}}
{{% tab title="Stop Entitlement" %}}
- Open the **Stop** request from the **Entitlements** folder in the collection
- Under the **Body** tab, enter the **serialNumber** you got from the previous request
- Click **Send** to disable the entitlement
- You should see a response with a 200 OK status and the entitlement status updated to "STOPPED"
- You can verify this by sending the **list** request and checking the status, or by checking the WebUI
{{< figure src="p-entitle-stop.png" alt="Disable Entitlement"  >}}
{{% /tab %}}
{{% tab title="Reactivate Entitlement" %}}
- Open the **reactivate** request from the **Entitlements** folder in the collection
- Under the **Body** tab, enter the **serialNumber** you got from the previous request
- Click **Send** to enable the entitlement
- You should see a response with a 200 OK status and the entitlement status updated to "ACTIVE"
- You can verify this by sending the **list** request and checking the status, or by checking the WebUI
{{< figure src="p-entitle-reactivate.png" alt="Enable Entitlement" >}}
{{% /tab %}}
{{< /tabs >}}

{{% notice info %}}
**API Basics Complete!** You've successfully:
- Authenticated with the FortiFlex API using Postman
- Viewed configurations and entitlements programmatically
- Made a simple modification to an existing entitlement
{{% /notice %}}

## Key Takeaways from API Basics

- **Speed**: API operations complete in seconds vs minutes for manual operations.
- **Consistency**: Automated processes eliminate human error and ensure standardization.
- **Integration**: APIs enable seamless integration with existing DevOps and FinOps workflows.
- **Best Practices Learned**:
  - Always validate API responses before proceeding to next steps
  - Use Collection variables for sensitive data like API keys, and to automate future steps



