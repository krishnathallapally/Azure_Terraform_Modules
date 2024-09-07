module "external_load_balancer" {
  source = "..//.."

  rg_config = {
    name     = "Load_balancer_rg"
    location = "Australia East"
  }
  tags = {}
  vnet_configurations = {
    name          = "lb-vnetwork"
    address_space = ["10.0.0.0/16"]
    dns_servers   = []
  }
  subnet_configurations = [
    {
      name             = "az-subnet-web-01"
      address_prefixes = ["10.0.0.0/24"]
      }, {
      name             = "az-subnet-app-01"
      address_prefixes = ["10.0.1.0/24"]
  }]
  public_ip = {
    name              = "frontend_public_ip"
    allocation_method = "Static"
  }
  load_balancer = {
    name                           = "external_load_balancer"
    frontend_ip_configuration_name = "front_end"
    backend_address_pool_name      = "backend_pool"
  }
  lb_nat_rule = {
    name                = "lb_nat_rule"
    protocol            = "Tcp"
    frontend_port_start = 500
    frontend_port_end   = 1500
    backend_port        = 80
  }
  lb_probe = {
    name                = "http"
    port                = "80"
    protocol            = "Tcp"
    request_path        = null
    interval_in_seconds = 5
  }
  lb_rule = {
    name          = "http-rule"
    protocol      = "Tcp"
    frontend_port = 80
    backend_port  = 80
  }

}