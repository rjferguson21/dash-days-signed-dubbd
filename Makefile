build:
	zarf package create pull-pkg/ --confirm

cluster/create:
	k3d cluster delete -c k3d.yaml
	k3d cluster create -c k3d.yaml
	zarf init --components=git-server --confirm  --registry-pull-password=CtX7fG9vSKhGrA7eSZLS1UJh
	zarf package deploy oci://ghcr.io/defenseunicorns/packages/metallb:0.0.1-amd64 --set=IP_ADDRESS_POOL=172.28.0.8/29 --confirm
	zarf package deploy zarf-package-dubbd-k3d-amd64-0.9.1.tar.zst --confirm

cluster/bundle:
	k3d cluster delete -c k3d.yaml
	k3d cluster create -c k3d.yaml
	uds bundle deploy uds-bundle-uds-core-amd64-0.0.1.tar.zst
