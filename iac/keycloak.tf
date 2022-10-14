resource "helm_release" "keycloak" {
  chart            = "keycloak"
  name             = "keycloak"
  repository       = "https://codecentric.github.io/helm-charts"
  namespace        = "keycloak"
  create_namespace = "true"

  values = [
    file("../modules/keycloak/values.yaml")
  ]

  depends_on = [
    helm_release.cilium,
  ]

}

data "template_file" "ingress_keycloak" {
  template = file("../modules/keycloak/ingress.yaml")
}

locals {
  resources_ingress_keycloak = split("\n---\n", data.template_file.ingress_keycloak.rendered)

}

resource "k8s_manifest" "in_keycloak" {
  count = length(local.resources_ingress_keycloak)

  content   = local.resources_ingress_keycloak[count.index]
  namespace = helm_release.keycloak.namespace

  depends_on = [
    helm_release.traefik
  ]
}
