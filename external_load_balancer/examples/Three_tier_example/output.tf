### Output of public ip
output "public_ip_name" {
  value = module.external_load_balancer.public_ip_name
}

output "public_ip_address_id" {
  value = module.external_load_balancer.public_ip_address_id
}

output "lb_id" {
  value = module.external_load_balancer.lb_id
}

output "lb_backend_pool_id" {
  value = module.external_load_balancer.lb_backend_pool_id
}