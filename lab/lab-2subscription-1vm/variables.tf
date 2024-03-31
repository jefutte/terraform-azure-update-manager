variable "sub1" {
  type = string
}

variable "sub2" {
  type = string
}

variable "resource_group1_name" {
  type = string
  default = "rg-UpdateManagerLabResources-001"
}

variable "location" {
  type = string
  default = "West Europe"
}

variable "vnet1_name" {
  type = string
  default = "vnet-UpdateManager-001"
}

variable "vnet1_address_prefix" {
  type = list(string)
  default = ["10.0.0.0/24"]
}

variable "subnet1_address_prefix" {
  type = list(string)
  default = ["10.0.0.0/26"]
}

variable "vmname1" {
  type = string
  default = "vm-aum-001"
}

variable "resource_group2_name" {
  type = string
  default = "rg-UpdateManagerLabResources-002"
}

variable "vnet2_name" {
  type = string
  default = "vnet-UpdateManager-002"
}

variable "vnet2_address_prefix" {
  type = list(string)
  default = ["10.0.1.0/24"]
}

variable "subnet2_address_prefix" {
  type = list(string)
  default = ["10.0.1.0/26"]
}

variable "vmname2" {
  type = string
  default = "vm-aum-002"
}