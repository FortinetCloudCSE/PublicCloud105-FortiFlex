---
title: "FortiFlex"
date: 2025-06-10
weight: 8
chapter: false
---


## What is FortiFlex?

FortiFlex is Fortinet's usage-based licensing solution that transforms how organizations consume and manage Fortinet security services. Instead of traditional fixed licenses, FortiFlex provides:

- **Pay-as-you-use billing** based on actual consumption
- **API-driven automation** for instant provisioning
- **Flexible scaling** to match business demands
- **Simplified management** through centralized control

## Supported Products?

[VM's, Hardware Services, Cloud/SaaS](https://docs.fortinet.com/document/flex-vm/25.3.0/administration-guide/883447/service-offerings)

{{< figure src="flex-consumption.png" alt="FortiFlex Products" class="center" >}}

## FortiFlex Flavors: Enterprise vs MSSP

{{< figure src="Flex-2Programs.png" alt="FortiFlex Models" class="center" >}}

- FortiFlex Enterprise(also called FortiFlex prepaid subscription service): Designed for individual organizations to manage their own Fortinet deployments with flexible licensing.
  - Flex Points are purchased in advance and consumed as Fortinet products are deployed.
  - Ideal for enterprises with predictable usage patterns and a need for direct control over their security infrastructure.
- FortiFlex MSSP(also referred to a FortiFlex postpaid subscription service): Tailored for Managed Security Service Providers (MSSPs) to offer Fortinet services to multiple customers.
  - Allows MSSPs to manage multiple customer deployments from a single FortiFlex account.
  - Provides features for multi-tenancy, centralized billing, and customer management.
  - Ideal for MSSPs looking to provide automated Marketplace deployments with flexible billing to their customers.

## Core Components

### 1. FortiFlex Points 

{{< figure src="flex-points.png" alt="FortiPoints" class="center" >}}

**Purpose**: Mechanism for measuring and billing usage of FortFlex licensed products
FortiPoints facilitate:

- Licensing scalability and flexibility
- Efficient and agile procurement
- Easy access to a broad product ecosystem
- Simplified management

### 2. FortiFlex Configurations

**Purpose**: Templates that define the type and parameters of Fortinet products you want to deploy.

**Key Parameters**:
- Product selection (FortiGate, FortiManager, FortiAnalyzer, etc.)
- VM sizing and specifications

**Example Use Cases**:
- FortiGate: CPU Size, # of VDOMs, Service Package, Services
- FortiAppSec Cloud: WAF, GSLB, Service Package, SOCaaS
- FortiManager: # of Managed Devices, # of ADOMs

### 3. FortiFlex Entitlements

**Purpose**: Individual instances of deployed Fortinet products that consume FortiFlex points.

**Key Parameters**:
- Unique serial numbers for each deployment
- Real-time usage tracking
- License lifecycle management

**Billing Model**:
- Charged by points per Day of operation
- Different VM sizes consume different point rates
- Automatic billing integration with Fortinet accounts

{{% notice warning %}}
Due to the regulatory nature and requirements around serial numbers and billing of the FortiFlex program, it is not possible to delete configurations or entitlements once they are created. This is to ensure compliance and accurate billing records are maintained in perpetuity.

As such, we will not be creating any more entities than are necessary for demonstration purposes during this workshop
{{% /notice %}}

### 4. Reporting

**Purpose**: Provides insights into FortiFlex usage and consumption patterns.

**Key Features**:
- FortiFlex Points Usage Summary by Product
- Daily detail up to 90 days
- Customizable reports available via API

### 5. FortiFlex WebUI

**Access**: [https://support.fortinet.com](https://support.fortinet.com) → FortiFlex section

**Key Features**:
- Configuration management dashboard
- Usage monitoring
- Entitlement lifecycle operations
- Reporting
- Tools - Points Calculator

**Navigation Overview**:
```
FortiFlex Dashboard
├── Configurations
│   ├── Create New Configuration
│   ├── Manage Existing Configurations
│   └── Configuration Templates
├── Entitlements
│   ├── Active Entitlements
│   ├── Create New Entitlement
│   └── Entitlement History
├── Reporting
│   ├── Point Usage Summary
│   ├── Point Usage Detail
└── Tools
    ├── Points Calculator
```

## Useful Resources

### Documentation
- [**FortiFlex Documentation**](https://docs.fortinet.com/product/flex-vm/25.2)
- [**FortiFlex API Documentation**](https://fndn.fortinet.net/index.php?/fortiapi/954-fortiflex/956/)

### Tools & Integrations
- **FortiFlex Calculator**: [Estimate your FortiFlex costs](https://fndn.fortinet.net/index.php?/tools/fortiflex/)
- **Sample Scripts & Code**: [Ansible, Terraform, Python, and Postman](https://github.com/FortinetCloudCSE/fortiflexvm-api)
- **Terraform Provider**: [Infrastructure-as-code integration](https://registry.terraform.io/providers/fortinetdev/fortiflexvm/latest )
- **Ansible Module**: https://galaxy.ansible.com/ui/repo/published/fortinet/fortiflexvm/ 


---