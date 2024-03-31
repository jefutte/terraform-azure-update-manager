provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-UpdateManager-001"
  location = "West Europe"
}

resource "azurerm_maintenance_configuration" "mca1" {
  name                = "mc-WindowA1-dev-001"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  scope               = "SQLDB"

  tags = {
    Env = "dev"
  }
}

