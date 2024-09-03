module "vnet" {
  source = "..//.."

  rg_vnet = {
    name     = "az-Rg-vnet"
    location = "Central India"
    tags = {
      Name        = "LT-Vnet"
      Environment = "Dev"
    }    
    
  }
  vnet_configurations = {
    name          = "az-vnetwork"
    address_space = ["10.0.0.0/16"]
    dns_servers   = []
    tags = {
      Name        = "LT-Vnet"
      Environment = "Dev"
    }    
  }
  subnet_configurations = [ 
    {
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