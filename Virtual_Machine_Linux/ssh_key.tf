# Create key pair 
resource "tls_private_key" "az_vm_tls_key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
    lifecycle {
    create_before_destroy = true
  }
}

# # Generates a local file with the given content
resource "local_file" "az_vm_private_key" {
  content         = tls_private_key.az_vm_tls_key.private_key_pem
  filename        = var.key_name
  file_permission = "0400"
}


### Connecting it to azure 
resource "azurerm_ssh_public_key" "az_vm_ssh_key" {
  name                = var.ssh_key_path
  resource_group_name = azurerm_resource_group.az-rg-vm.name
  location            = azurerm_resource_group.az-rg-vm.location
  public_key          = tls_private_key.az_vm_tls_key.public_key_openssh

}