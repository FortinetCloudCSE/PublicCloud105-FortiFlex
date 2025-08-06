---
title: "Task 2 - Run Terraform"
weight: 29
---

### Launch resources using Terraform

All the components required for Lab are deployed through terraform. 


Perform the following steps in your Cloudshell console to create your environment.

1. Clone the GitHub repo `git clone https://github.com/FortinetCloudCSE/PublicCloud105-FortiFlex.git`
2. Change directory to the `cd PublicCloud105-Fortiflex/terraform` folder
3. Run `terraform init`

```sh
git clone https://github.com/FortinetCloudCSE/PublicCloud105-FortiFlex.git
cd PublicCloud105-Fortiflex/terraform
terraform init
```

![lab11](terraform1.png)

    
4. Run the following command to apply it

    ```sh
   terraform apply -var="username=$(whoami)" --auto-approve
    ```

    {{% notice style="warning" title="**IF THE COMMAND ABOVE RESULTS IN AN ERROR**" %}} 

You can manually specify your username (found in your Azure Account email) in the command  
If your Workshop Azure account login is web31@ftntxxxxx.onmicrosoft.com, your username is **web31**, and the command to enter is:

```sh
terraform apply  -var='username=web31' --auto-approve
```
    
    {{% /notice %}} 


![lab12](terraform2.png)
    
5. Terraform deployment takes at least 10-15 min to complete.
  * Once Terraform is complete you should see the output. Please copy the output to notepad.

![lab13](tfoutput.png)



7. To print the node VM's login password, you can run this command 

   ```
   terraform output -raw password
   ```

![lab14](lin_pass.png)
