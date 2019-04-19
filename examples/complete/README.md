# Complete UHost instance

Configuration in this directory creates UHost instances with minimum set of arguments. It will also assign Elastic IP (EIP) to an instance.

Unspecified arguments for security group id, subnet and VPC are used from the default.

This example outputs instance id and public ip, etc.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

## Outputs

| Name | Description |
|------|-------------|
| ids | List of IDs of instances |
| public\_ips | List of public IP addresses assigned to the instances |
| disk\_ids | List of IDs of disks |
