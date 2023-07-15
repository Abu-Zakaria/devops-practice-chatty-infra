variable "image" {
	default = "linode/centos7"
}

variable "region" {
	default = "ap-west"
}

variable "type" {
	default = "g6-nanode-1"
}

variable "app_servers" {
	type = list(string)
	default = [
		"app01",
		"app02",
		"app03"
	]
}

