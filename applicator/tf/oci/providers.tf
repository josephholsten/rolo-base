terraform {
    required_providers {
        cloudinit = {
            source = "hashicorp/cloudinit"
            version = "~> 2.3.2"
        }
        oci = {
            source = "oracle/oci"
            version = "~> 4.111.0"
        }
    }
}

provider "oci" {
    auth = "InstancePrincipal"
    region = var.dc_region
}
