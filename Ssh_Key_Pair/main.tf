# Create a Key pair
resource "tls_private_key" "generated" {
  algorithm = var.key_pair_info.algorithm
  rsa_bits  = var.key_pair_info.rsa_bits
}
# Generates a local file with the given content

resource "local_file" "private_key" {
  content        =  tls_private_key.generated.private_key_pem
  filename        =  var.key_pair_info.filename
  file_permission = var.key_pair_info.file_permission
}

### Connecting it to azure 
resource "azurerm_ssh_public_key" "az_vm_ssh_key" {
  name = var.key_pair_info.name
  resource_group_name = var.resource_group_info.name
  location = var.resource_group_info.location
  # public_key = var.key_pair_info.generate_and_upload == true ? tls_private_key.generated[0].public_key_openssh : file(var.key_pair_info.private_key_path)
  public_key = tls_private_key.generated.public_key_openssh
}