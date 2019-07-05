# UCloud UHost Instance Terraform module

Terraform module which creates UHost instance(s) on UCloud (required Terraform 0.12.).

These types of resources are supported:

* [instance](https://www.terraform.io/docs/providers/ucloud/r/instance.html)
* [eip](https://www.terraform.io/docs/providers/ucloud/r/eip.html)
* [eip_association](https://www.terraform.io/docs/providers/ucloud/r/eip_association.html)
* [disk](https://www.terraform.io/docs/providers/ucloud/r/disk.html)
* [disk_attachment](https://www.terraform.io/docs/providers/ucloud/r/disk_attachment.html)

## Usage

```hcl
# Create uhost instance attached with eip and cloud disk
module "uhost_instance" {
  source  = "terraform-ucloud-modules/uhost-instance/ucloud"
  version = "1.0.0"

  # uhost instance
  instance_count   = 2
  instance_name    = "example-complete-instance"
  password         = "ucloud_2019"
  image_name_regex = "^CentOS 7.[1-2] 64"
  image_type       = "base"
  instance_type    = "n-standard-2"
  boot_disk_type   = "cloud_ssd"
  tag              = "example-complete"

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
```

## Examples

* [Complete UHost instance example](https://github.com/terraform-ucloud-modules/terraform-ucloud-uhost-instance/tree/master/examples/complete)


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| password | The password of instance | string | - | yes |
| availability\_zone | Available zone where instance and other resources are located. If not set, the first availability zone of current region will be used. | string | `""` | no |
| count\_format | Number format to use for output. | string | `"%02d"` | no |
| image\_name\_regex | The name regex of image to use for fetch specified image when image_id isn't set. | string | `"^CentOS 7.4 64"` | no |
| image\_type | The type of image to filter image when image_id isn't set. Possible values: base, business, custom. | string | `"base"` | no |
| image\_id | ID of image to use for instances. | string | `""` | no |
| instance\_count | Number of instances to launch. | string | `"1"` | no |
| instance\_type | The type of instance to launch. | string | `"n-basic-1"` | no |
| instance\_name | Name to be used on instances as prefix. | string | `"TF-UHost-Instance"` | no |
| charge\_type | The charge type of instance and other related resources. Possible values: year, month, dynamic. | string | `"month"` | no |
| duration | The duration of purchase of the instance and other related resources | string | `"1"` | no |
| boot\_disk\_type | The type of system disk. Possible values: local_normal, local_ssd, cloud_normal, cloud_ssd. | string | `"local_normal"` | no |
| local\_disk\_size | The size of local data disk | string | `"0"` | no |
| local\_disk\_type | The type of local data disk. Possible values: local_normal, local_ssd. | string | `"local_normal"` | no |
| tag | The tag of instance and other related resources | string | `"Default"` | no |
| security\_group | ID of security group to use for instances. If not set, the default security group will be used. | string | `""` | no |
| vpc\_id | The VPC linked to the instance | string | `""` | no |
| subnet\_id | The Subnet linked to the instance | string | `""` | no |
| disk\_count\_per\_instance | Number of disks attach to per instance. | string | `"0"` | no |
| disk\_name | Name to be used on disks as prefix | string | `"TF-Disk"` | no |
| disk\_size | The size of cloud data disk. | string | `"30"` | no |
| disk\_type | The type of cloud data disk. Possible values: data_disk, ssd_data_disk. | string | `"data_disk"` | no |
| eip\_count\_per\_instance | Number of eips assiocate to per instance. | string | `"0"` | no |
| eip\_name | Name to be used on eips as prefix | string | `"TF-EIP"` | no |
| eip\_bandwidth | Maximum bandwidth to the elastic public network, measured in Mbps. | string | `"1"` | no |
| eip\_internet\_type | The type of eip routes. Possible values: international, bgp. | string | `"bgp"` | no |
| eip\_charge\_mode | The charge mode of eip. Possible values: traffic, bandwidth. | string | `"bandwidth"` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance\_ids | List of IDs of instances |
| eip\_ids | List of IDs of eips |
| public\_ips | List of public IP addresses assigned to the instances, if applicable |
| disk\_ids | List of IDs of disks |
| instance\_id | List of IDs of instances |

## Authors

Module managed by [mingsheng.su](https://github.com/shawnmssu).

## Reference

* [Terraform-Provider-UCloud Github](https://github.com/terraform-providers/terraform-provider-ucloud)
* [Terraform-Provider-UCLoud Release](https://releases.hashicorp.com/terraform-provider-ucloud/)
* [Terraform-Provider-UCloud Docs](https://www.terraform.io/docs/providers/ucloud/index.html)
