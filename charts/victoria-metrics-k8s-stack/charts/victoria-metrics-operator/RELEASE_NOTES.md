# Release notes for version 0.34.8

**Release date:** 2024-09-10

![AppVersion: v0.47.3](https://img.shields.io/static/v1?label=AppVersion&message=v0.47.3&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Added ability to override deployment namespace using `namespaceOverride` and `global.namespaceOverride` variables
- Fixed template for cert-manager certificates
- Fixed operator Role creation when only watching own namespace using `watchNamespaces`
- Changed webhook service port from 443 to 9443

