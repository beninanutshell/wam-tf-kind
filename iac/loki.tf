resource "helm_release" "loki" {
  chart      = "loki-stack"
  name       = "loki"
  repository = "https://grafana.github.io/helm-charts"
  namespace  = kubernetes_namespace.monitoring.metadata[0].name

}
