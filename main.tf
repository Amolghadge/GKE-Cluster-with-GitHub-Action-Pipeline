terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# =====================================
# Autopilot GKE Cluster
# =====================================

resource "google_container_cluster" "primary" {
  name     = "${var.project_id}-gke1"
  location = var.region

  enable_autopilot = true

  network    = data.google_compute_network.vpc.self_link
  subnetwork = data.google_compute_subnetwork.subnet.self_link
}


# Separately managed node pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]

    labels = {
      env = var.project_id
    } 

    machine_type = "e2-micro"
    tags         = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
