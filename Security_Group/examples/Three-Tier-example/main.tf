# Module : For Network Security Group 
module "Network_Security_Group" {
  source = "..//.."

  rg_Security_Group = {
    name     = "az-SG-01"
    location = "Central India"
  }
  nsg_name = "nsg-01"
  nsg_rules = [
    {
      name                       = "allow_ssh"
      priority                   = 1000
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "all_traffic"
      priority                   = 900
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }


  ]


}