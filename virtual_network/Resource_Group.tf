# Create Resource Group
resource "azurerm_resource_group" "az_rg_vnet" {
    name = var.rg_vnet.name
    location = var.rg_vnet.location
    tags =   var.rg_vnet.tags
}