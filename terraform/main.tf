resource "linode_instance" "load_balancer" {
	label = "load-balancer"
	image = var.image
	region = var.region
	type = var.type
	authorized_keys = [var.public_ssh_key]
	root_pass = var.root_pass
	tags = ["devops-practice-chatty"]
}

output "load_balancer_ip_address" {
	value = linode_instance.load_balancer.ip_address
}

resource "linode_instance" "app01" {
	label = "app01"
	image = var.image
	region = var.region
	type = var.type
	authorized_keys = [var.public_ssh_key]
	root_pass = var.root_pass
	tags = ["devops-practice-chatty"]
}

output "app01_ip_address" {
	value = linode_instance.app01.ip_address
}

resource "linode_instance" "db01" {
	label = "db01"
	image = var.image
	region = var.region
	type = var.type
	authorized_keys = [var.public_ssh_key]
	root_pass = var.root_pass
	tags = ["devops-practice-chatty"]
}

output "db01_ip_address" {
	value = linode_instance.db01.ip_address
}
