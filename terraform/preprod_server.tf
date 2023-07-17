resource "linode_instance" "preprod01" {
	label = "preprod01"
	image = var.image
	region = var.region
	type = var.type
	authorized_keys = [var.public_ssh_key]
	root_pass = var.root_pass
	tags = ["devops-practice-chatty"]
	private_ip = true
}

output "preprod01_ip_address" {
	value = linode_instance.preprod01.ip_address
}

