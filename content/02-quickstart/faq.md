---
title: "Frequently Asked Questions"
date: 2025-06-10
weight: 22
chapter: false
---

# Frequently Asked Questions

## General FortiFlex Questions

### Q: What's the difference between FortiFlex and traditional Fortinet licensing?

**A:** Traditional licensing requires purchasing fixed-term licenses upfront (typically 1-3 years) for specific capacities. FortiFlex uses a usage-based model where you:
- Pay only for actual consumption (hourly billing)
- Scale resources up/down automatically
- Provision instantly without procurement delays
- Get consolidated billing across all Fortinet products

### Q: How does FortiFlex pricing work?

**A:** FortiFlex uses a "points" system:
- Different VM sizes consume different points per hour
- Example: 2-vCPU FortiGate = 2 points/hour, 4-vCPU = 4 points/hour
- Points are purchased in advance and consumed as resources run
- Detailed pricing available in the FortiFlex portal under "Pricing Calculator"

### Q: Can I use FortiFlex for on-premises deployments?

**A:** FortiFlex is designed for cloud deployments (Azure, AWS, GCP). For on-premises hardware, traditional licensing still applies. However, FortiFlex works great for:
- Cloud-based FortiGate VMs
- Hybrid architectures with cloud components
- Development and testing environments

## Technical Questions

### Q: What happens if I run out of FortiFlex points?

**A:** When points are low:
1. You'll receive email notifications at 80% and 90% consumption
2. At 100% consumption, new entitlements cannot be created
3. Existing entitlements continue running but accrue overage charges
4. You can purchase additional points anytime through the portal

### Q: How quickly can I provision a new FortiGate?

**A:** With FortiFlex:
- **Manual provisioning**: 5-10 minutes through WebUI
- **API provisioning**: 1-3 minutes with automation
- **Traditional licensing**: 2-4 weeks for procurement + provisioning

### Q: Can I change VM sizes after deployment?

**A:** Yes! This is a key FortiFlex advantage:
- Stop the entitlement in FortiFlex
- Modify the VM size in your cloud provider
- Update the entitlement configuration in FortiFlex
- Restart the entitlement
- Billing automatically adjusts to new point consumption

### Q: How does FortiFlex integrate with Infrastructure-as-Code?

**A:** FortiFlex provides multiple automation options:
- **REST API**: Direct integration with Terraform, Ansible, etc.
- **Terraform Provider**: Native Fortinet provider for FortiFlex resources
- **Azure ARM Templates**: Pre-built templates with FortiFlex integration
- **CI/CD Pipelines**: API calls in deployment workflows

## Lab-Specific Questions

### Q: What Azure permissions do I need for this lab?

**A:** Your lab account has been pre-configured with:
- Contributor access to your assigned resource group
- Virtual Machine Contributor role
- Network Contributor role
- These permissions allow VM creation and network configuration

### Q: Can I access my lab environment after the workshop?

**A:** Lab environments are temporary:
- Available during workshop + 24 hours for practice
- Save any configurations or scripts you want to keep
- Production FortiFlex access requires your own Fortinet account

### Q: What if my API calls aren't working in Postman?

**A:** Common issues and solutions:
1. **Authentication Error**: Verify API key is correct in environment variables
2. **404 Errors**: Check the base URL is set correctly
3. **Rate Limiting**: Wait 30 seconds between rapid API calls
4. **JSON Formatting**: Use Postman's JSON validator for request bodies

### Q: How do I get production FortiFlex access for my organization?

**A:** To enable FortiFlex for production use:
1. Contact your Fortinet sales representative
2. Request FortiFlex access for your organization
3. Complete any required MSP/partner agreements
4. Purchase initial points allocation
5. Set up billing and payment methods

## Best Practices Questions

### Q: How should I organize FortiFlex configurations?

**A:** Recommended organization strategies:
- **By Environment**: dev-config, staging-config, prod-config
- **By Customer**: customer-a-config, customer-b-config (for MSPs)
- **By Region**: us-east-config, eu-west-config
- **By Function**: branch-office-config, datacenter-config

### Q: What's the best way to monitor FortiFlex costs?

**A:** Cost monitoring best practices:
1. **Set up billing alerts** at 75% and 90% of monthly budget
2. **Regular usage reviews** - weekly for active environments
3. **Automated reporting** - API calls to extract usage data
4. **Tag entitlements** with cost centers or customer codes
5. **Schedule regular optimization reviews** to identify unused resources

### Q: How do I handle disaster recovery with FortiFlex?

**A:** DR strategies with FortiFlex:
- **Cold Standby**: Create configurations but don't start entitlements until needed (no cost)
- **Warm Standby**: Run minimal entitlements, scale up during DR events
- **Multi-Region**: Distribute entitlements across Azure regions
- **API Automation**: Script rapid deployment during emergencies

### Q: Should I use separate FortiFlex accounts for different customers?

**A:** For MSPs, consider:
- **Single Account**: Easier management, consolidated billing, use tagging for separation
- **Multiple Accounts**: Complete isolation, individual customer billing, more complex management
- **Hybrid Approach**: Major customers get separate accounts, smaller customers share an account with tagging

## Troubleshooting

### Q: My FortiGate VM isn't getting a license from FortiFlex

**A:** Check these items:
1. VM has internet connectivity to Fortinet licensing servers
2. Entitlement is in "Active" status in FortiFlex portal
3. Serial number matches between VM and entitlement
4. No firewall rules blocking licensing traffic (TCP 443 to *.fortinet.com)

### Q: I'm getting "Insufficient Points" errors

**A:** Resolution steps:
1. Check current points balance in FortiFlex dashboard
2. Review active entitlements and their point consumption
3. Purchase additional points if needed
4. Consider stopping unused entitlements to free up points

### Q: Can I migrate from traditional licenses to FortiFlex?

**A:** Migration options:
- **New Deployments**: Use FortiFlex for all new cloud deployments
- **Existing VMs**: Contact Fortinet support for migration assistance
- **Hybrid Approach**: Keep existing traditional licenses, use FortiFlex for new/scaled resources
- **Contract Renewal**: Consider FortiFlex when traditional licenses expire

---

**Questions Answered?** Time to get hands-on with FortiFlex!

[Next: Hands-On Lab →](../03-hands-on-lab/)
