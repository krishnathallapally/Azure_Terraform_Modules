### Manages a Public IP Address
resource "azurerm_public_ip" "frontend_pip" {
  name                = var.public_ip.name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  allocation_method   = var.public_ip.allocation_method

  depends_on = [azurerm_resource_group.resource_group]
}

### Manages a Load Balancer Resource.
resource "azurerm_lb" "ext_lb" {
  name                = var.load_balancer.name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  frontend_ip_configuration {
    name                 = var.load_balancer.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.frontend_pip.id

  }
}

### Manages a Load Balancer Backend Address Pool.
resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id    = azurerm_lb.ext_lb.id
  name               = var.load_balancer.backend_address_pool_name
  virtual_network_id = azurerm_virtual_network.virtual_network.id

  depends_on = [azurerm_lb.ext_lb, azurerm_virtual_network.virtual_network]
}

### Manages a Load Balancer NAT Rule.
resource "azurerm_lb_nat_rule" "inbound_nat_rule" {
  resource_group_name            = azurerm_resource_group.resource_group.name
  loadbalancer_id                = azurerm_lb.ext_lb.id
  name                           = var.lb_nat_rule.name
  protocol                       = var.lb_nat_rule.protocol
  frontend_port_start            = var.lb_nat_rule.frontend_port_start
  frontend_port_end              = var.lb_nat_rule.frontend_port_end
  backend_port                   = var.lb_nat_rule.backend_port
  backend_address_pool_id        = azurerm_lb_backend_address_pool.backend_pool.id
  frontend_ip_configuration_name = azurerm_lb.ext_lb.frontend_ip_configuration[0].name

  depends_on = [azurerm_lb.ext_lb, azurerm_lb_backend_address_pool.backend_pool]
}

### Manages a LoadBalancer Probe Resource
resource "azurerm_lb_probe" "http_probe" {
  loadbalancer_id     = azurerm_lb.ext_lb.id
  name                = var.lb_probe.name
  port                = var.lb_probe.port
  protocol            = var.lb_probe.protocol
  request_path        = var.lb_probe.request_path
  interval_in_seconds = var.lb_probe.interval_in_seconds

  depends_on = [azurerm_lb.ext_lb]
}

### Manages a Load Balancer Rule.
resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.ext_lb.id
  name                           = var.lb_rule.name
  protocol                       = var.lb_rule.protocol
  frontend_port                  = var.lb_rule.frontend_port
  backend_port                   = var.lb_rule.backend_port
  frontend_ip_configuration_name = azurerm_lb.ext_lb.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool.id]

  depends_on = [azurerm_lb.ext_lb, azurerm_lb_backend_address_pool.backend_pool]
}
