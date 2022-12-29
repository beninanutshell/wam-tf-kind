resource "helm_release" "crossplane" {
  chart            = "crossplane"
  name             = "crossplane"
  repository       = "https://charts.crossplane.io/stable"
  namespace        = "crossplane-system"
  create_namespace = "true"

  depends_on = [
    helm_release.traefik,
  ]

}

resource "null_resource" "crossplane_helm_provider" {
  provisioner "local-exec" {
    command = <<-EOT
      kubectl crossplane install provider crossplane/provider-helm:v0.10.0
      sleep 15
    EOT
  }
  depends_on = [
    helm_release.crossplane
  ]
}

data "template_file" "helm_provider_config" {
  template = file("../modules/crossplane/helm-provider-config.yaml")
}

locals {
  resources_helm_provider_config = split("\n---\n", data.template_file.helm_provider_config.rendered)
}

resource "k8s_manifest" "helm_provider_config" {
  count = length(local.resources_helm_provider_config)

  content   = local.resources_helm_provider_config[count.index]
  namespace = helm_release.crossplane.namespace

  depends_on = [
    helm_release.crossplane, null_resource.crossplane_helm_provider
  ]
}
