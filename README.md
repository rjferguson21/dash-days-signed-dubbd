### What is this
* Example leveraging [this branch](https://github.com/defenseunicorns/zarf/tree/signatures) of zarf to build a [DUBBD package](https://github.com/users/rjferguson21/packages/container/package/dubbd-signed%2Fdubbd-k3d) that includes changes to add both signatures and attestations to the package at build time.

### Requiements
* Zarf CLI
* UDS CLI

### Deploy this locally with k3d cluster
```bash
# Creates a cluster with k3d.yaml and deploys bundle
make cluster/bundle
```

### Todos:
* For images that do not include (link to annotation), digests change when images go through Zarf causing signatures tags to change. Potentially re-tag signatures based on digest of images pushed into zarf registry based on mutated annotations?...
* Proxy/Rewrite kyverno pod to access zarf registry on `127.0.0.1` in a better way
* Correct imagePullSecret/registry credentials were not used by Kyverno when proxying
