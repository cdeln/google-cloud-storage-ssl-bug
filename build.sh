#!/usr/bin/env bash

set -eu

region=europe

if [ $# -ne 2 ] ; then
    echo "Usage: $0 artifact-repo <local|cloud>"
    exit 1
fi

artifact_repo=$1
build_mode=$2

project_id=$(gcloud config get project)
project_name=
docker_image_url=$region-docker.pkg.dev/$project_id/$artifact_repo/google-cloud-storage-ssl-error:latest

if [ $build_mode = local ]
then
    docker build --tag $docker_image_url .
elif [ $build_mode == cloud ]
then
    $0 $artifact_repo local
    docker push $docker_image_url
else
    echo "Invalid build mode $build_mode"
    exit 1
fi
