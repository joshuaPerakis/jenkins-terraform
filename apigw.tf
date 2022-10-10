provider "aws" {
  region = "us-east-1"
}

resource "aws_elasticache_cluster" "cluster-redis" {
  cluster_id           = "cluster-redis"
  engine               = "redis"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 1
  engine_version       = "3.2.10"
}

resource "aws_elasticache_cluster" "cluster-memcache" {
  cluster_id           = "cluster-memcache"
  engine               = "memcached"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 1
}
