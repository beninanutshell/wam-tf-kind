#!/bin/bash

BOOTSTRAP_DIR="$(pwd)"

if ! command -v gum &> /dev/null; then
    echo "gum command could not be found, please install gum using the command 'brew install gum 'and run the script again"
    exit 1
else

    DNS_CUSTOM=`gum input --placeholder 'Enter your custom local dns actually used in your Kind cluster (example: wam.beninanutshell.com)'`
    #EMAIL_ACME=`gum input --placeholder 'Enter your ACME email addresse actually used in your Kind cluster (example: benjamin.coutellier@gmail.com)'`

    gum style --foreground 212 --border-foreground 99 --border double --align center --width 50 --margin "1 2" --padding "2 4" 'Cleaning local k8s cluster'
    gum spin -- sleep 1

    cd ${BOOTSTRAP_DIR}
    cd ..
    gum spin --spinner minidot --title "Step 1/5 : Deleting Kind cluster ..." -- bash -c "kind delete cluster --name wam"  -- sleep 3
    gum spin --spinner minidot --title "Step 2/5 : Cleaning secrets files ..." -- bash -c "rm -f auth.txt gandiv5-api-key.yaml secret.yaml" -- sleep 3 
    cd iac/
    gum spin --spinner minidot --title "Step 3/5 : Cleaning terraform files ..." -- bash -c "rm -rf .terra* terraform.tfstate*" -- sleep 3
    gum spin --spinner minidot --title "Step 4/5 : Cleaning keycloak files ..." -- bash -c "mv keycloak_init.tf keycloak_init.tf.ori" --sleep 3
    cd ../
    gum spin --spinner minidot --title "Step 5/5 : Reset DNS names ..." -- bash -c "find modules/ -type f -print0 | xargs -0 perl -pi -e "s/${DNS_CUSTOM}/sub.domain.tld/g" 2>&1 >/dev/null" -- sleep 3 
    #gum spin --spinner minidot --title "Step 6/6 : Reset ACME email ..." -- bash -c "find modules/ -type f -print0 | xargs -0 perl -pi -e "s/${EMAIL_ACME}/email@address.com/g" 2>&1 >/dev/null" -- sleep 3 
    gum style --foreground 212 --border-foreground 99 --border double --align center --width 50 --margin "1 2" --padding "2 4" 'No more local k8s :('
fi