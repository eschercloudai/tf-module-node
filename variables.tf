variable "num" {
  description = "How many instances should be created"
  default     = "1"
}

variable "cluster_name" {
  description = "Name of the cluster"
}

variable "flavor_name" {
  description = "Flavor (compute, memory, storage capacity) of instance"
  default     = "m1.large"
}

variable "image_name" {
  description = "The operating system image to be used for the instance"
  default     = ""
}

variable "network_id" {
  description = "The UUID of the network to which the instance will be attached"
  default     = ""
}

variable "security_groups" {
  description = "The security groups (firewall rules) that will be applied to this instance"
  default     = ["default"]
}

variable "key_pair" {
  description = "The name of the SSH key pair to be associated with this instance"
  default     = ""
}

variable "user_data" {
  description = "User data to be used on this instance (cloud-init)"
  default     = ""
}

variable "hostname_format" {
  description = "Format the hostname inputs are index+1, region, cluster_name"
  default     = "%[2]s-%[3]s-instance%[1]d"
}

variable "associate_public_ip_address" {
  description = "Associate a public IP address with the instance"
  default     = false
}

variable "floating_ip_pool" {
  description = "Subnet from which a floating IP address should be assigned"
  default     = ""
}

variable "user_name" {
  description = "The username to use for SSH access to a given image"
  default     = ""
}

variable "anti_affinity" {
  description = "Whether or not to place a server in an anti-affinity group"
  default     = "false"
}

variable "tags" {
  description = "Node role tags"
  default     = [""]
}

variable "boot_from_volume" {
  description = "Flag to boot an instance from a volume"
  default     = false
}

variable "volume_size" {
  description = "Size of disk (in GB) to create if booting from a volume"
  default     = "100"
}

variable "delete_on_termination" {
  description = "Whether or not to delete a volume on termination"
  default     = true
}
