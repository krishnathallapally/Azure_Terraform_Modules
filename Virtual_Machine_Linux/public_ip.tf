### Manages a Public IP Address.
resource "azurerm_public_ip" "az_vm_pip" {
  name                = var.pip_config.name
  resource_group_name = azurerm_resource_group.az-rg-vm.name
  location            = azurerm_resource_group.az-rg-vm.location
  allocation_method   = var.pip_config.allocation_method
  tags                = var.tags
}