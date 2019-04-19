provider "ucloud" {
  region = "cn-bj2"
}

module "uhost_instance" {
  source = "../../"

  instance_count = 2

  instance_name    = "example-complete-instance"
  password    = "ucloud_2019"
  image_name_regex = "^CentOS 7.[1-2] 64"
  instance_type    = "n-standard-2"
  tag     = "example-complete"

  eip_count_per_instance = 1
  eip_internet_type      = "bgp"
  eip_charge_mode        = "bandwidth"
  eip_name  = "example-complete-eip"

  disk_count_per_instance = 1
  disk_size               = 30
  disk_type               = "ssd_data_disk"
  disk_name   = "example-complete-disk"
}
