---
title: "FortiFlex Integrations"
date: 2025-06-10
weight: 33
chapter: false
---

In this section, we'll explore how to automate FortiFlex operations using Terraform, take a peak at what an MSSP implementation for FortiFlex Might look like.

## Terraform

Let's take a peek at how we'd take advantage of the Terraform provider for FortiFlex to automate our infrastructure deployments!

{{< tabs >}}

{{% tab title="Terraform Setup" %}}
We'll use Terraform in Cloudshell from the Azure Portal, so head over to the Azure Portal and launch Cloudshell.

Run the following commands to clone this repo and navigate to the Terraform directory:

```bash
git clone https://github.com/FortinetCloudCSE/PublicCloud105-FortiFlex.git
cd PublicCloud105-FortiFlex/content/03-hands-on-lab/flex-integrations/terraform/azure
export ARM_SUBSCRIPTION_ID=$(az account show --query "id" -otsv)
```
{{% /tab %}}

{{% tab title="Terraform plan" %}}
Initialize and run a Terraform plan to see what resources will be created:

```bash
terraform init
terraform plan 
```

You will be asked to provide values for the following variables:
- **FortiFlex Entitlement Token**: You can get this from the FortiFlex portal.
- **FortiGate VM Username**: Use your Workshop Username Prefix (e.g. **Flex01**)

{{% notice warning %}}
There is no error checking on the FortiFlex Entitlement Token, so you could enter whatever you'd like here, the VM just won't be licensed correctly!

There is also no error checking on the FortiGate VM Username, but it will error out if you try to use an invalid username due to invalid access to the related resources.
{{% /notice %}}

Once you've provided the variables, you should see output with a plan of the resources Terraform will create

{{% /tab %}}

{{% tab title="Terraform Apply" %}}
In a real production environment you would review the plan output to ensure it matches your expectations, and then apply the plan to deploy the FortiGate VM licensed by FortiFlex with the following command:

{{% notice warning %}}
WE'RE NOT GOING TO ACTUALLY DEPLOY THIS IN THE WORKSHOP, AS WE HAVE SOMETHING MORE INTERESTING PLANNED FOR THE NEXT STEP!
```bash
terraform apply
```
{{% /notice %}}

Also in a real production environment:
- your entire cloud infrastructure would be defined in code (Terraform)
- you would be using a version control system like Git to manage changes to your infrastructure
- all of your system variables would be stored securely in a secrets manager or environment variables, not hardcoded into your Terraform files
- You'd be using the FortiFlex Terraform provider to directly integrate with FortiFlex, not passing the Entitlement Token or Username "manually" as a variable
- This terraform deployment would ideally be running as part of a CI/CD pipeline to ensure consistent and repeatable deployments across your environments

{{% /tab %}}

{{< /tabs >}}

### Advanced Use Cases
We don't have time to get into every possible integration use case in this workshop but we wanted to at least give you a taste.  Here are some additional resources to get you started if you're interested in exploring further:

- **Code**: [Ansible, Terraform, Python, and Postman](https://github.com/FortinetCloudCSE/fortiflexvm-api)
- **Terraform Provider**: [Infrastructure-as-code integration](https://registry.terraform.io/providers/fortinetdev/fortiflexvm/latest )
- **Ansible Module**: https://galaxy.ansible.com/ui/repo/published/fortinet/fortiflexvm/ 


### MSSP Use Case

{{< tabs >}}

{{% tab title="MSSP Overview" %}}
In this section, we'll explore how a Managed Security Service Provider (MSSP) might implement FortiFlex to manage multiple clients' security infrastructure efficiently.

{{% /tab %}}

{{% tab title="MSSP Architecture" %}}
An MSSP typically manages security services for multiple clients, each with their own unique requirements and infrastructure
{{% /tab %}}

{{< /tabs >}}