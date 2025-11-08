variable "project_id" {
  description = "project id"
  default     = "ornate-producer-477604-s3"
}

variable "region" {
  description = "region"
  default     = "us-central1"
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}
