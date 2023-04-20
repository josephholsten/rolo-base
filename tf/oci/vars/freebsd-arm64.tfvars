instance_flavor = {
  shape = "VM.Standard.A1.Flex"
  # ocpus=1,
  # memory=4,
  # boot_volume_size=50
}

# image_operating_system = "FreeBSD"
# image_operating_system_version = "13.1"

# FreeBSD-13.1-test
instance_image = "ocid1.image.oc1..aaaaaaaayjatgvecms7kciqjx5exbj4dpcs3ympvpggpodwlfuezn7dejdja"

instance_cloudinit_script_path = "templates/cloud-init_freebsd.yaml"

# TODO: cloudinit
# pkg install rubygem-chef-bin
# ln -s /etc/cinc /etc/chef
# /etc/cinc/firstboot.json
