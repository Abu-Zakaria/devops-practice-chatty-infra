resource "linode_instance" "db01" {
	label = "db01"
	image = var.image
	region = var.region
	type = var.type
	authorized_keys = [var.public_ssh_key]
	root_pass = var.root_pass
	tags = var.tags
	private_ip = true
}

resource "local_file" "db01_ip_address_file" {
	filename = "../db01_ip_address.txt"
	content = linode_instance.db01.ip_address
}

output "db01_ip_address" {
	value = linode_instance.db01.ip_address
}

