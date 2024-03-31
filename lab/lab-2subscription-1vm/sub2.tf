resource "azurerm_resource_group" "rg_sub2" {
  provider = azurerm.sub2
  name     = var.resource_group2_name
  location = var.location
}

module "vnet_sub2" {
  depends_on = [ azurerm_resource_group.rg_sub2 ]
  providers = {
    azurerm = azurerm.sub2
  }
  source = "../modules/vnet"

  resource_group_name = var.resource_group2_name
  location            = var.location
  vnet_name = var.vnet2_name
  vnet_address_prefix = var.vnet2_address_prefix
  subnet_address_prefix = var.subnet2_address_prefix
}

module "vm1_sub2" {
  depends_on = [ 
    azurerm_resource_group.rg_sub2,
    module.vnet_sub2 
  ]
  providers = {
    azurerm = azurerm.sub2
  }
  source = "../modules/vm"

  resource_group_name = var.resource_group2_name
  location            = var.location
  vmname             = var.vmname2
  subnet_id = module.vnet_sub2.subnet_id
}