## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| availability\_zone | Available zone where instance and other resources are located. | string | `""` | no |
| boot\_disk\_type | The type of boot disk. Possible values: local_normal, local_ssd, cloud_normal, cloud_ssd. | string | `"local_normal"` | no |
| charge\_type | The charge type of instance and other related resources. Possible values: year, month, dynamic. | string | `"month"` | no |
| count\_format | Number format to use for output. | string | `"%02d"` | no |
| data\_disk\_size | The size of local data disk | string | `"0"` | no |
| data\_disk\_type | The type of local data disk. Possible values: local_normal, local_ssd. | string | `"local_normal"` | no |
| disk\_count | Number of disks to launch. | string | `"0"` | no |
| disk\_name | Name to be used on disks as prefix | string | `"TF-Disk"` | no |
| disk\_size | The size of cloud data disk. | string | `"50"` | no |
| disk\_tag | The tag of disk. | string | `"Default"` | no |
| disk\_type | The type of cloud data disk. Possible values: data_disk, ssd_data_disk. | string | `"data_disk"` | no |
| duration | The duration of purchase of the instance and other related resources | string | `"1"` | no |
| eip\_bandwidth | Maximum bandwidth to the elastic public network, measured in Mbps. | string | `"1"` | no |
| eip\_charge\_mode | The charge mode of eip. Possible values: traffic, bandwidth. | string | `"bandwidth"` | no |
| eip\_count | Number of eips to launch. | string | `"0"` | no |
| eip\_internet\_type | The type of eip routes. Possible values: international, bgp. | string | `"bgp"` | no |
| eip\_name | Name to be used on eips as prefix | string | `"TF-EIP"` | no |
| eip\_remark | The remarks of eip. | string | `""` | no |
| eip\_tag | The tag of eip. | string | `"Default"` | no |
| image\_id | ID of image to use for instances. | string | `""` | no |
| image\_name\_regex | The name regex of image to use for fetch specified image. | string | `"^CentOS 6.5 64"` | no |
| image\_type | The type of image. Possible values: base, business, custom. | string | `"base"` | no |
| instance\_count | Number of instances to launch. | string | `"1"` | no |
| instance\_name | Name to be used on instances as prefix | string | `"TF-UHost-Instance"` | no |
| instance\_remark | The remarks of instance | string | `""` | no |
| instance\_tag | The tag of instance | string | `"Default"` | no |
| instance\_type | The type of instance to launch. | string | `"n-basic-2"` | no |
| root\_password | The password of instance | string | n/a | yes |
| security\_group | ID of security group to use for instances. | string | `""` | no |
| subnet\_id | The Subnet linked to the instance | string | `""` | no |
| vpc\_id | The VPC linked to the instance | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| disk\_ids | List of IDs of disks |
| eip\_ids | List of IDs of eips |
| instance\_ids | List of IDs of instances |
| public\_ips | List of public IP addresses assigned to the instances, if applicable |

