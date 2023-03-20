resource "oci_core_instance" "instance" {
  count = var.instance_count

  display_name = "${var.role}-${count.index+1}${var.cohort}"

  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id = var.compartment

  shape = lookup(var.instance_flavor, "shape", "VM.Standard.E4.Flex")
  dynamic "shape_config" {
    for_each = length(regexall("Flex", lookup(var.instance_flavor, "shape", "VM.Standard.E4.Flex"))) > 0 ? [1] : []
    content {
      ocpus         = lookup(var.instance_flavor, "ocpus", 1)
      memory_in_gbs = lookup(var.instance_flavor, "memory", 4)
    }
  }

#   launch_options {
#     boot_volume_type = "PARAVIRTUALIZED"
#     network_type     = "PARAVIRTUALIZED"
#   }
#   is_pv_encryption_in_transit_enabled = var.enable_pv_encryption_in_transit

  create_vnic_details {
    assign_public_ip = var.enable_public_address
#     display_name     = var.label_prefix == "none" ? "instance-vnic" : "${var.label_prefix}-instance-vnic"
#     hostname_label   = var.assign_dns ? var.label_prefix == "none" ? "instance" : "${var.label_prefix}-instance" : null
#     nsg_ids          = concat(var.nsg_ids, [oci_core_network_security_group.instance.id])
    subnet_id        = var.subnet
  }

  source_details {
    source_type = "image"
    source_id   = local.instance_image_id
#     kms_key_id  = var.boot_volume_encryption_key
  }

#   agent_config {
#     are_all_plugins_disabled = false
#     is_management_disabled   = false
#     is_monitoring_disabled   = false

#     plugins_config {
#       desired_state = "ENABLED"
#       name          = "Bastion"
#     }
#     plugins_config {
#       desired_state = "DISABLED"
#       name          = "OS Management Service Agent"
#     }
#   }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data           = data.cloudinit_config.instance.rendered
  }
#   freeform_tags  = var.freeform_tags
  ipxe_script = var.instance_ipxe_script
}
