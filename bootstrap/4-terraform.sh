#!/bin/bash

tf_init() {

    terraform init  2>&1 >/dev/null || exit 11
}

tf_plan() {

    terraform plan 2>&1 >/dev/null || exit 11
}

tf_apply() {

    terraform apply -auto-approve 2>&1 >/dev/null || exit 11
}

cd ${BOOTSTRAP_DIR}
cd ../iac/
tf_init
tf_plan
tf_apply
cd ${BOOTSTRAP_DIR}