## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.6.0 |
| <a name="requirement_k8s"></a> [k8s](#requirement\_k8s) | 0.9.1 |
| <a name="requirement_keycloak"></a> [keycloak](#requirement\_keycloak) | 3.9.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.12.1 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.6.0 |
| <a name="provider_k8s"></a> [k8s](#provider\_k8s) | 0.9.1 |
| <a name="provider_keycloak"></a> [keycloak](#provider\_keycloak) | 3.9.1 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.12.1 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.1.1 |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.cilium](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.crossplane](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.keycloak](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.kubecost](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.kyverno](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.kyverno_policies](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.loki](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.metallb](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.metrics_server](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.prometheus](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.sealed_secrets](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.traefik](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [k8s_manifest.admin_monitoring](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.app_2048](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.argo_demo](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.argo_metrics](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.composition](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.env_resource](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.env_resource_def](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.gandi](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.grafana_ingress](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.helm_provider_config](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.in_keycloak](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.ingress_argocd](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.ingress_kubecost](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.ingress_traefik_dashboard](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.install_argocd](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.mario](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.monitoring](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.secret_traefik_auth](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.standalone_install](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [keycloak_group.groups](https://registry.terraform.io/providers/mrparkers/keycloak/3.9.1/docs/resources/group) | resource |
| [keycloak_openid_client.argocd](https://registry.terraform.io/providers/mrparkers/keycloak/3.9.1/docs/resources/openid_client) | resource |
| [keycloak_openid_client.grafana](https://registry.terraform.io/providers/mrparkers/keycloak/3.9.1/docs/resources/openid_client) | resource |
| [keycloak_openid_client_default_scopes.client_default_scopes_argo](https://registry.terraform.io/providers/mrparkers/keycloak/3.9.1/docs/resources/openid_client_default_scopes) | resource |
| [keycloak_openid_client_default_scopes.grafana](https://registry.terraform.io/providers/mrparkers/keycloak/3.9.1/docs/resources/openid_client_default_scopes) | resource |
| [keycloak_openid_client_scope.groups](https://registry.terraform.io/providers/mrparkers/keycloak/3.9.1/docs/resources/openid_client_scope) | resource |
| [keycloak_openid_group_membership_protocol_mapper.groups](https://registry.terraform.io/providers/mrparkers/keycloak/3.9.1/docs/resources/openid_group_membership_protocol_mapper) | resource |
| [keycloak_user.users](https://registry.terraform.io/providers/mrparkers/keycloak/3.9.1/docs/resources/user) | resource |
| [keycloak_user_groups.user_groups](https://registry.terraform.io/providers/mrparkers/keycloak/3.9.1/docs/resources/user_groups) | resource |
| [kubernetes_namespace.app_demo](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.argocd](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [null_resource.crossplane_helm_provider](https://registry.terraform.io/providers/hashicorp/null/3.1.1/docs/resources/resource) | resource |
| [template_file.admin_monitoring](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.app_2048](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.argo_demo](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.argo_metrics](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.composition](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.env_resource](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.env_resource_def](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.gandi](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.grafana_ingress](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.helm_provider_config](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.ingress_argocd](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.ingress_keycloak](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.ingress_kubecost](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.ingress_traefik_dashboard](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.install_argocd](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.mario](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.monitoring](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.secret_traefik_auth](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.standalone_install](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kube_config"></a> [kube\_config](#input\_kube\_config) | n/a | `string` | `"~/.kube/config"` | no |

## Outputs

| Name | Description |
|------|-------------|
