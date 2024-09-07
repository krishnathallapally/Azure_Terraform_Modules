# Network Security Group Id
output "nsg_groups" {
  description = "The IDs of the created Network Security Groups"
  value       = module.network_security_group.nsg_group_id

}
# output of Network Security Group Rules Id
output "nsggroupname" {
  description = "The Network Security Group names"
  value       = module.network_security_group.nsg_group_name
}