data "template_file" "ingress_traefik_dashboard" {
  template = file("../modules/traefik/ingress-dashboard.yaml")
}

data "template_file" "secret_traefik_auth" {
  template = file("../modules/traefik/sealed-secret.yaml")
}

data "template_file" "monitoring" {
  template = file("../modules/traefik/monitoring.yaml")
}

data "template_file" "gandi" {
  template = file("../modules/traefik/gandi-sealed-secret.yaml")
}

resource "k8s_manifest" "gandi" {
  content   = data.template_file.gandi.rendered
  namespace = kubernetes_namespace.traefik-system.metadata[0].name

  depends_on = [
    helm_release.sealed_secrets,
  ]
}

locals {
  resources_ingress_traefik = split("\n---\n", data.template_file.ingress_traefik_dashboard.rendered)
}

resource "k8s_manifest" "ingress_traefik_dashboard" {
  count = length(local.resources_ingress_traefik)

  content   = local.resources_ingress_traefik[count.index]
  namespace = kubernetes_namespace.traefik-system.metadata[0].name

  depends_on = [
    helm_release.traefik,
  ]
}

resource "k8s_manifest" "secret_traefik_auth" {
  content   = data.template_file.secret_traefik_auth.rendered
  namespace = kubernetes_namespace.traefik-system.metadata[0].name

  depends_on = [
    helm_release.sealed_secrets,
  ]
}

resource "k8s_manifest" "monitoring" {
  content   = data.template_file.monitoring.rendered
  namespace = kubernetes_namespace.traefik-system.metadata[0].name

  depends_on = [
    helm_release.prometheus,
  ]
}

resource "helm_release" "traefik" {
  chart            = "traefik"
  name             = "traefik"
  repository       = "https://helm.traefik.io/traefik"
  namespace        = kubernetes_namespace.traefik-system.metadata[0].name
  create_namespace = "false"

  values = [
    file("../modules/traefik/values.yaml")
  ]

  set {
    name  = "metrics.prometheus.enabled"
    value = "true"
  }

  depends_on = [
    helm_release.metallb, helm_release.sealed_secrets
  ]
}

resource "kubernetes_namespace" "traefik-system" {
  metadata {
    annotations = {
      name = "traefik-system"
    }
    labels = {
      run = "traefik-system",

    }
    name = "traefik-system"
  }
  depends_on = [
    helm_release.cilium
  ]
}