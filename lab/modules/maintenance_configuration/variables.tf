variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "mc_name" {
  type = string
  description = "Name of the maintenance configuration, eg. mc-MaintenanceWindowA1"
}

variable "start_date_time" {
  type = string
  description = "Effective datetime of the maintenance configuration to start, in the format: YYYY-MM-DD hh:mm"
}