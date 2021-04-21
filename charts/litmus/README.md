# litmus

![Version: 1.13.7](https://img.shields.io/badge/Version-1.13.7-informational?style=flat-square) ![AppVersion: 1.13.3](https://img.shields.io/badge/AppVersion-1.13.3-informational?style=flat-square)

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
| operatorMode | string | `standard` | Operational mode of the chaos operator. Supports: `standard`, `namespaced`, `admin` |
| affinity | object | `{}` | Affinity for operator |
| customLabels | object | `{}` |  |
| exporter.affinity | object | `{}` | Affinity for exporter |
| exporter.enabled | bool | `false` | If metrics exporter enabled  |
| exporter.image.pullPolicy | string | `"Always"` | Image pill policy for exporter |
| exporter.image.repository | string | `"litmuschaos/chaos-exporter"` | Image repository for exporter |
| exporter.image.tag | string | `"1.13.0"` | Image tag for exporter |
| exporter.nodeSelector | object | `{}` | Node selector for exporter |
| exporter.resources | object | `{}` | Resources requests and limits for exporter |
| exporter.service.annotations | object | `{}` | Annotations for exporter service |
| exporter.service.port | int | `8080` | Port for exporter service |
| exporter.service.type | string | `"ClusterIP"` | Type of exporter's service |
| exporter.serviceMonitor.additionalLabels | object | `{}` | Additional labels for exporter's serviceMonitor |
| exporter.serviceMonitor.enabled | bool | `false` | If serviceMonitor enabled |
| exporter.tolerations | list | `[]` | Tolerations for exporter |
| fullnameOverride | string | `"litmus"` | Full name override |
| operator.image.pullPolicy | string | `"Always"` | Image operator or runner pull policy |
| \<operator\|runner\>.image.repository | string | `"litmuschaos/chaos-operator"` | Image operator or runner repository |
| \<operator\|runner\>.image.tag | string | `"1.13.0"` | Image operator or runner tag |
| ingress.annotations | object | `{}` | Ingress annotations |
| ingress.enabled | bool | `false` | Ingress enabled |
| nameOverride | string | `"litmus"` | Name override |
| nodeSelector | object | `{}` | Node selector |
| operatorName | string | `"chaos-operator"` | Operator name |
| replicaCount | int | `1` | Replica count |
| resources | object | `{}` | Resources requests and limits |
| policies.monitoring.disabled | string | false | If google analytics disabled |
| service.port | int | `80` | Service port |
| service.type | string | `"ClusterIP"` | Service type |
| tolerations | list | `[]` | Tolerations |

[1]: https://github.com/litmuschaos/chaos-charts
