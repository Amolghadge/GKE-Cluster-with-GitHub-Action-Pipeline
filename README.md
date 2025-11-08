# GKE Cluster Terraform Configuration

This repository contains Terraform configuration to create a Google Kubernetes Engine (GKE) cluster with the following specifications:
- 2 nodes
- e2-medium machine type
- Region: us-central1
- Project ID: ornate-producer-477604-s3
- Project Name: My First Project

## Prerequisites

1. Google Cloud Platform account with billing enabled
2. Project with required APIs enabled:
   - Compute Engine API
   - Kubernetes Engine API
3. Service Account with the following roles:
   - Kubernetes Engine Admin
   - Compute Network Admin
   - Storage Admin (for Terraform state bucket)
4. GitHub repository with the following secrets configured:
   - GCP_PROJECT_ID
   - GCP_SA_KEY (service account key JSON)

## Infrastructure Components

- VPC Network
- Subnet
- GKE Cluster
- Node Pool with 2 e2-medium instances

## GitHub Actions Workflow

The workflow will:
1. Authenticate to Google Cloud
2. Set up Terraform
3. Format and validate Terraform code
4. Plan Terraform changes
5. Apply changes (only on main branch)

## Getting Started

1. Clone this repository
2. Configure GitHub repository secrets:
   - GCP_PROJECT_ID: ornate-producer-477604-s3
   - GCP_SA_KEY: (your service account key JSON)
3. Push to main branch to trigger the workflow

## Important Notes

- The Terraform state is stored in Google Cloud Storage
- The cluster is created in us-central1 region
- Node pool uses e2-medium machine type
- Initial node count is set to 2 nodes
