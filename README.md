# IaC
Managed by [Terragrunt](https://github.com/gruntwork-io/terragrunt)

## Project structure

Project is divided to prod and dev account. 

Dev account can be used to deploy DynamoDB tables to Local DynamoDB.

## Prepare environment

Use script to install all dependencies:
```
. scripts/install.sh
```

## Deployment

### Production
1. Go to Terraform/AWS/prod-account/eu-central-1/hacker_game
2. `terragrunt apply`

### Local DynamoDB
1. Go to Terraform/AWS/dev-account/eu-central-1/hacker_game
2. `terragrunt apply`

You can override Terraform source using:
```
terragrunt apply --terragrunt-source <PATH_TO_SOURCE>
```

## Settings
Script uses environment variables to set Terraform and Terragrunt version. You can overwrite it be setting your values for:

- TERRAGRUNT_VERSION
- TERRAFORM_VERSION
