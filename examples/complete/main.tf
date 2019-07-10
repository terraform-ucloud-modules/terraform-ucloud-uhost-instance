provider "ucloud" {
  region = "cn-bj2"
}

# Query default security group
data "ucloud_security_groups" "default" {
  type = "recommend_web"
}

data "ucloud_images" "default" {
  availability_zone = "cn-bj2-05"
  name_regex        = "^CentOS 7.[1-2] 64"
  image_type        = "base"
}

# Create uhost instance attached with eip and cloud disk
module "uhost_instance" {
  source = "../../"

  # common config
  availability_zone = "cn-bj2-05"
  tag               = "example-complete"

  # uhost instance
  instance_count = 2
  image_id       = data.ucloud_images.default.images[0].id
  instance_type  = "n-standard-2"
  password       = "ucloud_2019"
  instance_name  = "example-complete-instance"
  boot_disk_type = "cloud_ssd"
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