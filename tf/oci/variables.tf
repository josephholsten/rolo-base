variable "chef_server_url" {
  description = ""
}

variable "chef_validation_key" {
  description = ""
}

variable "chef_json_attributes" {
  description = ""
}

variable "tenancy" {
  description = "organization account identifier within Oracle Cloud"
}

variable "compartment" {
  description = "compartment identifier within tenancy environment"
}

variable "environment" {
  description = "lifecycle environment, often useful as a key. Must match and existing environment in chef"
  default     = "test"
}

variable "role" {
  description = "server role, must match an existing role in chef"
  default        = "base"
}

variable "cohort" {
  description = "identifier for a group of servers, used for blue-green deployments, canaries, &c"
  default     = ""
}

variable "dc_region" {
  description = "datacenter region, often useful as a key"
  default     = "phx"
}

variable "dc_region_availability" {
  description = "datacenter region availability division, often useful as a key"
  default     = "1"
}

variable "network" {
  description = "network the instance should belong to"
}
variable "subnet" {
  description = "subnetwork the instance should belong to"
}
variable "enable_public_address" {
  description = "whether to assign a public address to the instance"
  default     = false
}

variable "instance_count" {
  default = 1
}

variable "instance_flavor" {
  description = "The shape of the operator instance."
  default = {
    shape = "VM.Standard.E4.Flex", ocpus = 1, memory = 4, boot_volume_size = 50
  }
  type = map(any)
}

variable "instance_disk_image_id" {
  description = "image to boot from"
  default     = "Oracle Linux"
}
variable "instance_disk_image_os" {
  description = "image to boot from"
  default     = "Oracle Linux"
}
variable "instance_disk_image_os_version" {
  description = "image version to boot from"
  default     = 9
}

variable "instance_disk_size_gb" {
  description = "storage disk size in GiB"
  default     = "20"
}

# variable "instance_disk_type" {
#   description = "storage disk type"
#   default     = "pd-standard"
# }

variable "ssh_public_key" {
  description = "ssh public key"
}
