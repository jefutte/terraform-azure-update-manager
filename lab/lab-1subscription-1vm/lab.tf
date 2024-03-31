resource "azurerm_resource_group" "rg" {
  provider = azurerm.sub1
  name     = var.resource_group_name
  location = var.location
}

module "vnet" {
  depends_on = [ azurerm_resource_group.rg ]
  providers = {
    azurerm = azurerm.sub1
  }
  source = "../modules/vnet"

  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name = var.vnet_name
  vnet_address_prefix = var.vnet_address_prefix
  subnet_address_prefix = var.subnet_address_prefix
}

module "vm" {
  depends_on = [ 
    azurerm_resource_group.rg,
    module.vnet 
  ]
  providers = {
    azurerm = azurerm.sub1
  }
  source = "../modules/vm"

  resource_group_name = var.resource_group_name
  location            = var.location
  vmname             = var.vmname
  subnet_id = module.vnet.subnet_id
}

module "maintenance_configuration" {
  depends_on = [ 
    azurerm_resource_group.rg
  ]
  providers = {
    azurerm = azurerm.sub1
  }
  source = "../modules/maintenance_configuration"

  resource_group_name = var.resource_group_name
  location            = var.location
  mc_name = var.mc_name
  start_date_time = var.start_date_time
}

module "maintenance_assignment" {
  depends_on = [ 
    azurerm_resource_group.rg,
    module.maintenance_configuration
  ]
  providers = {
    azapi = azapi
  }
  source = "../modules/maintenance_assignment"

  location            = var.location
  ma_name = var.ma_name
  maintenance_configuration_id = module.maintenance_configuration.mc_id
  maintenance_locations = var.maintenance_locations
  scope = var.scope
  tags = var.tags
}