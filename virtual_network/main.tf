
# Create Virtual Network
resource "azurerm_virtual_network" "azure_virtual_network" {
  name                = var.vnet_configurations.name
  address_space       = var.vnet_configurations.address_space
  location            = var.rg_vnet.location
  resource_group_name = var.rg_vnet.name
  dns_servers         = var.vnet_configurations.dns_servers
  tags                = var.vnet_configurations.tags
  depends_on = [ azurerm_resource_group.az_rg_vnet ]
}
# Create Subnet
resource "azurerm_subnet" "azure_subnet" {
  count                = length(var.subnet_configurations)
  name                 = var.subnet_configurations[count.index].name
  resource_group_name  = azurerm_resource_group.az_rg_vnet.name
  virtual_network_name = azurerm_virtual_network.azure_virtual_network.name
  address_prefixes     = var.subnet_configurations[count.index].address_prefixes
  depends_on           = [azurerm_virtual_network.azure_virtual_network,azurerm_resource_group.az_rg_vnet]
}
