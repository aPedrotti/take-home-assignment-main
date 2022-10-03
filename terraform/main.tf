terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
  experiments {
        manifest_resource = true
    }
} 



data "kubectl_file_documents" "namespace_file" {
    content = file("../kubernetes/namespace.yaml")
}
resource "kubectl_manifest" "namespace" {
    for_each  = data.kubectl_file_documents.namespace_file.manifests
    yaml_body = each.value
}

data "kubectl_file_documents" "deployment_file" {
    content = file("../kubernetes/app.yaml")
}
resource "kubectl_manifest" "deployment" {
    for_each  = data.kubectl_file_documents.deployment_file.manifests
    yaml_body = each.value
}