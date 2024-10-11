#!/bin/bash


while true; do
    yq -i ".dateTime = \"$(date)\"" ./argocd-applications/environments/dev/values.yaml
    git add .
    git commit -m "Changed date"
    git push
    sleep 2
done
