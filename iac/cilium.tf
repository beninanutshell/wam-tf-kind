resource "helm_release" "cilium" {
  chart            = "cilium"
  name             = "cilium"
  repository       = "https://helm.cilium.io/"
  namespace        = "kube-system"
  create_namespace = "false"
  version          = "1.12.0"

  set {
    name  = "hubble.relay.enabled"
    value = "true"
  }

  set {
    name  = "hubble.ui.enabled"
    value = "true"
  }
}