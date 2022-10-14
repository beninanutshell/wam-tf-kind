resource "helm_release" "sealed_secrets" {

  chart      = "sealed-secrets"
  name       = "sealed-secrets-controller"
  namespace  = "kube-system"
  repository = "https://bitnami-labs.github.io/sealed-secrets"

  depends_on = [
    helm_release.cilium
  ]
}