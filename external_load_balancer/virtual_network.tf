
# Create Virtual Network
resource "azurerm_virtual_network" "virtual_network" {
  name                = var.vnet_configurations.name
  address_space       = var.vnet_configurations.address_space
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  dns_servers         = var.vnet_configurations.dns_servers
  tags                = var.tags

  depends_on = [azurerm_resource_group.resource_group]
}
# Create Subnet
resource "azurerm_subnet" "network_subnet" {
  count                = length(var.subnet_configurations)
  name                 = var.subnet_configurations[count.index].name
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = var.subnet_configurations[count.index].address_prefixes

  depends_on = [azurerm_virtual_network.virtual_network, azurerm_resource_group.resource_group]
}
