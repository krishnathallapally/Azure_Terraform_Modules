# Output: For Virtual Network Id
output "azure_virtual_network_Id" {
  description = "The ID of the virtual network"
  value       = module.vnet.vnet_id
}
# Output: For Subnet Id's
output "azure_subnet_Ids" {
  description = "The IDs of the subnets"
  value       = module.vnet.subnet_ids
}

output "subnet_ids" {
  value = module.vnet.subnet_names
}
