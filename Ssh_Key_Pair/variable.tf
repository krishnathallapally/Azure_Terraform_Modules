
# Variable : For resourc egroup
variable "resource_group_info" {
  type = object({
    name = string
    location = string
  })  
  default = {
    name = "az=rg-01"
    location = "central India"
  }
}

# variable key pair info
variable "key_pair_info" {
  type = object({
    name = string
    generate_and_upload = bool
    filename = string
    algorithm = string
    rsa_bits = string
    file_permission =string
    # private_key_path = string
  })
  default = {
    name = "my_id_rsa_pub"
    generate_and_upload = true
    filename = "myid_rsa"
    algorithm = "RSA"
    rsa_bits = "4096"
    file_permission = "0400"
    # private_key_path = "../"
  }
  
}



