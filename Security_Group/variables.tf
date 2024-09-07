# Variable: For Resource Group
variable "rg_security_group" {
  type = object({
    name     = string
    location = string

  })
  description = "Resource Group For Security Group"
  default = {
    name     = "az-SG-01"
    location = "Central India"

  }
}
# Variable : For Security Group Name 
variable "nsg_name" {
  type        = string
  default     = "nsg-security-group"
  description = "Network Security Group Name"
}

# Variable : For tags
variable "tags" {
  type = map(string)
  default = {
    Name        = "LT-SG"
    Environment = "Dev"

  }
}
# Variable for Network Security Group Rules 
variable "nsg_rules" {
  description = "List of Network Security Group rules"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string


  }))
  default = [{
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