provider "ucloud" {
  region = "cn-bj2"
}

module "uhost_instance" {
  source = "../../"

  instance_count   = 2
  instance_name    = "example-complete"
  root_password    = "ucloud_2019"
  image_name_regex = "^CentOS 7.[1-2] 64"
  instance_type    = "n-standard-2"
  instance_tag     = "example-complete"

  eip_count     = 1 
  eip_internet_type = "bgp"
  eip_charge_mode   = "bandwidth"

  disk_count = 1
  disk_size  = 30
  disk_type  = "ssd_data_disk"
}
