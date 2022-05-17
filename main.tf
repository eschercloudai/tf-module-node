data "openstack_compute_availability_zones_v2" "region" {}

data "openstack_images_image_v2" "image" {
  name        = var.image_name
  most_recent = true
}

terraform {
  required_version = ">= 1.1.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.47.0"
    }
  }
}

resource "openstack_compute_instance_v2" "instance" {
  count           = var.num
  name            = format(var.hostname_format, count.index + 1, var.cluster_name, join("-", var.tags))
  image_name      = var.image_name
  flavor_name     = var.flavor_name
  key_pair        = var.key_pair
  user_data       = var.user_data
  security_groups = var.security_groups
  tags            = var.tags

  dynamic "block_device" {
    for_each = var.boot_from_volume ? [{ size = var.volume_size }] : []
    content {
      uuid                  = data.openstack_images_image_v2.image.id
      source_type           = "image"
      volume_size           = block_device.value["size"]
      boot_index            = 0
      destination_type      = "volume"
      delete_on_termination = var.delete_on_termination
    }
  }

  network {
    uuid = var.network_id
  }
}

resource "openstack_networking_floatingip_v2" "instance_fip" {
  count = var.associate_public_ip_address ? var.num : 0
  pool  = var.floating_ip_pool
}

resource "openstack_compute_floatingip_associate_v2" "instance_fip" {
  count       = var.associate_public_ip_address ? var.num : 0
  instance_id = openstack_compute_instance_v2.instance.*.id[count.index]
  floating_ip = openstack_networking_floatingip_v2.instance_fip.*.address[count.index]
}
