@PHONY: argo
argo:
	helm pull argo/argo-cd && \
	tar -xvf *.tgz && \
	rm *.tgz && \
	helm upgrade --install --create-namespace -n argocd argocd ./argo-cd


@PHONY: cluster
cluster:
	./install-k3d.sh

@PHONY: clean
clean:
	./remove-k3d.sh
