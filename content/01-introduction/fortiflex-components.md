---
title: "FortiFlex Platform Components"
date: 2025-06-10
weight: 12
chapter: false
---

# FortiFlex Platform Components

## What is FortiFlex?

FortiFlex is Fortinet's usage-based licensing solution that transforms how organizations consume and manage Fortinet security services. Instead of traditional fixed licenses, FortiFlex provides:

- **Pay-as-you-use billing** based on actual consumption
- **API-driven automation** for instant provisioning
- **Flexible scaling** to match business demands
- **Simplified management** through centralized control

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

**Base URL**: `https://support.fortinet.com/ES/api/fortiflex/`

**Authentication**: API key-based authentication

**Core Endpoints**:
- `GET /configs` - List configurations
- `POST /configs` - Create configuration
- `GET /entitlements` - List entitlements  
- `POST /entitlements` - Create entitlement
- `PUT /entitlements/{id}` - Modify entitlement
- `DELETE /entitlements/{id}` - Remove entitlement

**API Benefits**:
- Programmatic control over all FortiFlex operations
- Integration with CI/CD pipelines
- Automated scaling based on metrics
- Custom billing and reporting solutions

## FortiCloud Integration

### Organizations

FortiFlex integrates with FortiCloud Organizations to provide:

**Centralized Management**:
- Single pane of glass for multiple customers/tenants
- Hierarchical organization structure
- Delegated administration capabilities

**Access Control**:
- Role-based access control (RBAC)
- Fine-grained permissions
- Audit logging and compliance

**Multi-Tenancy**:
- Customer isolation and separation
- Individual billing and reporting
- Customized configurations per tenant

### Identity and Access Management (IAM)

**User Roles**:
- **Admin**: Full access to all FortiFlex operations
- **Operator**: Create and manage entitlements within existing configurations
- **Viewer**: Read-only access to configurations and usage data

**API Access**:
- Individual API keys per user
- Scoped permissions based on role
- Key rotation and lifecycle management

**Best Practices**:
- Use service accounts for automated operations
- Implement least-privilege access principles
- Regular access reviews and cleanup

## Useful Resources

### Documentation
- **FortiFlex User Guide**: [https://docs.fortinet.com/product/fortiflex](https://docs.fortinet.com/product/fortiflex)
- **API Documentation**: [https://docs.fortinet.com/document/fortiflex/api](https://docs.fortinet.com/document/fortiflex/api)

### Community & Support
- **FortiFlex Community Forum**: Technical discussions and best practices
- **Fortinet Developer Network**: API samples and integration guides
- **Support Portal**: Technical support and training resources

### Tools & Integrations
- **Postman Collection**: Pre-built API requests for testing
- **Terraform Provider**: Infrastructure-as-code integration
- **Azure/AWS Marketplace**: Direct cloud platform integration

---

Now that you understand the FortiFlex components, let's get hands-on experience with the platform.

[Next: QuickStart & FAQ →](../02-quickstart/)
