variable "location" {
  type = string
}

variable "ma_name" {
  type = string
  description = "Name of the maintenance configuration, eg. mc-MaintenanceWindowA1"
}

variable "maintenance_locations" {
  type = list(string)
  description = "List of locations where the maintenance configuration will be applied"
}

variable "maintenance_configuration_id" {
  type = string
  description = "ID of the maintenance configuration to be assigned"
}

variable "scope" {
  type = string
  description = "Scope of the assignment, fx /subscriptions/00000000-0000-0000-0000-000000000000"
}

variable "tags" {
  type = list(object({
    name  = string
    value = string
  }))
  description = "Tags to be included in the maintenance configuration assignment"
}