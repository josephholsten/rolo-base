instance_flavor = {
  shape = "VM.Standard.E2.1.Micro"
  # shape="VM.Standard.E4.Flex",
  # ocpus=1,
  # memory=4,
  # boot_volume_size=50
}

image_operating_system = "Oracle Linux"
image_operating_system_version = "9"

# ipxe_script = <<EOT
# kernel https://boot.netboot.xyz/memdisk iso raw
# initrd http://url/to/iso
# boot
# EOT

instance_ipxe_script = <<EOT
chain --autofree http://boot.netboot.xyz/ipxe/netboot.xyz.efi
EOT
