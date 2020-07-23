# IaC
Managed by [Terragrunt](https://github.com/gruntwork-io/terragrunt)

## Prepare environment

Use script to install all dependencies:
```
. scripts/install.sh
```

## Apply changes
```
terragrunt apply
```
You can override Terraform source using:
```
terragrunt apply --terragrunt-source <PATH_TO_SOURCE>
```
## Settings
Script uses environment variables to set Terraform and Terragrunt version. You can overwrite it be setting your values for:

- TERRAGRUNT_VERSION
- TERRAFORM_VERSION
