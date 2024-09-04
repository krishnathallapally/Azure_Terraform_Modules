### Manages a network security group that contains a list of network security rules
resource "azurerm_network_security_group" "az_vm_sg" {
  name                = var.nsg_config
  resource_group_name = azurerm_resource_group.az-rg-vm.name
  location            = azurerm_resource_group.az-rg-vm.location
}

### Manages  network security rules
resource "azurerm_network_security_rule" "az_vm_sg_rules" {
  count                       = length(var.nsg_rules_config)
  name                        = var.nsg_rules_config[count.index].name
  priority                    = var.nsg_rules_config[count.index].priority
  direction                   = var.nsg_rules_config[count.index].direction
  access                      = var.nsg_rules_config[count.index].access
  protocol                    = var.nsg_rules_config[count.index].protocol
  source_port_range           = var.nsg_rules_config[count.index].source_port_range
  destination_port_range      = var.nsg_rules_config[count.index].destination_port_range
  source_address_prefix       = var.nsg_rules_config[count.index].source_address_prefix
  destination_address_prefix  = var.nsg_rules_config[count.index].destination_address_prefix
  resource_group_name         = azurerm_resource_group.az-rg-vm.name
  network_security_group_name = azurerm_network_security_group.az_vm_sg.name
}