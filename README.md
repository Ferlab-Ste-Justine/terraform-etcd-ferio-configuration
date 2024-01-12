# About

This Terraform module generates an etcd configuration that specifies minio parameters to ferio (https://github.com/Ferlab-Ste-Justine/ferio).

See the following for details about how it impacts the etcd keyspace: https://github.com/Ferlab-Ste-Justine/ferio#etcd-keyspace

# Usage

## Input

- **key_prefix**: Etcd prefix to store the configuration under. This same value should be specified in ferio's configuration file.
- **minio_release**: Configuration that specifies the minio release ferio should set for the cluster. It takes the following parameters...
  - **url**: Url where the minio binary can be downloaded
  - **checksum**: Expected sha256 checksum of the downloaded minio binary
  - **version**: Version tag of the minio binary. Should be a strictly increasing string format, like the `yyyy-mm-dd` format for example.
- **server_pools**: Configuration that specifies the minio server pools of the cluster. Note that ferio currently only supports adding new pools and minio doesn't support modifying an existing pool. It takes the following parameters:
  - **version**: Version tag of the server pool configuration. Should be a strictly increasing string format, like the `yyyy-mm-dd` format for example.
  - **pools**: Array of server pools. Each array element takes the following parameters...
    - **api_port**: Api port the minio servers in the pool will expose
    - **domain_template**: Domain template. See the ferio keyspace documentation for details.
    - **server_count_begin**: Domain number of the first server in the pool. See the ferio keyspace documentation for details.
    - **server_count_end**: Domain number of the last server in the pool. See the ferio keyspace documentation for details.
    - **mount_path_template**: Volume mounts template. See the ferio keyspace documentation for details.
    - **mount_count**: Number of volumes to mount per server. See the ferio keyspace documentation for details.