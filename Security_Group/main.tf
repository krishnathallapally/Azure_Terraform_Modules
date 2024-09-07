# Create Network Security Group to any Network Security Group Rules 
resource "azurerm_network_security_group" "security_group" {
  name                = var.nsg_name
  location            = var.rg_Security_Group.location
  resource_group_name = var.rg_Security_Group.name
  tags                = var.tags
  depends_on          = [azurerm_resource_group.azure_resource_group]


}

# Create Network Security Group Rules 
resource "azurerm_network_security_rule" "az_nsg_rules" {
  count                       = length(var.nsg_rules)
  name                        = var.nsg_rules[count.index].name
  priority                    = var.nsg_rules[count.index].priority
  direction                   = var.nsg_rules[count.index].direction
  access                      = var.nsg_rules[count.index].access
  protocol                    = var.nsg_rules[count.index].protocol
  source_port_range           = var.nsg_rules[count.index].source_port_range
  destination_port_range      = var.nsg_rules[count.index].destination_port_range
  source_address_prefix       = var.nsg_rules[count.index].source_address_prefix
  destination_address_prefix  = var.nsg_rules[count.index].destination_address_prefix
  resource_group_name         = var.rg_Security_Group.name
  network_security_group_name = azurerm_network_security_group.security_group.name
  depends_on                  = [azurerm_resource_group.azure_resource_group, azurerm_network_security_group.security_group]

}