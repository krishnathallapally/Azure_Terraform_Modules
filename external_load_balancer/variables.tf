variable "rg_config" {
  type = object({
    name     = string
    location = string
  })
  default = {
    name     = "Load_balancer_rg"
    location = "Australia East"
  }
}
### Variable for tags
variable "tags" {
  type = map(string)
  default = {
    name        = "load balancer"
    Environment = "Dev"
  }
}
# Variable: For Virtual Network Configurations
variable "vnet_configurations" {
  type = object({
    name          = string
    address_space = list(string)
    dns_servers   = list(string)
  })
  description = "Virtual Network Configuration Details to be Filled"
  default = {
    name          = "lb-vnetwork"
    address_space = ["10.0.0.0/16"]
    dns_servers   = []
  }
}
# Variable: For Subnet Configurations
variable "subnet_configurations" {
  type = list(object({
    name             = string
    address_prefixes = list(string)
  }))
  description = "Subnet Configuration Details to be Filled"
  default = [{
    name             = "az-subnet-web-01"
    address_prefixes = ["10.0.0.0/24"]
    }, {
    name             = "az-subnet-app-01"
    address_prefixes = ["10.0.1.0/24"]
  }]
}

### Variablr for public ip
variable "public_ip" {
  type = object({
    name              = string
    allocation_method = string
  })
  default = {
    name              = "frontend_public_ip"
    allocation_method = "Static"
  }
}

### variable for load balancer config
variable "load_balancer" {
  type = object({
    name                           = string
    frontend_ip_configuration_name = string
    backend_address_pool_name      = string
  })
  default = {
    name                           = "external_load_balancer"
    frontend_ip_configuration_name = "front_end"
    backend_address_pool_name      = "backend_pool"
  }
}

### Variable for load balancer NAT Rule Config
variable "lb_nat_rule" {
  type = object({
    name                = string
    protocol            = string
    frontend_port_start = number
    frontend_port_end   = number
    backend_port        = number
  })
  default = {
    name                = "lb_nat_rule"
    protocol            = "Tcp"
    frontend_port_start = 500
    frontend_port_end   = 1500
    backend_port        = 80
  }
}

### Variable for load balance probe
variable "lb_probe" {
  type = object({
    name                = string
    port                = string
    protocol            = string
    request_path        = string
    interval_in_seconds = number
  })
  default = {
    name                = "Http"
    port                = "80"
    protocol            = "Tcp"
    request_path        = null
    interval_in_seconds = 5
  }
}

### variable for load balance rule
variable "lb_rule" {
  type = object({
    name          = string
    protocol      = string
    frontend_port = number
    backend_port  = number
  })
  default = {
    name          = "http-rule"
    protocol      = "Tcp"
    frontend_port = 80
    backend_port  = 80
  }
}