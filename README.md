# Notes
1. https://blog.ediri.io/kube-prometheus-stack-and-argocd-23-how-to-remove-a-workaround
Prometheus Error
2. Dashboard - https://raw.githubusercontent.com/argoproj/argo-cd/refs/heads/master/examples/dashboard.json, https://argo-cd.readthedocs.io/en/latest/operator-manual/metrics/
3. Bitnami Helm Repo: had to add manually registry-1.docker.io
   1. TODO: add declaratively
4. `make bootstrap` installs the applicationset manually. `make clean-argo` removes the bootstrap.
5. `./commit-hammer.sh` creates a commit to a common overrides

## Notes 12-01-2024
* Have image updater
* Using Kustomization
* Trying to make it choose only the gitsha version instead of latest
* Doesn't seem to be working
* Do I need to do a "git" writeback?