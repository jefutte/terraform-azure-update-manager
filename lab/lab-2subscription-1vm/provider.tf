terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=3.54.0"
    }
  }
}

provider "azurerm" {
  alias = "sub1"
  subscription_id = var.sub1
  features {}
}

provider "azurerm" {
  alias = "sub2"
  subscription_id = var.sub2
  features {}
}