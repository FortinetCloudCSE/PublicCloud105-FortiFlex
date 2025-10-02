---
title: "Frequently Asked Questions"
date: 2025-06-10
weight: 22
chapter: false
---
## General FortiFlex Questions

### Q: What's the difference between FortiFlex and traditional Fortinet licensing?

**A:** Traditional licensing requires purchasing fixed-term licenses upfront (typically 1-3 years) for specific capacities. FortiFlex uses a usage-based model where you:
- Pay only for actual consumption (daily billing)
- Scale resources up/down automatically
- Provision instantly without procurement delays
- Get consolidated billing across all Fortinet products

### Q: How does FortiFlex pricing work?

**A:** FortiFlex uses a "points" system:
- Different VM sizes consume different points
- Example: FortiGate Enterprice Service Bundle 2-vCPU = 6.39 points/day, 4-vCPU = 12.91 points/day
- For Enterprise customers, Points are purchased in advance and consumed as resources run
- For MSSP Customers with special agreements, Points are post-paid,
- [Detailed differences in the programs can be found here](https://docs.fortinet.com/document/flex-vm/25.3.0/fortiflex-concept-guide/310137/enterprise-and-mssp)
- Detailed pricing available in the [FortiFlex portal under "Pricing Calculator"](https://fndn.fortinet.net/index.php?/tools/fortiflex/)

### Q: Can I use FortiFlex for on-premises deployments?

**A:** FortiFlex licensing works on [VM's, Hardware Services, Cloud/SaaS](https://docs.fortinet.com/document/flex-vm/25.3.0/administration-guide/883447/service-offerings)
- FortiGate VMs in the cloud or on Prem.
- Hardware Services
- Cloud/SaaS Services

### Q: Does FortiFlex Points Consumption Stop if my VM/Service stops?

**A:** No, there is currently no inherrent link between individual services and Fortinet Entitlements.  If the Entitlement is active, it will incure FortiFlex Point deductions, regardless of the VM/service state
- Customers can setup triggers and automated actions using the FortiFlex API, FortiGate Automation Stitches, and automation platforms of their choice to monitor instance state and trigger FortiFlex Entitlement stop/reactivate

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
- Update the FortiFlex configuration which the entitlement is governed by (this will impact all entitlements for that configuration)
- Modify the VM size in your cloud provider (which will trigger a VM reboot)
- FortiFlex Licensing will automatically update License coverage
- FortiOS should automatically add the CPU's after the resize reboot, but there are open bugs on this issue.  You may need to add the CPUs or reboot the device again to get FortiOS to recognize the new CPU's.
- Billing automatically adjusts to new point consumption

### Q: How does FortiFlex integrate with Infrastructure-as-Code?

**A:** FortiFlex provides multiple automation options:
- **REST API**: Direct integration with Terraform, Ansible, etc.
- **Terraform Provider**: Native Fortinet provider for FortiFlex resources
- **Ansible Collection**: Playbook to interact FortiFlex
- **CI/CD Pipelines**: API calls in deployment workflows

## Lab-Specific Questions

### Q: Can I access my lab environment after the workshop?

**A:** Lab environments are temporary:
- Available during workshop + 24 hours for practice
- All Scripts used in the workshop are available at the course GitHub Repo


### Q: What if my API calls aren't working in Postman?

**A:** Common issues and solutions:
1. **Authentication Error**: Verify API key is correct in environment variables
2. **404 Errors**: Check the base URL is set correctly
3. **JSON Formatting**: Use Postman's JSON validator for request bodies

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

[Next: Hands-On Lab →]({{% ref "/03-hands-on-lab/" %}})
