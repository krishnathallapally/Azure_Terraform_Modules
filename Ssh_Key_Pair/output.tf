# output of private key
output "sshkey_name" {
  description = "ssh key name"
  value       = azurerm_ssh_public_key.az_vm_ssh_key.name
  sensitive   = true
}
# # output of public key
# output "sshkey_path" {
#   description = "ssh key path"
#   value       = var.key_pair_info.my_id_rsa_pub
#   sensitive   = true
# }

