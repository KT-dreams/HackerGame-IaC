terraform {
  source = "https://github.com/KT-dreams/IaC-Modules.git//dynamodb"
}

prevent_destroy = true

locals {
    account_vars = jsondecode(file("${get_terragrunt_dir()}/${find_in_parent_folders("account_vars.json")}"))
    region_vars  = jsondecode(file("${get_terragrunt_dir()}/${find_in_parent_folders("region_vars.json")}"))
    vars         = merge(local.account_vars, local.region_vars)
}


inputs = {
  core_region = local.vars.core_region
}

include {
  path = "${find_in_parent_folders()}"
}
