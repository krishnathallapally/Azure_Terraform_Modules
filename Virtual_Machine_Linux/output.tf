### Output of azure ssh key path
output "sshkey_name" {
  value = local_file.az_vm_private_key.content
  sensitive = true
  
}

output "sshpublickey" {
  value = azurerm_ssh_public_key.az_vm_ssh_key.public_key
}

# Output for network interface id
output "nic_id" {
  value = azurerm_network_interface.az_vm_nic.id
  
}

# Output virtual network 
output "vnet_name" {
  value = azurerm_linux_virtual_machine.az_vm.name  
}
# ouput for subnet names
output "subnet_names" {
  value = [for subnet in azurerm_subnet.az_vm_subnet[*]: subnet.name]
  
}

# output for subnet id's
output "subnet_ids" {
  value = [for subnet in azurerm_subnet.az_vm_subnet[*]: subnet.id]
  
}

### output of public ip address
output "public_ip_address" {
  description = "The public IP address of the Linux VM"
  value       = azurerm_public_ip.az_vm_pip.ip_address
}

### Output of Virtual machine id
output "virtual_machine_id" {
  description = "The ID of the Linux VM"
  value       = azurerm_linux_virtual_machine.az_vm.id
}

### Output of virtual machine name
output "virtual_machine" {
  description = "The name of linux machine"
  value = azurerm_linux_virtual_machine.az_vm.name
}