resource "azapi_resource" "this" {
  type = "Microsoft.Maintenance/configurationAssignments@2023-04-01"
  name = var.ma_name
  location = var.location
  parent_id = var.scope
  body = jsonencode({
    properties = {
      filter = {
        locations = var.maintenance_locations
        osTypes = [
          "Windows",
          "Linux"
        ]
        resourceTypes = [
          "string"
        ]
        tagSettings = {
          filterOperator = "Any"
          tags = var.tags
        }
      }
      maintenanceConfigurationId = var.maintenance_configuration_id
    }
  })
}