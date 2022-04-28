# tf-module-node

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14.0 |
| openstack | ~> 1.35.0 |

## Providers

| Name | Version |
|------|---------|
| openstack | ~> 1.35.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [openstack_compute_availability_zones_v2](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/data-sources/compute_availability_zones_v2) |
| [openstack_compute_floatingip_associate_v2](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_floatingip_associate_v2) |
| [openstack_compute_instance_v2](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_instance_v2) |
| [openstack_networking_floatingip_v2](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_floatingip_v2) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| anti\_affinity | Whether or not to place a server in an anti-affinity group | `string` | `"false"` | no |
| associate\_public\_ip\_address | Associate a public IP address with the instance | `bool` | `false` | no |
| cluster\_name | Name of the cluster | `any` | n/a | yes |
| flavor\_name | Flavor (compute, memory, storage capacity) of instance | `string` | `"saveloy"` | no |
| floating\_ip\_pool | Subnet from which a floating IP address should be assigned | `string` | `""` | no |
| hostname\_format | Format the hostname inputs are index+1, region, cluster\_name | `string` | `"%[2]s-%[3]s-instance%[1]d"` | no |
| image\_name | The operating system image to be used for the instance | `string` | `""` | no |
| key\_pair | The name of the SSH key pair to be associated with this instance | `string` | `""` | no |
| network\_id | The UUID of the network to which the instance will be attached | `string` | `""` | no |
| num | How many instances should be created | `string` | `"1"` | no |
| security\_groups | The security groups (firewall rules) that will be applied to this instance | `list` | <pre>[<br>  "default"<br>]</pre> | no |
| tags | Node role tags | `list` | <pre>[<br>  ""<br>]</pre> | no |
| user\_data | User data to be used on this instance (cloud-init) | `string` | `""` | no |
| user\_name | The username to use for SSH access to a given image | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| instances | List of instance IDs |
| name | Instance name |
| private\_ips | List of private IP addresses created by this module |
| public\_ips | List of public ip addresses created by this module |
| tags | Tags associated with the instances |
