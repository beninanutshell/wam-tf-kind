#!/bin/bash

BINARIES=( brew docker terraform kubeseal htpasswd kind kubectl helm )

prerequisite_check() {

    for x in "${BINARIES[@]}"; do
        if ! command -v $x &> /dev/null; then
            echo "$x command could not be found, please install $x and run the script again"
            return 1
        fi
            echo "$x command is here" && sleep 1
    done
    return 0
}
cd $BOOTSTRAP_DIR
prerequisite_check