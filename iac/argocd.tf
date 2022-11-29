data "template_file" "install_argocd" {
  template = file("../modules/argocd/install.yaml")
}

data "template_file" "ingress_argocd" {
  template = file("../modules/argocd/ingress.yaml")
}

data "template_file" "argo_demo" {
  template = file("../modules/argocd/argo-demo.yaml")
}

data "template_file" "argo_metrics" {
  template = file("../modules/argocd/metrics.yaml")
}

locals {
  resources_argocd         = split("\n---\n", data.template_file.ingress_argocd.rendered)
  resources_install_argocd = split("\n---\n", data.template_file.install_argocd.rendered)
  resources_argo_demo      = split("\n---\n", data.template_file.argo_demo.rendered)
  resources_argo_metrics   = split("\n---\n", data.template_file.argo_metrics.rendered)
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    annotations = {
      name = "argocd"
    }
    labels = {
      app = "argocd"
    }
    name = "argocd"
  }

  depends_on = [
    helm_release.cilium
  ]
}

resource "k8s_manifest" "ingress_argocd" {
  count = length(local.resources_argocd)

  content   = local.resources_argocd[count.index]
  namespace = kubernetes_namespace.argocd.id

  depends_on = [
    k8s_manifest.install_argocd, helm_release.traefik,
  ]
}

resource "k8s_manifest" "install_argocd" {
  count = length(local.resources_install_argocd)

  content   = local.resources_install_argocd[count.index]
  namespace = kubernetes_namespace.argocd.id

  depends_on = [
    kubernetes_namespace.argocd, helm_release.cilium
  ]
}

resource "k8s_manifest" "argo_demo" {
  count = length(local.resources_argo_demo)

  content   = local.resources_argo_demo[count.index]
  namespace = kubernetes_namespace.argocd.id

  depends_on = [
    helm_release.traefik, k8s_manifest.install_argocd
  ]
}

resource "k8s_manifest" "argo_metrics" {
  count = length(local.resources_argo_metrics)

  content   = local.resources_argo_metrics[count.index]
  namespace = helm_release.prometheus.namespace

}

