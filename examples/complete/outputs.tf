output "ids" {
  description = "List of IDs of instances"
  value       = module.uhost_instance.instance_ids
}

output "public_ips" {
  description = "List of public IP addresses assigned to the instances"
  value       = module.uhost_instance.public_ips
}

output "disk_ids" {
  description = "List of IDs of disks"
  value       = module.uhost_instance.disk_ids
}

