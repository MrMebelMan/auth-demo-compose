#!/bin/bash
set -e

bold=$(tput bold)
normal=$(tput sgr0)

try_build() {
    project=$1
    if [ -d "${gopath}/src/github.com/${project}" ]; then
        echo "${bold}Building image ${project}...${normal}"
        docker build -t ${project} ${gopath}/src/github.com/${project}
        echo
    fi
}

for gopath in $(echo "${GOPATH/:/$'\n'}"); do
    echo "${bold}Searching GOPATH ${gopath}...${normal}"
    echo
    try_build "jakm/auth-demo-app"
    try_build "jakm/auth-demo-login"
    try_build "jakm/auth-demo-resource"
done
