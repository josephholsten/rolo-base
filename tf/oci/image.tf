variable "image_operating_system" {
  description = "operating system type to find image"
  default = ""
}

variable "image_operating_system_version" {
  description = "operating system type to find image"
  default = ""
}

variable "instance_image" {
  description = "instance image"
  default = ""
}

data "oci_core_images" "images" {
  compartment_id           = var.compartment
  operating_system         = var.image_operating_system
  operating_system_version = var.image_operating_system_version
  shape                    = lookup(var.instance_flavor, "shape", "VM.Standard.E4.Flex")
  sort_by                  = "TIMECREATED"
}


locals {
  # instance_image_id = data.oci_core_images.images.images.0.id
  # instance_image_id = var.instance_image
  instance_image_id = var.instance_image == "" ? data.oci_core_images.images.images.0.id : var.instance_image
}

# Yes, it's potentially a double lookup. 
data "oci_core_image" "image" {
  image_id = local.instance_image_id
}

output "image" {
  # value = data.oci_core_images.images.images[0]
  value = data.oci_core_image.image
}
