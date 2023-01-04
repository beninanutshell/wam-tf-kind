resource "helm_release" "prometheus" {
  chart            = "kube-prometheus-stack"
  name             = "prom-stack"
  namespace        = kubernetes_namespace.monitoring.metadata[0].name
  repository       = "https://prometheus-community.github.io/helm-charts"
  create_namespace = "false"
  version          = "43.2.1"

  values = [
    file("../modules/monitoring/values.yaml")
  ]

  depends_on = [
    helm_release.cilium,
  ]
}

data "template_file" "grafana_ingress" {
  template = file("../modules/monitoring/grafana-ingress.yaml")
}

locals {
  resources_grafana_ingress = split("\n---\n", data.template_file.grafana_ingress.rendered)
}

resource "k8s_manifest" "grafana_ingress" {
  count = length(local.resources_grafana_ingress)

  content   = local.resources_grafana_ingress[count.index]
  namespace = kubernetes_namespace.monitoring.metadata[0].name

  depends_on = [
    helm_release.traefik,
  ]
}

data "template_file" "admin_monitoring" {
  template = file("../modules/monitoring/monitoring-admin.yaml")
}

locals {
  resources_admin_monitoring = split("\n---\n", data.template_file.admin_monitoring.rendered)
}

resource "k8s_manifest" "admin_monitoring" {
  count = length(local.resources_admin_monitoring)

  content   = local.resources_admin_monitoring[count.index]
  namespace = kubernetes_namespace.monitoring.metadata[0].name

}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    annotations = {
      name = "monitoring"
    }
    labels = {
      run = "monitoring",

    }
    name = "monitoring"
  }

  depends_on = [
    helm_release.cilium
  ]
}
