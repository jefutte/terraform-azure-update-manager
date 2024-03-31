variable "sub1" {
  type = string
}

variable "resource_group_name" {
  type = string
  default = "rg-UpdateManagerLabResources-001"
}

variable "location" {
  type = string
  default = "West Europe"
}

variable "vnet_name" {
  type = string
  default = "vnet-UpdateManager-001"
}

variable "vnet_address_prefix" {
  type = list(string)
  default = ["10.0.0.0/24"]
}

variable "subnet_address_prefix" {
  type = list(string)
  default = ["10.0.0.0/26"]
}

variable "vmname" {
  type = string
  default = "vm-aum-001"
}

variable "mc_name" {
  type = string
  default = "mc-MaintenanceWindowA1"
}

variable "start_date_time" {
  type = string
  default = "2023-10-27 21:00"
}

variable "ma_name" {
  type = string
  default = "ma-MaintenanceWindowA1"
} 

variable "maintenance_locations" {
  type = list(string)
  default = ["West Europe"]
}

variable "scope" {
  type = string
  default = "/subscriptions/b0fbba52-a0ae-4b41-85f0-11258598956e"
}

variable "tags" {
  type = list(object({
    name  = string
    value = string
  }))
  default = [
    {
      name = "MaintenanceWindow"
      value = "A1"
    }
  ]
}