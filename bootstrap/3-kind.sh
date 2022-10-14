#!/bin/bash

kind_cluster() {

    kind create cluster --config=config.yaml --name wam

}
cd $BOOTSTRAP_DIR
cd ../
kind_cluster
cd $BOOTSTRAP_DIR