data "template_file" "mario" {
  template = file("../modules/app/mario.yaml")
}

locals {
  resources_mario = split("\n---\n", data.template_file.mario.rendered)
}

resource "k8s_manifest" "mario" {
  count = length(local.resources_mario)

  content   = local.resources_mario[count.index]
  namespace = kubernetes_namespace.mario.metadata[0].name

}

resource "kubernetes_namespace" "mario" {
  metadata {
    annotations = {
      name = "mario"
    }
    labels = {
      run = "mario",

    }
    name = "mario"
  }
  depends_on = [
    helm_release.traefik
  ]
}