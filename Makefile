build:
	zarf package create pull-pkg/ --confirm
	uds bundle create --confirm

cluster/bundle: build
	k3d cluster delete -c k3d.yaml
	k3d cluster create -c k3d.yaml
	uds bundle deploy uds-bundle-uds-core-amd64-0.0.1.tar.zst --confirm
