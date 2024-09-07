# Azure External Load Balancer

### Introduction

* Load balancing refers to efficiently distributing incoming network traffic across a group of backend servers or resources.

* Azure Load Balancer operates at layer 4 of the Open Systems Interconnection (OSI) model. It's the single point of contact for clients. Load balancer distributes inbound flows that arrive at the load balancer's front end to backend pool instances. These flows are according to configured load-balancing rules and health probes. The backend pool instances can be Azure Virtual Machines or instances in a Virtual Machine Scale Set.

### Module 
---------------------------------------------------------------------------------------------------------------------------

* Modules are the key ingredient to writing reusable, maintainable, and testable Terraform code.
* A Terraform module is very simple: any set of Terraform configuration files in a folder is a module.
* Syntax for using a module
```
module "< NAME >" {
    source = "< SOURCE >"

    [CONFIG ...]
}
```

* ***NAME***  is an identifier you can use throughout the Terraform code to refer to this module.
* ***SOURCE*** is the path where the module code can be found.
* ***CONFIG*** consists of arguments that are specific to that module.

### Azure External Load Balancer Module
--------------------------------------------------------------------------------------------------------------------------------

* A public load balancer can provide outbound connections for virtual machines (VMs) inside your virtual network. These connections are accomplished by translating their private IP addresses to public IP addresses. Public Load Balancers are used to load balance internet traffic to your VMs.
* Terraform module to create external load balancer 
* Type of resources supported 
```
  * "azurerm_public_ip"                              # For Public Ip
  * "azurerm_lb"                                     # For load balancer
  * "azurerm_lb_backend_address_pool"                # For load balancer backend pool
  * "azurerm_lb_nat_rule"                            # For load balancer nat rule
  * "azurerm_lb_probe"                               # for load balancer probe
  *  "azurerm_lb_rule"                               # for load balancer rule
```

* Use the help of official Docs for above resources 
 
* ["azurerm_public_ip"](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip)
* ["azurerm_lb"](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb)
* ["azurerm_lb_backend_address_pool"](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool)
* ["azurerm_lb_nat_rule"](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_nat_rule)
* ["azurerm_lb_probe"](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe)
* ["azurerm_lb_rule"](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule)

### Module Usage 

```
module "Virtual_Network" {
  source = "..//.." # Here You can give path to your vnet files located

  # Give your Configurations details from root module which  bascially are from  variables section of their respective resources

}
```


```
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
```

* This module by default creates resource group, virtual network, Load balancer  with their respective names provided
* You can Configure names and data according to your needs.

### Terraform Usage
-------------------------------------------------------------------------------------------------------------------------------------

##### Initialize Terraform

* The terraform init command initializes a working directory containing Terraform configuration files.

```
terraform init
```
##### Validate Terraform

* The terraform validate command validates the configuration files in a directory.Validate runs checks that verify whether a configuration is syntactically valid and internally consistent, regardless of any provided variables or existing state.

```
terraform validate
```

##### Terraform execution plan

* The terraform plan command creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure.

```
terraform plan -out main.tfplan
```
##### Apply a Terraform execution plan

* The terraform apply command executes the actions proposed in a Terraform plan

```
terraform apply main.tfplan
```

* Verify the results 

##### Terraform Destroy

* The terraform destroy command terminates resources managed by your Terraform project.
* After Completion Of your Project or needs, if you want to terminate resources created use terraform destroy.
```
terraform destroy 
    or 
terraform destroy -auto-approve  
```  
