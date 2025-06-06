---
title: "Lab 1: Private Cloud DC Setup Using FortiFlex"
linkTitle: "Lab 1"
weight: 30
---

## Objectives

- Create FortiFlex configurations and entitlements via API.
- Inject tokens into FortiGate, FortiManager, and FortiAnalyzer VMs.
- Configure FortiManager and register FortiGate devices.

## Key Steps

1. **API Credential Setup**
   - Log in to FortiFlex Portal and download credentials.
   - Note `apiId`, `password`, and `clientId`.

2. **Postman Token Setup**
   - Grant type: Password Credentials
   - Token URL: `https://customerapiauth.fortinet.com/api/v1/oauth/token/`
   - Client ID: `flexvm`
   - Use downloaded `apiId` and `password`

3. **Create Configurations**
   - API URL: `https://support.fortinet.com/ES/api/fortiflex/v2/configs/create`
   - JSON example:
     ```json
     {
       "programSerialNumber": "ELAVMS000000XXXX",
       "accountId": 1234567,
       "name": "Flex-Auto-Lab-FGT-2CPU",
       "productTypeId": 1,
       "parameters": [
         {"id": 1, "value": "2"},
         {"id": 2, "value": "ENT"}
       ]
     }
     ```

4. **Create Entitlements**
   - API URL: `https://support.fortinet.com/ES/api/fortiflex/v2/entitlements/vm/create`
   - Use the `configId` from step above.

5. **Token Injection via CLI**
   - Command: `execute vm-license <token_value>`
   - Use SSH to VMs with `admin/Fortinet1!`

6. **Configure FortiManager**
   - Log in to GUI, navigate to `Policy & Objects > Security Fabric`.
   - Add FortiFlex connector with API credentials.
   - Register and install licenses on FGT-HUB.
