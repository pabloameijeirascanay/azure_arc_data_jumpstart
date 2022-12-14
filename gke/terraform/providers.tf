#
# Providers Configuration
#

terraform {
  required_version = "~> 1.0"
  required_providers {
    google  = "~> 4.36.0"
    local   = "~> 2.2.3"
    azurerm = "~> 3.20.0"
  }
}

provider "google" {
  credentials = file(var.gcp_credentials_filename)
  project     = var.gcp_project_id
  region      = var.gcp_region
  zone        = var.gcp_zone
}

provider "azurerm" {
  subscription_id = var.ARC_DC_SUBSCRIPTION
  client_id       = var.SPN_CLIENT_ID
  client_secret   = var.SPN_CLIENT_SECRET
  tenant_id       = var.SPN_TENANT_ID
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
