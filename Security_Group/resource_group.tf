resource "azurerm_resource_group" "azure_resource_group" {
  name     = var.rg_Security_Group.name
  location = var.rg_Security_Group.location
  tags     = var.tags
}