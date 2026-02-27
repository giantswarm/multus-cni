#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

repo_dir=$(git rev-parse --show-toplevel) ; readonly repo_dir
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ; readonly script_dir
CHART_DIR="${repo_dir}/helm/multus-cni" ; readonly CHART_DIR

echo "Updating values files"

cd "${script_dir}"

# we need to set the tag field in values.yaml to match the version being
# synced from upstream.

# get the upstream sync version from vendir.yml
UPSTREAM_SYNC_VERSION=$(yq -r .directories[0].contents[0].git.ref ${repo_dir}/vendir.yml)

# copy over values file and schema
set -x
cp manifests/values.yaml "${CHART_DIR}"/values.yaml
cp manifests/values.schema.json "${CHART_DIR}"/values.schema.json
{ set +x; } 2>/dev/null

# set the image tag  in values.yaml
sed -i -E "s/IMAGE_TAG_REPLACE/${UPSTREAM_SYNC_VERSION}-thick/" "${CHART_DIR}/values.yaml"
