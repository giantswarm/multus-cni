#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

repo_dir=$(git rev-parse --show-toplevel) ; readonly repo_dir
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ; readonly script_dir
VENDIR_DIR="${repo_dir}/vendor/multus-cni/deployments" ; readonly VENDIR_DIR
CHART_DIR="${repo_dir}/helm/multus-cni" ; readonly CHART_DIR

echo "Building templates from upstream manifests"

cd "${script_dir}"

rm -rf "${script_dir}"/tmp/
mkdir -p "${script_dir}"/tmp/{input,output}

cp "${VENDIR_DIR}"/multus-daemonset-thick.yml "${script_dir}"/tmp/input/

kustomize build "${script_dir}" -o "${script_dir}"/tmp/output

# replace the namespace in all relevant files with the gotemplate to allow dynamic namespace templating.
for file in "${script_dir}"/tmp/output/*.yaml; do
    VALUE="{{ .Release.Namespace }}" yq eval --inplace \
        '(.metadata.namespace | select(. != null)) = strenv(VALUE) | (.metadata.namespace | select(. != null)) style = "single"' "${file}"
done

# replace the service account namespace in the clusterrolebinding
VALUE="{{ .Release.Namespace }}" yq eval --inplace \
    '(.subjects[0].namespace | select(. != null)) = strenv(VALUE) | (.subjects[0].namespace | select(. != null)) style = "single"' tmp/output/rbac.authorization.k8s.io_v1_clusterrolebinding_multus.yaml

# replace the daemonset name
VALUE="{{ .Release.Name }}" yq eval --inplace '.metadata.name = strenv(VALUE)' tmp/output/apps_v1_daemonset_kube-multus-ds.yaml

set -x
cp "${script_dir}"/tmp/output/*.yaml "${CHART_DIR}"/templates/
{ set +x; } 2>/dev/null

rm -rf "${script_dir}"/tmp/
