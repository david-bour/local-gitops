@PHONY: argo
argo:
	helm pull argo/argo-cd && \
	tar -xvf *.tgz && \
	rm *.tgz && \
	helm upgrade --install \
		    --create-namespace \
			--set global.domain=argo.localhost \
			--set server.ingress.enabled=true \
			--set server.metrics.enabled=true \
			--set server.metrics.serviceMonitor.enabled=true \
			--set controller.metrics.enabled=true \
			--set controller.metrics.serviceMonitor.enabled=true \
			--set repoServer.metrics.enabled=true \
			--set repoServer.metrics.serviceMonitor.enabled=true \
			--set applicationSet.metrics.enabled=true \
			--set applicationSet.metrics.serviceMonitor.enabled=true \
			--set redis.metrics.enabled=true \
			--set redis.metrics.serviceMonitor.enabled=true \
			--set dex.metrics.enabled=true \
			--set dex.metrics.serviceMonitor.enabled=true \
			--set-json='configs.params={"server.insecure": true}' \
			--set-json='configs.repositories={"code-challenge-service-config": {"url": "https://github.com/david-bour/code-challenge-service-config.git", "name": "code-challenge-service-config", "type": "git"}, "local-gitops": {"url": "https://github.com/david-bour/local-gitops.git", "name": "local-gitops", "type": "git"}}' \
		    -n argocd argocd ./argo-cd

@PHONY: argo-pw
argo-pw:
	kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d | pbcopy

@PHONY: cluster
cluster:
	./install-k3d.sh

@PHONY: debug
debug:
	helm pull prometheus-community/kube-prometheus-stack && tar -xf kube-prometheus-stack*.tgz && \
	helm pull argo/argo-cd && tar -xf argo-cd*.tgz && \
	rm *.tgz

@PHONY: clean
clean:
	./remove-k3d.sh
