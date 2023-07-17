resource "linode_instance" "k8s_master" {
	label = "k8s-master"
	image = var.image
	region = var.region
	type = "g6-standard-2"
	authorized_keys = [var.public_ssh_key]
	root_pass = var.root_pass
	tags = ["devops-practice-chatty"]
	private_ip = true
}

output "k8s_master_ip_address" {
	value = linode_instance.k8s_master.ip_address
}

