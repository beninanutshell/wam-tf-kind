#!/bin/bash

BOOTSTRAP_DIR="$(pwd)"

if ! command -v gum &> /dev/null; then
    echo "gum command could not be found, please install gum using the command 'brew install gum 'and run the script again"
    exit 1
else

    gum style --foreground 212 --border-foreground 99 --border double --align center --width 110 --margin "1 2" --padding "2 4" 'Hello,k8s lover!'
    gum spin -- sleep 5

    TRAEFIK_USER=`gum input --placeholder 'Enter your Traefik username'`
    TRAEFIK_PASSWORD=`gum input --password --placeholder 'Enter your Traefik password'`
    GANDI_API_KEY=`gum input --password --placeholder 'Enter your Gandi V5 API key'`
    DNS_CUSTOM=`gum input --placeholder 'Enter your custom local dns (example: wam.beninanutshell.com)'`
    #EMAIL_ACME=`gum input --placeholder 'Enter your email @ for Letsencrypt ACME'`

    export BINARIES BOOTSTRAP_DIR TRAEFIK_USER TRAEFIK_PASSWORD GANDI_API_KEY DNS_CUSTOM

    gum spin --spinner minidot --title "Step 1/5: Checking prerequisite ..." -- bash ./1-prerequisite_check.sh
    gum spin --spinner monkey --title "Step 2/5: Generating secrets ..." -- bash ./2-secret.sh
    gum spin --spinner moon --title "Step 3/5: Creating Kind cluster ..." -- bash ./3-kind.sh
    gum spin --spinner globe --title "Step 4/5: Terraforming k8s Stack ..." -- bash ./4-terraform.sh
    gum spin --spinner monkey --title "Step 5/5: Extras configurations for Keycloak and Traefik ..." -- bash ./5-extras.sh
    gum style --foreground 212 --border-foreground 99 --border double --align center --width 110 --margin "1 2" --padding "2 4" 'CLUSTER IS READY ! ENJOY (kubectl)!' '' \
        'Traefik is available here : https://traefik.'$DNS_CUSTOM'' \
        'ArgoCD is available here : https://argocd.'$DNS_CUSTOM'' \
        'Grafana is available here : https://grafana.'$DNS_CUSTOM'' \
        'Keycloak is available here : https://keyloak.'$DNS_CUSTOM'' \
        'Kubecost is available here : https://kubecost.'$DNS_CUSTOM'' \
        'Mario webgame is available here : https://mario.'$DNS_CUSTOM'' \
        'Mario deployed by ArgoCD and GitOps method is available here : https://mario-argo.'$DNS_CUSTOM''
fi