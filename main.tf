variable "sub_id" {
  type = "string"
}

variable "rg" {
  type = "string"
}

variable "acr_name" {
  type = "string"
}

provider "azurerm" {
  version = "1.38.0"
  subscription_id = var.sub_id
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg
  location = "East US 2"
}

resource "azurerm_container_registry" "acr" {
  name                     = var.acr_name
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "${azurerm_resource_group.rg.location}"
  sku                      = "Basic"
  admin_enabled            = false
#   The below param is only available with the "Premium" sku.
#   georeplication_locations = ["West US", "East US"]
}