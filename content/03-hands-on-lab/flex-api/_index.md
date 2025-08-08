---
title: "FortiFlex API"
date: 2025-06-10
weight: 32
chapter: false
---

# Automation using FortiFlex API

In this section, you'll learn how to automate FortiFlex operations using the REST API and Postman, then explore serverless automation with Azure Functions.

We'll start by setting up Postman with our FortiFlex Collection, then create an API Key in FortiCloud, and finally use Postman to interact with the FortiFlex API. After that, we'll build a serverless automation function in Azure to scale FortiGate resources based on business logic.


### Step 1: Import FortiFlex Postman Collection 
The following steps should remain relatively consistent regardless of how you're using Postman, so open Postman and proceed.

{{< tabs >}}

{{% tab title="Import FortiFlex Postman Collection" %}}
  - In Postman, use an existing collection, or create a new one if you'd like
  - click on **File**-->**Import** in the top left corner, or **Import** button in the top left of the collection
  - On the import dialog, paste the following URL: 
    - `https://raw.githubusercontent.com/FortinetCloudCSE/fortiflexvm-api/refs/heads/main/api/Postman/v2/Fortinet%20FortiFlex%20V2.0%20(FlexVM).postman_collection.json`
  - You should see the **Fortinet FortiFlex v2.0 (FlexVM)** collection appear in the left sidebar
  {{< figure src="p-import.png" alt="Postman Import Collection" caption="Postman Import Collection" >}}
{{% /tab %}}

{{% tab title="Import FortiFlex Postman Environment" %}}
  - In Postman, click on **File**-->**Import** again, or **Import** button in the top left of the collection
  - On the import dialog, paste the following URL:
    - `https://raw.githubusercontent.com/FortinetCloudCSE/fortiflexvm-api/refs/heads/main/api/Postman/v2/fortinet-api-flexvm.postman_environment.json`
    - This will import the FortiFlex Postman environment
  - You should see the **fortinet-api-flexvm** environment appear under the **Environments** tab in the left sidebar
  - We will create a user in the FortiCloud IAM portal and add the API credentials to this environment in the next step
    {{< figure src="p-env-import.png" alt="Postman Import Environment" caption="Postman Import Environment" >}}
{{% /tab %}}
   
{{< /tabs >}}


### Step 2: API Authentication Setup

{{< tabs >}}
{{% tab title="FortiCloud IAM Portal" %}}
From the FortiCloud Portal, click on **Services**-->**IAM**
{{<figure src="fcld-iam.png" alt="FortiCloud IAM Portal" caption="FortiCloud IAM Portal" >}}

{{% /tab %}}
{{% tab title="Create FortiFlex API Key" %}}
Click on **Add New --> API User**
{{<figure src="create-api-user.png" alt="Create FortiFlex API User" caption="Create FortiFlex API User" >}}
{{% /tab %}}
{{% tab title="API User" %}}
Enter a username for the API User such as: `flexapiuser`
{{<figure src="add-api-user.png" alt="API User" caption="API User Creation" >}}
{{% /tab %}}
{{% tab title="API Credentials" %}}
- When the API User is created, you will see a message to download the credentials.
- Click to download, and enter a password to encrypt the file, such as `FortiFlex2025!`

{{<figure src="api-user-cred-download.png" alt="API Credentials" caption="API Credentials" >}}

- You'll get a password protected zip file with the API credentials.  Open it using the same **password** you entered when downloading the file.
- The folder will contain a single text file with the APIId and password
- You'll enter the apiId and password into a Postman Environment in the next step
{{% /tab %}}

{{% tab title="Postman Environment" %}}
- Back on Postman, make sure you have the **fortinet-api-flexvm** environment selected
- Copy the `apiId` from the credentials text file into the **api-username** Postman **Current value** variable
- Copy the `password` from the credentials text file into the **api-password** Postman **Current value** variable
- Click **Save** to save the environment
{{<figure src="p-env-save.png" alt="Postman Environment" >}}
{{% notice tip %}}
**Important**: Make sure to use the **Current value** field, not the **Initial value** field. The **Current value** is what will be used when you send requests.
{{% /notice %}}
{{% /tab %}}

{{% tab title="Flex API Authentication" %}}
Browse to the Flex API collection
- Open the **Retrieve Auth Token** request, under **Authenticate** folder
- In the Top right, choose your newly updated environment **fortinet-api-flexvm**
- Click the **Send** button
{{< figure src="flex-auth-return.png" alt="Postman Auth Token" >}}
- You should see a response with a 200 OK status and an `access_token` in the response body
- If you open the scripts tab for this request, you can see that we automatically store this return value for use in subsequent requests
- Click on the **Variables in request** icon on the rop right, and then expand **All variables** to see the `access_token` variable we store for use in all future requests


Congratulations, you're now authenticated with the FortiFlex API! You can use this token for all subsequent API requests.
{{% /tab %}}
{{< /tabs >}}

### Step 3: Understand Authentication and Basic List Actions
Let's take a moment to understand authentication and look at how authentication works with the FortiFlex API list actions
{{< tabs >}}
{{% tab title="Authentication Request" %}}
The FortiFlex API uses Bearer token authentication. 

- We get a Bearer token by first passing our API Username and API Password in the **Body** of a **Post** to the Authentication URL 
- Once we have the Bearer token, returned as **access_token** in response body of our **Post** , we can use it in the Authorization header for all subsequent API requests.
- Full Documentation for the FortiFlex API can be found at: [FortiFlex API Documentation](https://fndn.fortinet.net/index.php?/fortiapi/954-fortiflex/)

{{< figure src="p-authc-request.png" alt="FortiFlex API Documentation" caption="FortiFlex API Documentation" >}}
{{% /tab %}}

{{% tab title="Programs List AuthC" %}}
Now that we have a Bearer token, we can retrieve a list of FortiFlex Programs by sending a request to the **/programs/configs** endpoint.
- Open the **Post list** request from the **Programs** folder in the collection
- Click **Send** to retrieve the list of Programs
- You should see a response with a 200 OK status and a list of programs in the response body
{{< figure src="p-program-list-authc.png" alt="FortiFlex Configurations List AuthC" caption="FortiFlex Configurations List AuthC" >}}
{{% /tab %}}

{{% tab title="Configuration List Body" %}}
To view configurations
- We can then take the Flex Program SN we got from the previous request along with our FortiCloud Account ID, and use it to retrieve a list of Configurations for that Program.
- Open the **Post List** request from the **Configurations** folder in the collection 
  - For this Workshop, the Program SN is: `ELAVMR0000000519`
  - You can get your FortiCloud Account ID from the FortiCloud Portal top right corner
  - enter both into the **Body** of the **Get Configurations** request, and click **Send**
  - You should see a response with a 200 OK status and a list of configurations in the response body
  {{< figure src="p-config-list.png" alt="FortiFlex Configurations List Body" caption="FortiFlex Configurations List Body" >}}

{{% /tab %}}
{{% tab title="Entitlement List" %}}
Next, we can retrieve a list of Entitlements by sending a request to the **/entitlements/list** endpoint.
- Open the **Post List** request from **Entitlements** folder in the collection
- enter the **configId** returned from the previous request into the **Body** of the **Get Entitlements** request, and click **Send**
{{< figure src="p-entitlements-list.png" alt="FortiFlex Entitlements List" caption="FortiFlex Entitlements List" >}}
{{% /tab %}}
{{< /tabs >}}
     
### Step 4: Entitlement Management via API
Let's look at disabling and enabling entitlements via the API

{{< tabs >}}
{{% tab title="Disable Entitlement" %}}
- Open the **Stop ** request from the **Entitlements** folder in the collection
- Under the **Body** tab, enter the **serialNumber** you got from the previous request
- Click **Send** to disable the entitlement
- You should see a response with a 200 OK status and the entitlement status updated to "STOPPED"
- You can verify this by sending the **list** request and checking the status, or by checking the WebUI
{{< figure src="p-entitle-stop.png" alt="Disable Entitlement" caption="Disable Entitlement" >}}
{{% /tab %}}
{{% tab title="Enable Entitlement" %}}
- Open the **reactivate** request from the **Entitlements** folder in the collection
- Under the **Body** tab, enter the **serialNumber** you got from the previous request
- Click **Send** to enable the entitlement
- You should see a response with a 200 OK status and the entitlement status updated to "ACTIVE"
- You can verify this by sending the **list** request and checking the status, or by checking the WebUI
{{< figure src="p-entitle-reactivate.png" alt="Enable Entitlement" caption="Enable Entitlement" >}}
{{% /tab %}}
{{< /tabs >}}

{{% notice info %}}
**API Basics Complete!** You've successfully:
- Authenticated with the FortiFlex API using Postman
- Viewed configurations and entitlements programmatically
{{% /notice %}}

## Key Takeaways from API Basics

**Speed**: API operations complete in seconds vs minutes for manual operations.
**Consistency**: Automated processes eliminate human error and ensure standardization.
**Integration**: APIs enable seamless integration with existing DevOps and FinOps workflows.
**Scalability**: Serverless functions can handle multiple concurrent scaling requests.
**Cost Optimization**: Automated scheduling can significantly reduce costs during off-hours.
**Best Practices Learned**:
- Always validate API responses before proceeding to next steps
- Implement proper error handling and retry logic
- Use environment variables for sensitive data like API keys



