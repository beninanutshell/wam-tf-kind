resource "helm_release" "kubecost" {
  chart            = "cost-analyzer"
  name             = "kubecost"
  repository       = "https://kubecost.github.io/cost-analyzer/"
  namespace        = "kubecost"
  create_namespace = "true"

  values = [
    file("../modules/kubecost/values.yaml")
  ]
  depends_on = [
    helm_release.cilium
  ]
}

data "template_file" "ingress_kubecost" {
  template = file("../modules/kubecost/ingress.yaml")
}

locals {
  resources_ingress_kubecsot = split("\n---\n", data.template_file.ingress_kubecost.rendered)
}

resource "k8s_manifest" "ingress_kubecost" {
  count = length(local.resources_ingress_kubecsot)

  content   = local.resources_ingress_kubecsot[count.index]
  namespace = helm_release.kubecost.namespace

  depends_on = [
    helm_release.traefik,
  ]
}