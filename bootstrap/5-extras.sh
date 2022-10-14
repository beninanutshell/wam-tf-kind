#!/bin/bash

sealed_secret() {

    cd ${BOOTSTRAP_DIR}
    cd ../
    cat secret.yaml | kubeseal --controller-namespace kube-system --controller-name sealed-secrets-controller --format yaml > modules/traefik/sealed-secret.yaml
    cat gandiv5-api-key.yaml | kubeseal --controller-namespace kube-system --controller-name sealed-secrets-controller --format yaml > modules/traefik/gandi-sealed-secret.yaml
}

restart_traefik() {
  kubectl delete pod -l app.kubernetes.io/name=traefik -n traefik-system --force --grace-period 0
}

tf_apply() {
    cd ${BOOTSTRAP_DIR}
    cd ../iac/
    terraform apply -auto-approve 2>&1 >/dev/null || exit 11
}

crossplane_role_binding() {

    cd ${BOOTSTRAP_DIR}
    cd ../
    SA=$(kubectl -n crossplane-system get sa -o name | grep provider-helm | sed -e 's|serviceaccount\/|crossplane-system:|g')
    kubectl create clusterrolebinding provider-helm-admin-binding --clusterrole cluster-admin --serviceaccount="${SA}"
}

keycloak_init() {

    cd ${BOOTSTRAP_DIR}
    cd ../iac/
    mv keycloak_init.tf.ori keycloak_init.tf
}

sealed_secret
tf_apply
crossplane_role_binding
keycloak_init
tf_apply
restart_traefik
sleep 30