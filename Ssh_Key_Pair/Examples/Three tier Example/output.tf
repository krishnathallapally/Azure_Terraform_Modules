# output of private key
output "private_key" {
  description = "Private key in PEM format"
  value       = module.ssh_key.sshkey_name
  sensitive   = true
}
# # output of public key
# output "public_key" {
#   description = "Public key in PEM format"
#   value       = module.ssh_key.sshkey_path
#   sensitive   = true
# }