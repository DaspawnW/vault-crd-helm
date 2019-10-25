release:
	mkdir -p dist
	helm package vault-crd -d dist
	helm repo index .
