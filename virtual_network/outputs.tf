### Output values
output "vnet_id" {
    description = "value"
    value = azurerm_resource_group.az_rg_vnet.id
  
}

output "vnet_name" {
    description = "value"
    value = azurerm_resource_group.az_rg_vnet.name
  
}

output "subnet_ids" {
    description = "value"
    value = [for subnet in azurerm_subnet.azure_subnet[*]:  subnet.id]
  
}

output "subnet_names" {
    description = "value"
    value = [for subnet in azurerm_subnet.azure_subnet[*]: subnet.name]
  
}
