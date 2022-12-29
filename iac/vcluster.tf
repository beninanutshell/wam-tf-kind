data "template_file" "composition" {
  template = file("../modules/vcluster/composition.yaml")
}

data "template_file" "env_resource_def" {
  template = file("../modules/vcluster/environment-resource-definition.yaml")
}

data "template_file" "env_resource" {
  template = file("../modules/vcluster/environment-resource.yaml")
}

locals {
  resources_composition      = split("\n---\n", data.template_file.composition.rendered)
  resources_env_resource_def = split("\n---\n", data.template_file.env_resource_def.rendered)
  resources_env_resource     = split("\n---\n", data.template_file.env_resource.rendered)
}

resource "k8s_manifest" "composition" {
  count = length(local.resources_composition)

  content   = local.resources_composition[count.index]
  namespace = helm_release.crossplane.namespace

}

resource "k8s_manifest" "env_resource_def" {
  count = length(local.resources_env_resource_def)

  content   = local.resources_env_resource_def[count.index]
  namespace = helm_release.crossplane.namespace

}

resource "k8s_manifest" "env_resource" {
  count = length(local.resources_env_resource)

  content   = local.resources_env_resource[count.index]
  namespace = helm_release.crossplane.namespace

}