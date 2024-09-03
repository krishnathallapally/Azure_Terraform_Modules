# Network Security Group Id
output "nsg_groups" {
  description = "The IDs of the created Network Security Groups"
  value       = module.Network_Security_Group.nsg_group

}
# output of Network Security Group Rules Id
output "nsggroupname" {
  description = "The IDs of the created Network Security Group rules"
  value       = module.Network_Security_Group.nsg_group_name
}