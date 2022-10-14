resource "helm_release" "metallb" {
  chart            = "metallb"
  name             = "metallb"
  repository       = "https://metallb.github.io/metallb"
  namespace        = "metallb"
  create_namespace = "true"
  version          = "0.12.1"

  values = [
    "${file("../modules/metallb/values.yaml")}"
  ]

  depends_on = [
    helm_release.cilium
  ]
}
