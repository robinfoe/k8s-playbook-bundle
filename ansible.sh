#! /usr/bin/env bash

set -o pipefail
set -o errexit
set -o nounset

# readonly KIND=${KIND:-kind}
# readonly KUBECTL=${KUBECTL:-kubectl}

# readonly CTRBUILD=${CTRBUILD:-docker}

# readonly CLUSTERNAME=${CLUSTERNAME:-learnk8s}
# readonly WAITTIME=${WAITTIME:-5m}

# readonly HERE=$(cd "$(dirname "$0")" && pwd)
# readonly REPO=$(cd "${HERE}/.." && pwd)

# readonly KIND_IMAGE="kindest/node:v1.25.3-learnk8s"


# command::activate(){
#     source .venv/bin/activate
# }

command::run(){
    ansible-navigator run ./playbook/publish_content.yaml --pae false -i ./playbook/inventory --rad ./rad --execution-environment-image content-mgmt-ee --mode stdout --pull-policy missing --container-options='--user=0' --ee=true
}

command::build(){
    ansible-builder build --tag content-mgmt-ee
}

command::$1