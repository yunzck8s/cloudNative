# Release notes for version 0.25.16

**Release date:** 2024-09-10

![AppVersion: v1.102.1](https://img.shields.io/static/v1?label=AppVersion&message=v1.102.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Do not truncate servicemonitor, datasources, rules, dashboard, alertmanager & vmalert templates names
- Use service label for node-exporter instead of podLabel. See [this issue](https://github.com/VictoriaMetrics/helm-charts/issues/1458)
- Added common chart to a k8s-stack. See [this issue](https://github.com/VictoriaMetrics/helm-charts/issues/1456)
- Fixed value of custom alertmanager configSecret. See [this issue](https://github.com/VictoriaMetrics/helm-charts/issues/1461)

