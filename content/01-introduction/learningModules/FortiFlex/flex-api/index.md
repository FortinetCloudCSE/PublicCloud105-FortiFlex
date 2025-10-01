---
title: "FortiFlex API"
weight: 25
---

**API Documentation**: [FNDN](https://fndn.fortinet.net/index.php?/fortiapi/954-fortiflex/956/)

**Base URL**: `https://support.fortinet.com/ES/api/fortiflex/v2/`

**Authentication**: API key-based authentication

**API Benefits**:
- Programmatic control over all FortiFlex operations
- Integration with CI/CD pipelines
- Automated scaling based on metrics
- Custom billing and reporting solutions

{{< figure src="flex-api-hierarchy.png" >}}

- REST – Representational State Transfer - https://restcookbook.com/ --> good explanations 
  - HTTP Protocol and REST Architecture are intertwined 
  - The HTTP Response Codes are (should be) indicative of the status of the REST API call 
  - REST APIs are typically REST-ish as they do not fully/correctly implement the REST Architecture 
  - REST call Operations can be defined by a combination of Idempotency and Safety 
  - Most Common REST API calls – Idempotency: when then same request provides the same results or state
  
| HTTP Method | Idempotent | Safe |
|-------------|------------|------|
| GET         | <i class="fa fa-check" style="color:green"></i>| <i class="fa fa-check" style="color:green"></i>|
| POST        | <i class="fa fa-times" style="color:red"></i> | <i class="fa fa-times" style="color:red"></i> |
| PUT         | <i class="fa fa-check" style="color:green"></i>| <i class="fa fa-times" style="color:red"></i> |
| DELETE      | <i class="fa fa-check" style="color:green"></i>| <i class="fa fa-times" style="color:red"></i> |
| PATCH       | <i class="fa fa-times" style="color:red"></i> | <i class="fa fa-times" style="color:red"></i> |
  
- FortiFlex API is REST-ish 
  - All FortiFlex API calls are POSTs, some calls should be GETs or PUTs

### Anatomy of a REST API Query
  {{< figure src="rest-anatomy.png" >}}