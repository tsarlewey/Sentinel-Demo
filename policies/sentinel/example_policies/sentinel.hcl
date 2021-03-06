policy "medium_policy" {
  source            = "./medium_policy.sentinel"
  enforcement_level = "soft-mandatory"
}

policy "easy_policy" {
  source = "./easy_policy.sentinel"
  enforcement_level = "advisory"
}

policy "multiple_rules" {
  source            = "./multiple_rules.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "remote-easy_policy" {
    source = "git::https://github.com/tsarlewey/Sentinel-Demo.git//policies/sentinel/example_policies/easy_policy.sentinel"
    enforcement_level = "advisory"
}

policy "default_rule_approved_resources" {
  source = "./default_rule_approved_resources.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "q4_cost_burner" {
  source = "./q4_cost_burner.sentinel"
  enforcement_level = "advisory"
}

module "remote-tfplan-functions-latest" {
  source = "git::https://github.com/hashicorp/terraform-guides.git//governance/third-generation/common-functions/tfplan-functions/tfplan-functions.sentinel"
}

 module "local-tfplan-functions" {
   source = "../common-functions/tfplan-functions/tfplan-functions.sentinel"
 }
 
module "remote-tfconfig-functions" {
  source = "git::https://github.com/hashicorp/terraform-guides.git//governance/third-generation/common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

module "local-tfrun-functions" {
  source = "../common-functions/tfrun-functions/tfrun-functions.sentinel"
}

mock "time" {
  data = {
    now = {
      hour = 12
      minute = 00
    }
  }
}

global "work" {
  value = {
    weekday = {
      days = ["Monday", "Tuesday",
      "Wednesday", "Thursday", "Friday"]
    }
  }
}

param "tired" {
    value = "Yes"
}