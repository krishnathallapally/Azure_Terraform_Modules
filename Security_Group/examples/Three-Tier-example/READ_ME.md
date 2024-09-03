## Module 

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

### Azure Network Security Group Module

* Terraform Module to create Security Group along with Rules.
* Type of resources are supported:
    
    * [azurerm_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)
    * [azurerm_network_security_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group)
    * [azurerm_network_security_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule)

### Module Usage 

```
module "Virtual_Network" {
  source = "..//.." # Here You can give path to your vnet files located

  # Give your Configurations details from root module which  bascially are from  variables section of their respective resources

}
```
* This module by default creates  resource group, security group and securtiy group rule with their respective names provided.
* You can Configure names and data according to your needs if you want to.


#### Terraform Usage

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
##### Possibility of Error Occurences

* Give your module path correctly and check your variable section of root module is given correctly if you are facing an error.


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
