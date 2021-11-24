terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.66.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.6.1"
    }

    kustomization = {
      source  = "kbst/kustomization"
      version = "0.7.0"
    }
  }
}
