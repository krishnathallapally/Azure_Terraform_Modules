# # Variable: For subscription Id
# variable "subscription_id" {
#   type = string
#   description = "Subscription Id "
# }

# Variable: Resource Group For Virtual Network
variable "rg_vnet" {
  type = object({
    name     = string
    location = string
    tags     = map(string)
  })
  description = "Resource Group For Virtual Network"
  default = {
    name     = "az-Rg-vnet"
    location = "Central India"
    tags = {
      Name        = "LT-Vnet"
      Environment = "Dev"
    }
  }
}
# Variable: For Virtual Network Configurations
variable "vnet_configurations" {
  type = object({
    name          = string
    address_space = list(string)
    dns_servers   = list(string)
    tags          = map(string)
  })
  description = "Virtual Network Configuration Details to be Filled"
  default = {
    name          = "az-vnetwork"
    address_space = ["10.0.0.0/16"]
    dns_servers   = []
    tags = {
      Name        = "LT-Vnet"
      Environment = "Dev"
    }

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
    },
    {
      name             = "az-subnet-web-02"
      address_prefixes = ["10.0.1.0/24"]
    },
    {
      name             = "az-subnet-app-01"
      address_prefixes = ["10.0.2.0/24"]
    },
    {
      name             = "az-subnet-app-02"
      address_prefixes = ["10.0.3.0/24"]
    }

  ]

}
