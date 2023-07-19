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

variable "k8s_version" {
	default = "1.26"
}

variable "k8s_cluster_label" {
	default = "chatty_k8s_cluster"
}

variable "tags" {
	type = list(string)
	default = [
		"devops-practice-chatty"
	]
}

variable "pools" {
	type = list(object({
			type = string
			count = number
		})
	)
	default = [
		{
			type = "g6-standard-1",
			count = 3
		}
	]
}

