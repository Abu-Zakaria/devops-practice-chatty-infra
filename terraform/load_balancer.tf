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

