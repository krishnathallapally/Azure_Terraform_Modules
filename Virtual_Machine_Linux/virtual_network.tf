# Create a virtual Network 
resource "azurerm_virtual_network" "az_vm_vnet" {
  name                = var.virtual_network_config.name
  resource_group_name = azurerm_resource_group.az-rg-vm.name
  location            = azurerm_resource_group.az-rg-vm.location
  address_space       = var.virtual_network_config.address_space
  dns_servers         = var.virtual_network_config.dns_servers
  tags                = var.tags
  depends_on          = [azurerm_resource_group.az-rg-vm]
}

# Create Subnet
resource "azurerm_subnet" "az_vm_subnet" {
  count                = length(var.subnet_config)
  name                 = var.subnet_config[count.index].name
  resource_group_name  = var.rg_config.name
  virtual_network_name = var.virtual_network_config.name
  address_prefixes     = var.subnet_config[count.index].address_prefixes
  depends_on           = [azurerm_virtual_network.az_vm_vnet]
}

