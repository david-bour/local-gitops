#!/bin/bash

yq -i ".dateTime = \"$(date)\"" ./argocd-applications/environments/dev/values.yaml
git add .
git commit -m "Changed date"