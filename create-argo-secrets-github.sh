#!/bin/bash

echo "USERNAME: ${GITHUB_USERNAME}"
echo "PASSWORD: ${GITHUB_TOKEN}"

# Annotation needed: argocd-image-updater.argoproj.io/write-back-method: git:secret:argocd-image-updater/git-creds
kubectl -n argocd create secret generic git-creds \
    --from-literal=username=${GITHUB_USERNAME} \
    --from-literal=password=${GITHUB_TOKEN}
