#!/usr/bin/env bash

set -eu

if [ $# -lt 1 ] ; then
    echo "Usage: $0 artifact-repo [args...]"
    exit 1
fi

artifact_repo=$1

docker run \
       -v ~/.config/gcloud/application_default_credentials.json:/app/credentials.json \
       -e GOOGLE_APPLICATION_CREDENTIALS=/app/credentials.json \
       -e GCLOUD_PROJECT=$(gcloud config get project) \
       europe-docker.pkg.dev/climbalyzer-420313/$artifact_repo/google-cloud-storage-ssl-error ${@:2}
