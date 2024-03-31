resource "azurerm_resource_group" "rg_sub1" {
  provider = azurerm.sub1
  name     = var.resource_group1_name
  location = var.location
}

module "vnet_sub1" {
  depends_on = [ azurerm_resource_group.rg_sub1 ]
  providers = {
    azurerm = azurerm.sub1
  }
  source = "../modules/vnet"

  resource_group_name = var.resource_group1_name
  location            = var.location
  vnet_name = var.vnet1_name
  vnet_address_prefix = var.vnet1_address_prefix
  subnet_address_prefix = var.subnet1_address_prefix
}

module "vm1_sub1" {
  depends_on = [ 
    azurerm_resource_group.rg_sub1,
    module.vnet_sub1
  ]
  providers = {
    azurerm = azurerm.sub1
  }
  source = "../modules/vm"

  resource_group_name = var.resource_group1_name
  location            = var.location
  vmname             = var.vmname1
  subnet_id = module.vnet_sub1.subnet_id
}