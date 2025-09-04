---
title: "Workshop Cleanup"
date: 2025-06-10
weight: 50
chapter: false
---


This section provides instructions on how to clean up resources created during the workshop. Follow these steps to ensure that all resources are properly deleted and your environment is left in a clean state for the next session.

{{< tabs >}}

{{% tab title = "Stop all FortiFlex Entitlements" %}}
We'll use the Demo FortiFlex MSSP Marketplace to Stop all Entitlements we created as part of this workshop
Go to the FortiFlex Enttlements Page and click **Stop** on any active entitlements.  Click to confirm.

{{< figure src="flex-entitle-stop.png" alt="Stop Entitlement" >}}

{{% notice info %}} 
Remember, FortiFlex points deduction doesn't stop even if the resources stop, are terminated, or are decomissioned.  So it's imperative to maintain proper FortiFlex maintenance records or automation on the entitlements
{{% /notice %}}

{{% /tab %}}

{{% tab title = "Delete Forticloud IAM API Key" %}}

In the FortiCloud Portal, Go to the IAM Portal, Users section, Select the API account you created for this workshop and delete it.

{{< figure src="fcld-iam-user-delete.png" alt="IAM user delete" >}}
{{% /tab %}}

{{< /tabs >}}

## Chapter 3 Quiz

Test your knowledge with this final quiz covering all the concepts from this workshop:

{{< iframe src="https://ec2-52-43-126-239.us-west-2.compute.amazonaws.com:8080/gamebytag?tag=ch3" height="800" width="100%" >}}

