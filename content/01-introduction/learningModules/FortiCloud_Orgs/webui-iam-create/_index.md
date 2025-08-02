---
title: "WebUI IAM User Creation"
weight: 40
---

User creation is generally the same as IAM Users, IdP Role creation, or API Users.  The interface differs slightly, but the components are the same.

| Number | Explanation                                                             |
|--------|-------------------------------------------------------------------------|
| 1      | User/Role Name                                                          |
| 2      | User Tyle (Local or Organization)                                       |
| 3      | Permission Scope (OU bucket or specific Account                         |
| 4      | Permission Profile (choose from pre-created profiles |

{{< notice warning >}}
IAM Users and IdP Roles can have ONLY 1 Permission Scope and 1 Permission Profile.  You cannot layer multiples on a single user/role.
{{< /notice >}}
{{< figure src="webui-iam-create.png" >}}