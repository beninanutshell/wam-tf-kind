resource "helm_release" "kyverno" {
  chart            = "kyverno"
  name             = "kyverno"
  repository       = "https://kyverno.github.io/kyverno/"
  namespace        = "kyverno"
  create_namespace = "true"

  depends_on = [
    helm_release.cilium,
  ]
}

resource "helm_release" "kyverno_policies" {
  chart            = "kyverno-policies"
  name             = "kyverno-policies"
  repository       = "https://kyverno.github.io/kyverno/"
  namespace        = helm_release.kyverno.namespace
  create_namespace = "false"

  depends_on = [
    helm_release.kyverno
  ]
}