resource "linode_instance" "k8s_nodes" {
	label = each.key
	image = var.image
	region = var.region
	type = var.type
	authorized_keys = [var.public_ssh_key]
	root_pass = var.root_pass
	tags = ["devops-practice-chatty"]
	private_ip = true

	for_each = toset(var.k8s_nodes)
}

output "k8s_nodes_public_ip_addresses" {
	value = [
		for k8s_node in linode_instance.k8s_nodes : k8s_node.ip_address
	]
}

output "k8s_nodes_private_ip_addresses" {
	value = [
		for k8s_node in linode_instance.k8s_nodes : k8s_node.private_ip_address
	]
}

resource "local_file" "k8s_nodes_private_ip_address_file" {
	filename = format("%s%s%s", "../k8s_nodes_private_ip_addresses/", each.value.label, "_private_ip_addresses.txt")
	content = each.value.private_ip_address
	for_each = linode_instance.k8s_nodes
}

