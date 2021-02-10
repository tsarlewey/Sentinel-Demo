# Common-Functions

These common functions created by rberlind are a set of functions that speed up Sentinel policy writing. Additionally, they bring the barrier of entry to writing Sentinel policies down for the common lay-person. 

Writing Sentinel policies are still fairly easy, but the common-functions speed up the process tenfold.

For example, instead of writing

```
filter tfplan.resource_changes as address, rc {
  	rc.type is type and
  	rc.mode is "managed" and
  	(rc.change.actions contains "create" or rc.change.actions contains "update" or
     rc.change.actions contains "read" or rc.change.actions contains "no-op")
  }
```

The common-functions invokes the above code as a straight-forward named function that returns all resources with your specified top-level 
Terraform resource:

```
import "tfplan-functions" as plan

resources = plan.find_resources("aws_instance")
```

After finding the "aws_instance" work can be done with the attributes to ensure you craft the policy to the standard's you want.

It is my belief that these functions should ship standard with the Sentinel framework.

More can be read up on these Policies by rberlind here: 

https://github.com/hashicorp/terraform-guides/tree/master/governance/third-generation
