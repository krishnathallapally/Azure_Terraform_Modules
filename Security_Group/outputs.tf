# Network Security Group Id
output "nsg_group_id" {
  description = "The IDs of the created Network Security Groups"
  value       = azurerm_network_security_group.security_group.id
}
# output of Network Security Group Rules Id
output "nsg_group_name" {
  description = "The IDs of the created Network Security Group rules"
  value       = azurerm_network_security_group.security_group.name
}