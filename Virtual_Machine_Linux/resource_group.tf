# Create Resource group 
resource "azurerm_resource_group" "az-rg-vm" {
  name     = var.rg_config.name
  location = var.rg_config.location
  tags     = var.tags
}
