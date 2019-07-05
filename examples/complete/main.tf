provider "ucloud" {
  region = "cn-bj2"
}

# Query default security group
data "ucloud_security_groups" "default" {
  type = "recommend_web"
}

# Create uhost instance attached with eip and cloud disk
module "uhost_instance" {
  source = "../../"

  # uhost instance
  instance_count   = 2
  instance_name    = "example-complete-instance"
  password         = "ucloud_2019"
  image_name_regex = "^CentOS 7.[1-2] 64"
  image_type       = "base"
  instance_type    = "n-standard-2"
  boot_disk_type   = "cloud_ssd"
  tag              = "example-complete"

  # the default Web Security Group that UCloud recommend to users
  security_group = data.ucloud_security_groups.default.security_groups[0].id

  # eip
  eip_count_per_instance = 1
  eip_internet_type      = "bgp"
  eip_charge_mode        = "bandwidth"
  eip_name               = "example-complete-eip"

  # disk
  disk_count_per_instance = 1
  disk_size               = 30
  disk_type               = "ssd_data_disk"
  disk_name               = "example-complete-disk"
}