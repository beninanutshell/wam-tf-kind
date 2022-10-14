resource "helm_release" "metrics_server" {
  chart      = "metrics-server"
  name       = "metrics-server"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  namespace  = kubernetes_namespace.monitoring.metadata[0].name

  values = [
    file("../modules/metrics-server/values.yaml")
  ]

}

#data "template_file" "standalone_install" {
#template = file("../modules/metrics-server/standalone-install.yaml")
#}
#
#locals {
#resources_standalone_install = split("\n---\n", data.template_file.standalone_install.rendered)
#}
#
#resource "k8s_manifest" "standalone_install" {
#content   = data.template_file.standalone_install.rendered
#namespace = helm_release.prometheus.namespace
#}