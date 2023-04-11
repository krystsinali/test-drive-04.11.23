module "gke" {
  source = "../modules/gke/"
  gke_config = {
    region         = "us-central1"
    zone           = "us-central1-c"
    cluster_name   = "test-cluster"
    machine_type   = "e2-medium"
    node_count     = 1
    node_pool_name = "my-node-pool"
    preemptible    = true
    node_version   = "1.23.5-gke.1500" 
  }
} 