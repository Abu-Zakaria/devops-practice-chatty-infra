resource "linode_instance" "load_balancer" {
	label = "load-balancer"
	image = var.image
	region = var.region
	type = var.type
	authorized_keys = [var.PUBLIC_SSH_KEY]
	root_pass = var.ROOT_PASS
	tags = ["devops-practice-chatty"]
}

output "load_balancer_ip_address" {
	value = linode_instance.load_balancer.ip_address
}
