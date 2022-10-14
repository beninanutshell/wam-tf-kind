#!/bin/bash

prepare_traefik_secret() {

    htpasswd -bc auth.txt wam ${TRAEFIK_PASSWORD}

}

create_traefik_secret() {

    kubectl create secret generic traefik-auth -n traefik-system --dry-run=client --from-file=auth.txt -o yaml > secret.yaml
    kubectl create secret generic gandiv5-api-key -n traefik-system  --dry-run=client --from-literal api-key=${GANDI_API_KEY} --output yaml > gandiv5-api-key.yaml

}

inputs_substitution() {

    find modules/ -type f -print0 | xargs -0 perl -pi -e "s/sub.domain.tld/${DNS_CUSTOM}/g" 2>&1 >/dev/null
    #find modules/ -type f -print0 | xargs -0 perl -pi -e "s/email@address.com/${EMAIL_ACME}/g" 2>&1 >/dev/null
}

cd $BOOTSTRAP_DIR
cd ../
prepare_traefik_secret
sleep 2
create_traefik_secret
sleep 2
inputs_substitution
sleep 2
cd $BOOTSTRAP_DIR