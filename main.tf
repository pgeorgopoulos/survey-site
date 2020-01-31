variable "sub_id" {
  type = "string"
}

variable "rg" {
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
