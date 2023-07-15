resource "linode_instance" "load_balancer" {
	label = "load-balancer"
	image = var.image
	region = var.region
	type = var.type
	authorized_keys = [var.public_ssh_key]
	root_pass = var.root_pass
	tags = ["devops-practice-chatty"]
	private_ip = true
}

output "load_balancer_ip_address" {
	value = linode_instance.load_balancer.ip_address
}

resource "linode_instance" "app_servers" {
	label = each.key
	image = var.image
	region = var.region
	type = var.type
	authorized_keys = [var.public_ssh_key]
	root_pass = var.root_pass
	tags = ["devops-practice-chatty"]
	private_ip = true

	for_each = toset(var.app_servers)
}

output "app_public_ip_addresses" {
	value = [
		for app_server in linode_instance.app_servers : app_server.ip_address
	]
}

output "app_private_ip_addresses" {
	value = [
		for app_server in linode_instance.app_servers : app_server.private_ip_address
	]
}

resource "local_file" "app_private_ip_address_file" {
	filename = format("%s%s%s", "../app_private_ip_addresses/", each.value.label, "_private_ip_addresses.txt")
	content = each.value.private_ip_address
	for_each = linode_instance.app_servers
}

resource "linode_instance" "db01" {
	label = "db01"
	image = var.image
	region = var.region
	type = var.type
	authorized_keys = [var.public_ssh_key]
	root_pass = var.root_pass
	tags = ["devops-practice-chatty"]
	private_ip = true
}

resource "local_file" "db01_ip_address_file" {
	filename = "../db01_ip_address.txt"
	content = linode_instance.db01.ip_address
}

output "db01_ip_address" {
	value = linode_instance.db01.ip_address
}
