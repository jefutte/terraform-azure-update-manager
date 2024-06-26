variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_prefix" {
  type        = list(string)
}

variable "subnet_address_prefix" {
  type        = list(string)
}