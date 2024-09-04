### output of sshkey
output "sshkey_name" {
  value = module.linux_virtual_machine.sshkey_name
  sensitive = true
}

output "sshpublickey" {
  value = module.linux_virtual_machine.sshpublickey

}

output "nic_id" {
  value = module.linux_virtual_machine.nic_id

}

output "vnet_name" {
  value = module.linux_virtual_machine.vnet_name

}

output "subnet_names" {
  value = module.linux_virtual_machine.subnet_names

}

output "subnet_ids" {
  value = module.linux_virtual_machine.subnet_ids

}
### Output: Public Ip Address 
output "public_ip_address" {
  description = "The public IP address of the Linux VM"
  value       = module.linux_virtual_machine.public_ip_address

}

# output : Admin user name
output "virtualmachine_id" {
  description = "The admin username for the Linux VM"
  value       = module.linux_virtual_machine.virtual_machine_id
}