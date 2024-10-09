@PHONY: argo
argo:
	helm pull argo/argo-cd && \
	tar -xvf *.tgz && \
	rm *.tgz && \
	helm upgrade --install \
		    --create-namespace \
			--set global.domain=argo.localhost \
			--set server.ingress.enabled=true \
			--set-json='configs.params={"server.insecure": true}' \
		    -n argocd argocd ./argo-cd

@PHONY: argo-pw
argo-pw:
	kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d | pbcopy

@PHONY: cluster
cluster:
	./install-k3d.sh

@PHONY: clean
clean:
	./remove-k3d.sh
