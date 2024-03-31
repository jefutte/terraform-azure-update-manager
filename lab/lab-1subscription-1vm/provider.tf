terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=3.54.0"
    }
    azapi = {
      source = "azure/azapi"
    }
  }
}

provider "azurerm" {
  alias = "sub1"
  subscription_id = var.sub1
  features {}
}

provider "azapi" {
  subscription_id = var.sub1
}