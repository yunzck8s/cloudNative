# Release notes for version 0.0.9

**Release date:** 2024-09-02

![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Allow `appKey` argument to be a list to support deeply nested objects
- Added `vm.namespace`, which returns `namespaceOverride` or `global.namespaceOverride` or `Release.Namespace` as a default
- Added `vm.managed.fullname`, which returns default fullname prefixed by `appKey`
- Added `vm.plain.fullname`, which returns default fullname suffixed by `appKey`

