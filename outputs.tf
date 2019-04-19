output "instance_ids" {
  description = "List of IDs of instances"
  value       = "${ucloud_instance.instances.*.id}"
}

output "eip_ids" {
  description = "List of IDs of eips"
  value       = "${ucloud_eip.eips.*.id}"
}

output "public_ips" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = "${ucloud_eip.eips.*.public_ip}"
}

output "disk_ids" {
  description = "List of IDs of disks"
  value       = "${ucloud_disk.disks.*.id}"
}
