variable "availability_zone" {
  description = "Available zone where instance and other resources are located. If not set, the first availability zone of current region will be used."
  default     = ""
}

variable "count_format" {
  description = "Number format to use for output."
  default     = "%02d"
}

# image
variable "image_name_regex" {
  description = "The name regex of image to use for fetch specified image when image_id isn't set"
  default     = "^CentOS 7.4 64"
}

variable "image_type" {
  description = "The type of image to filter image when image_id isn't set."
  default     = "base"
}

variable "image_id" {
  description = "ID of image to use for instances."
  default     = ""
}

# uhost instance
variable "instance_count" {
  description = "Number of instances to launch."
  default     = 1
}

variable "instance_type" {
  description = "The type of instance to launch."
  default     = "n-basic-1"
}

variable "password" {
  description = "The password of instance"
}

variable "instance_name" {
  description = "Name to be used on instances as prefix"
  default     = "TF-UHost-Instance"
}

variable "charge_type" {
  description = "The charge type of instance and other related resources. Possible values: year, month, dynamic."
  default     = "month"
}

variable "duration" {
  description = "The duration of purchase of the instance and other related resources"
  default     = 1
}

variable "boot_disk_type" {
  description = "The type of system disk. Possible values: local_normal, local_ssd, cloud_normal, cloud_ssd."
  default     = "local_normal"
}

variable "local_disk_size" {
  description = "The size of local data disk"
  default     = 0
}

variable "local_disk_type" {
  description = "The type of local data disk. Possible values: local_normal, local_ssd."
  default     = "local_normal"
}

variable "tag" {
  description = "The tag of instance and other related resources"
  default     = "Default"
}

variable "security_group" {
  description = "ID of security group to use for instances. If not set, the default security group will be used."
  default     = ""
}

variable "vpc_id" {
  description = "The VPC linked to the instance"
  default     = ""
}

variable "subnet_id" {
  description = "The Subnet linked to the instance"
  default     = ""
}

# cloud disk

variable "disk_count_per_instance" {
  description = "Number of disks attach to per instance."
  default     = 0
}

variable "disk_name" {
  description = "Name to be used on disks as prefix"
  default     = "TF-Disk"
}

variable "disk_size" {
  description = "The size of cloud data disk."
  default     = 30
}

variable "disk_type" {
  description = "The type of cloud data disk. Possible values: data_disk, ssd_data_disk."
  default     = "data_disk"
}

# eip

variable "eip_count_per_instance" {
  description = "Number of eips assiocate to per instance."
  default     = 0
}

variable "eip_name" {
  description = "Name to be used on eips as prefix"
  default     = "TF-EIP"
}

variable "eip_bandwidth" {
  description = "Maximum bandwidth to the elastic public network, measured in Mbps."
  default     = 1
}

variable "eip_internet_type" {
  description = "The type of eip routes. Possible values: international, bgp."
  default     = "bgp"
}

variable "eip_charge_mode" {
  description = "The charge mode of eip. Possible values: traffic, bandwidth."
  default     = "bandwidth"
}
