terraform {
  required_providers {
    k8s = {
      version = "0.9.1"
      source  = "banzaicloud/k8s"
    }
    helm = {
      version = ">= 2.6.0"
      source  = "hashicorp/helm"
    }
    kubernetes = {
      version = ">= 2.12.1"
      source  = "hashicorp/kubernetes"
    }
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "3.9.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = pathexpand(var.kube_config)
  }
}

provider "kubernetes" {
  config_path = pathexpand(var.kube_config)
}

provider "kubernetes-alpha" {
  config_path = pathexpand(var.kube_config)
}
