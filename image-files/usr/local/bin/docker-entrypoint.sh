#!/bin/bash

gcloud auth activate-service-account --key-file=/etc/gcp/gcp-key.json
gcloud config set project $GOOGLE_PROJECT_ID

tail -f /dev/null