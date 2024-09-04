### Variable: For Resource Group
variable "rg_config" {
  description = "Resource Group"
  type = object({
    name     = string
    location = string
  })
  default = {
    name     = "az-linux-vm"
    location = "Central India"
  }
}

### Variable: For Virtual Network
variable "virtual_network_config" {
  description = "Virtual Network Configurations "
  type = object({
    name          = string
    address_space = list(string)
    dns_servers   = list(string)
  })
  default = {
    name          = "LT-Vnet"
    address_space = ["10.0.0.0/16"]
    dns_servers   = []
  }

}

### Variable: For Subnet
variable "subnet_config" {
  description = "Subnet Configurations"
  type = list(object({
    name             = string
    address_prefixes = list(string)
  }))
  default = [{
    name             = "lt-subnet-web-01"
    address_prefixes = ["10.0.0.0/24"]
    },
    {
      name             = "lt-subnet-web-02"
      address_prefixes = ["10.0.1.0/24"]
    },
    {
      name             = "lt-subnet-app-01"
      address_prefixes = ["10.0.2.0/24"]
    },

  ]
}

### Variable : For Tags
variable "tags" {
  type = map(any)
  default = {
    Name        = "LT-VM"
    Environment = "Dev"
  }
}

### Variable: For Newtwork Security Group 
variable "nsg_config" {
  description = "Network Security Group Name "
  type        = string
  default     = "Lt-vm-nsg"
}

### Variable : For Network Security Group Rules
variable "nsg_rules_config" {
  description = "List of Network Security group rules "
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
    name                       = "allow-ssh"
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
      name                       = "all-traffic"
      priority                   = 900
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
  }]

}

### Variable : For Public Ip
variable "pip_config" {
  description = "Public Ip Configuration"
  type = object({
    name              = string
    allocation_method = string
  })
  default = {
    name              = "Lt-vm-pip"
    allocation_method = "Static"
  }
}

### Variable : For Network Interface 
variable "nic_config" {
  description = "Network Interface Configurations"
  type        = string
  default     = "lt-vm-nic"

}

########  Variable: For Key Pair Name
variable "key_name" {
  description = "Name of SSh-Key"
  type        = string
  default     = "linux-key.pem"
}

##### Variable : For ssh public key Name
variable "ssh_key_path" {
  description = "SSh key Name "
  type        = string
  default     = "az-linux-ssh-key"
}

#### ###### Variable: For linux Virtual Machine
variable "vm_config" {
  description = "All Required virtual machine configurations"
  type = object({
    name           = string
    size           = string
    admin_username = string

    admin_ssh_key = object({
      username   = string
      #public_key = string
    })

    os_disk = object({
      caching              = string
      storage_account_type = string
    })

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })

  })

  default = {
    name           = "sk-vm"
    size           = "Standard_D2s_v3"
    admin_username = "vmadmin"

    admin_ssh_key = {
      username   = "vmadmin"
    }

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }

}