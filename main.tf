resource "etcd_key" "minio_release" {
  key = "${var.key_prefix}release"
  value = yamlencode(var.minio_release)
}

resource "etcd_key" "server_pools" {
  key = "${var.key_prefix}pools"
  value = yamlencode(var.server_pools)
}