---
title: "FortiFlex"
date: 2025-06-10
weight: 12
chapter: false
---


## What is FortiFlex?

FortiFlex is Fortinet's usage-based licensing solution that transforms how organizations consume and manage Fortinet security services. Instead of traditional fixed licenses, FortiFlex provides:

- **Pay-as-you-use billing** based on actual consumption
- **API-driven automation** for instant provisioning
- **Flexible scaling** to match business demands
- **Simplified management** through centralized control

## FortiFlex Flavors: Enterprise vs MSSP

- FortiFlex Enterprise(also called FortiFlex prepaid subscription service): Designed for individual organizations to manage their own Fortinet deployments with flexible licensing.
  - Flex Points are purchased in advance and consumed as Fortinet products are deployed.
  - Ideal for enterprises with predictable usage patterns and a need for direct control over their security infrastructure.
- FortiFlex MSSP(also referred to a FortiFlex postpaid subscription service): Tailored for Managed Security Service Providers (MSSPs) to offer Fortinet services to multiple customers.
  - Allows MSSPs to manage multiple customer deployments from a single FortiFlex account.
  - Provides features for multi-tenancy, centralized billing, and customer management.
  - Ideal for MSSPs looking to provide automated Marketplace deployments with flexible billing to their customers.

## Core Components

### 1. FortiFlex Configurations

**Purpose**: Templates that define the type and parameters of Fortinet products you want to deploy.

**Key Features**:
- Product selection (FortiGate, FortiManager, FortiAnalyzer, etc.)
- VM sizing and specifications
- Geographic region settings
- Usage parameters and limits

**Example Use Cases**:
- Standard FortiGate configuration for branch offices
- High-performance setup for data centers
- Development/testing environments

### 2. Entitlements

**Purpose**: Individual instances of deployed Fortinet products that consume FortiFlex points.

**Key Features**:
- Unique serial numbers for each deployment
- Real-time usage tracking
- Dynamic scaling capabilities
- License lifecycle management

**Billing Model**:
- Charged by points per hour of operation
- Different VM sizes consume different point rates
- Automatic billing integration with Fortinet accounts

{{% notice warning %}}
Due to the regulatory nature and requirements around serial numbers and billing of the FortiFlex program, it is not possible to delete configurations or entitlements once they are created. This is to ensure compliance and accurate billing records are maintained in perpetuity.

As such, we will not be creating any more entities than are necessary for demonstration purposes during this workshop
{{% /notice %}}

### 3. FortiFlex WebUI

**Access**: [https://support.fortinet.com](https://support.fortinet.com) → FortiFlex section

**Key Features**:
- Configuration management dashboard
- Real-time usage monitoring
- Entitlement lifecycle operations
- Cost tracking and reporting
- User access management

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
├── Usage & Billing
│   ├── Current Usage
│   ├── Billing History
│   └── Cost Projections
└── Administration
    ├── User Management
    ├── API Keys
    └── Notifications
```

### 4. FortiFlex API

**API Documentation**: [FNDN](https://fndn.fortinet.net/index.php?/fortiapi/954-fortiflex/956/)

**Base URL**: `https://support.fortinet.com/ES/api/fortiflex/v2/'

**Authentication**: API key-based authentication

**API Benefits**:
- Programmatic control over all FortiFlex operations
- Integration with CI/CD pipelines
- Automated scaling based on metrics
- Custom billing and reporting solutions

## Useful Resources

### Documentation
- [**FortiFlex Docs**](https://docs.fortinet.com/product/flex-vm/25.2)
- [**API Documentation**](https://fndn.fortinet.net/index.php?/fortiapi/954-fortiflex/956/)

### Tools & Integrations
- **FortiFlex Calculator**: [Estimate your FortiFlex costs](https://fndn.fortinet.net/index.php?/tools/fortiflex/)
- **Code**: [Ansible, Terraform, Python, and Postman](https://github.com/FortinetCloudCSE/fortiflexvm-api)
- **Terraform Provider**: [Infrastructure-as-code integration](https://registry.terraform.io/providers/fortinetdev/fortiflexvm/latest )
- **Ansible Module**: https://galaxy.ansible.com/ui/repo/published/fortinet/fortiflexvm/ 


---

Now that you understand the FortiFlex components, let's get hands-on experience with the platform.
