resource "azurerm_maintenance_configuration" "mca1" {
  name                = var.mc_name
  resource_group_name = var.resource_group_name
  location            = var.location
  scope               = "InGuestPatch"

  window {
    start_date_time = var.start_date_time
    time_zone = "Romance Standard Time"
    duration = "03:55"
    recur_every = "Week"
  }

  install_patches {
    linux {
        classifications_to_include = [ "Critical", "Security" ]
        package_names_mask_to_exclude = [  ]
        package_names_mask_to_include = [  ]
    }
    windows {
        classifications_to_include = [ "Critical", "Security", "UpdateRollup", "Definition", "Updates" ]
        kb_numbers_to_exclude = [  ]
        kb_numbers_to_include = [  ]
    }
    reboot = "Always"
  }

  in_guest_user_patch_mode = "User"

  tags = {
    Env = "dev"
  }
}



