---
title: "FortiFlex & Orgs"
weight: 11
---

## FortiFlex For MSSP's

FortiCloud Organizations enables Muliti-Tenancy for FortiFlex. This is particularly interesting for MSSP's.  

Each {{% badge color="green" %}}Org Account{{% /badge %}} can represent a separate entity with its own set of devices, {{% badge color="red" %}}Users{{% /badge %}}, and {{% badge color="violet" %}}Permission scope{{% /badge %}}/{{% badge color="blue" %}}Permission profile{{% /badge %}}, which can be arranged in {{% badge color="orange" %}}Org Units{{% /badge %}} . This allows service providers to manage multiple customers from a single FortiCloud account.

- MSSP's can leverage Organizations to manage individual customer FortiFlex entities under the same program 
- FortiFlex Configurations and Entitlements are dedicated to the {{% badge color="green" %}}Org Account{{% /badge %}} and not visible from others
  - MSSP Admins {{% badge color="red" %}}Users{{% /badge %}} could have read/write access to all of their customers {{% badge color="green" %}}Org Accounts{{% /badge %}}
  - Each individual customer {{% badge color="red" %}}Users{{% /badge %}} might only have read access or maybe no access to the FortiCloud portal, depending on how the MSSP wants to setup their services.
  - Maybe the MSSP want to fully automate the provisioning and management of these the Forti products and only provide customer access to FortiCare for ticketing/etc
  - Controlled via {{% badge color="violet" %}}Permission scope{{% /badge %}} & {{% badge color="blue" %}}Permission profile{{% /badge %}}, assigned at the {{% badge color="red" %}}User{{% /badge %}} level
- Global Organization can navigate all and view each OU consumption
- Global Organization can build automation from Root level to all individual {{% badge color="green" %}}Org Account{{% /badge %}}
- Global Organization receives monthly consolidated billing for MSSP FortiFlex Program




{{% notice info %}}
This Workshop is setup using a FortiCloud MSSP level Root Account with each workshop participant representing an individual customer.  The Cloud CSE Marketplace Demo is an example of how the API's can facilitate automation at the MSSP level for individual customers
{{% /notice %}}
