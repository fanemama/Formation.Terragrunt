generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.16.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.1.0"
    }
  }
}
  
  provider "azurerm" {
  features {}
  tenant_id       = "${get_env("ARM_TENANT_ID", "")}"
  subscription_id =  "${get_env("ARM_SUBSCRIPTION_ID", "294e9f12-203f-45b2-92cf-483deb193891")}"
  client_id     = "${get_env("ARM_CLIENT_ID", "")}"   
  client_secret = "${get_env("ARM_CLIENT_SECRET", "")}"
}

provider "azuread" {}
EOF
}