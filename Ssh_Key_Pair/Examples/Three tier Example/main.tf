#  Module For SSh key 
module "ssh_key" {
  source = "..//.."
  resource_group_info = {
    name     = "az-rg-01"
    location = "Central India"
  }
  key_pair_info = {
    name                = "my_id_rsa_pub"
    generate_and_upload = false
    filename            = "myid_rsa"
    algorithm           = "RSA"
    rsa_bits            = "4096"
    file_permission     = "0400"
    # private_key_path    = "."
  }

}