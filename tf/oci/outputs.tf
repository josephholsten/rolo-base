output "instance_private_ip" {
  value = oci_core_instance.instance[0].private_ip
}
output "instance_public_ip" {
  value = oci_core_instance.instance[0].public_ip
}
