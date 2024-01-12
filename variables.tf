variable "key_prefix" {
  description = "Prefix of the keyspace to work on"
  type = string
}

variable "minio_release" {
  description = "Configuration to retrieve the current minio binary."
  type        = object({
    url      = string
    checksum = string
    version  = string
  })
}

variable "server_pools" {
  description = "Configuration to configure the server pools."
  type        = object({
    version = string
    pools   = list(object({
      api_port            = number
      domain_template     = string
      server_count_begin  = number
      server_count_end    = number
      mount_path_template = string
      mount_count         = number
    }))
  })
}