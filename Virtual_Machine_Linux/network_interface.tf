### Create  Network Interface 
resource "azurerm_network_interface" "az_vm_nic" {
  name                = var.nic_config
  resource_group_name = azurerm_resource_group.az-rg-vm.name
  location            = azurerm_resource_group.az-rg-vm.location



  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.az_vm_subnet[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.az_vm_pip.id

  }

  lifecycle {
    create_before_destroy = true
  }

}

### Manages the association between a Network Interface and a Network Security Group.
resource "azurerm_network_interface_security_group_association" "az_vm_nic_nsg" {
  network_interface_id      = azurerm_network_interface.az_vm_nic.id
  network_security_group_id = azurerm_network_security_group.az_vm_sg.id

}