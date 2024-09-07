resource "azurerm_resource_group" "resource_group" {
  name     = var.rg_config.name
  location = var.rg_config.location

}