### Manages a Linux Virtual Machine.
resource "azurerm_linux_virtual_machine" "az_vm" {
  name                  = var.vm_config.name
  resource_group_name   = azurerm_resource_group.az-rg-vm.name
  location              = azurerm_resource_group.az-rg-vm.location
  size                  = var.vm_config.size
  admin_username        = var.vm_config.admin_username
  network_interface_ids = [azurerm_network_interface.az_vm_nic.id]

  admin_ssh_key {
    username   = var.vm_config.admin_ssh_key.username
    public_key = tls_private_key.az_vm_tls_key.public_key_openssh
  }

  os_disk {
    caching              = var.vm_config.os_disk.caching
    storage_account_type = var.vm_config.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = var.vm_config.source_image_reference.publisher
    offer     = var.vm_config.source_image_reference.offer
    sku       = var.vm_config.source_image_reference.sku
    version   = var.vm_config.source_image_reference.version

  }

}