# litmus

![Version: 1.13.6](https://img.shields.io/badge/Version-1.13.6-informational?style=flat-square) ![AppVersion: 1.13.3](https://img.shields.io/badge/AppVersion-1.13.3-informational?style=flat-square)

A Helm chart to install litmus infra components on Kubernetes

**Homepage:** <https://litmuschaos.io>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| ksatchit | karthik.s@mayadata.io |  |
| chandankumar4 | chandan.kumar@zopsmart.com |  |

## Source Code

* <https://github.com/litmuschaos/litmus>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| exporter.affinity | object | `{}` |  |
| exporter.enabled | bool | `false` |  |
| exporter.image.pullPolicy | string | `"Always"` |  |
| exporter.image.repository | string | `"litmuschaos/chaos-exporter"` |  |
| exporter.image.tag | string | `"1.13.3"` |  |
| exporter.nodeSelector | object | `{}` |  |
| exporter.resources | object | `{}` |  |
| exporter.service.annotations | object | `{}` |  |
| exporter.service.port | int | `8080` |  |
| exporter.service.type | string | `"ClusterIP"` |  |
| exporter.serviceMonitor.additionalLabels | object | `{}` |  |
| exporter.serviceMonitor.enabled | bool | `false` |  |
| exporter.tolerations | list | `[]` |  |
| fullnameOverride | string | `"litmus"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `nil` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `"litmus"` |  |
| nodeSelector | object | `{}` |  |
| operator.image.pullPolicy | string | `"Always"` |  |
| operator.image.repository | string | `"litmuschaos/chaos-operator"` |  |
| operator.image.tag | string | `"1.13.3"` |  |
| operatorMode | string | `"standard"` |  |
| operatorName | string | `"chaos-operator"` |  |
| policies.monitoring.disabled | bool | `false` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| runner.image.repository | string | `"litmuschaos/chaos-runner"` |  |
| runner.image.tag | string | `"1.13.3"` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |

