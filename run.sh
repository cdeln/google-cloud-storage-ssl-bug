#!/usr/bin/env bash

docker run \
       -v ~/.config/gcloud/application_default_credentials.json:/app/credentials.json \
       -e GOOGLE_APPLICATION_CREDENTIALS=/app/credentials.json \
       -e GCLOUD_PROJECT=$(gcloud config get project) \
       google-cloud-storage-ssl-error:latest $@
