output "vnet_id" {
  description = "Subnet ID"
  value       = azurerm_virtual_network.this.id
}

output "subnet_id" {
  description = "Subnet ID"
  value       = azurerm_subnet.this.id
}