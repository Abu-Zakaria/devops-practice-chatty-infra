resource "linode_lke_cluster" "chatty_k8s_cluster" {
	k8s_version = var.k8s_version
	label = var.k8s_cluster_label
	region = var.region
	tags = var.tags

	dynamic "pool" {
		for_each = var.pools
		content {
			type = pool.value["type"]
			count = pool.value["count"]
		}
	}
}

output "kubeconfig" {
	value = linode_lke_cluster.chatty_k8s_cluster.kubeconfig
	sensitive = true
}

output "api_endpoints" {
	value = linode_lke_cluster.chatty_k8s_cluster.api_endpoints
}

output "status" {
	value = linode_lke_cluster.chatty_k8s_cluster.status
}

output "k8s_cluster_id" {
	value = linode_lke_cluster.chatty_k8s_cluster.id
}

output "pool" {
	value = linode_lke_cluster.chatty_k8s_cluster.pool
}

