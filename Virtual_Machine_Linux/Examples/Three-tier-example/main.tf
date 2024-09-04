### Module: For Linux Machine
module "linux_virtual_machine" {
  source = "..//.."

  rg_config = {
    name     = "az-linux-vm"
    location = "Central India"
  }

  virtual_network_config = {
    name          = "LT-Vnet"
    address_space = ["10.0.0.0/16"]
    dns_servers   = []
  }

  subnet_config = [
    {
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
    {
      name             = "lt-subnet-app-02"
      address_prefixes = ["10.0.3.0/24"]
    }

  ]
  tags = {
    Name        = "LT-VM"
    Environment = "Dev"
  }

  nsg_config = "Lt-vm-nsg"

  nsg_rules_config = [
    {
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
    }
  ]

  pip_config = {
    name              = "Lt-vm-pip"
    allocation_method = "Static"
  }

  nic_config = "lt-vm-nic"

  key_name     = "linux-key.pem"
  ssh_key_path = "az-linux-ssh-key"

  vm_config = {
    name           = "Lt-vm"
    size           = "Standard_DS1_v2"
    admin_username = "vmadmin"

    admin_ssh_key = {
      username   = "vmadmin"
      public_key = "var.key_path"
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