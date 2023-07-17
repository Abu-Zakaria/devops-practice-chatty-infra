variable "image" {
	default = "linode/centos7"
}

variable "region" {
	default = "ap-west"
}

variable "type" {
	default = "g6-nanode-1"
}

variable "k8s_nodes" {
	type = list(string)
	default = [
		"k8s_node01",
		"k8s_node02"
	]
}

