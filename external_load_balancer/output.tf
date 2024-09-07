### Output of public ip
output "public_ip_name" {
  value = azurerm_public_ip.frontend_pip.name
}
output "public_ip_address_id" {
  value = azurerm_public_ip.frontend_pip.ip_address
}

### output of load balancer
output "lb_id" {
  value = azurerm_lb.ext_lb.id
}

output "lb_backend_pool_id" {
  value = azurerm_lb_backend_address_pool.backend_pool.id
}


