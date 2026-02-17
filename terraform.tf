terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tf_backend_rg"
    storage_account_name = "tfbackendstg13"
    container_name       = "tfstate-container"
    key                  = "frontend_vm.tfstate"
  }
}