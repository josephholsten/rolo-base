data "oci_identity_availability_domain" "ad" {
  compartment_id = var.compartment
  ad_number      = var.dc_region_availability
}

locals {
  chef_attributes = {
    policy_name = var.role
    policy_group = var.environment
  }
}

data "cloudinit_config" "instance" {
  gzip          = true
  base64_encode = true

  part {
    filename     = "instance.yaml"
    content_type = "text/cloud-config"
    content = templatefile(
      var.instance_cloudinit_script_path, {
        chef_server_url = var.chef_server_url
        chef_validation_key = var.chef_validation_key
        chef_attributes = local.chef_attributes
      }
    )
  }
}
