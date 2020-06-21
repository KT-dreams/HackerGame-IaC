locals {
  vars = jsondecode(file("./account_vars.json"))
}

iam_role = ""
