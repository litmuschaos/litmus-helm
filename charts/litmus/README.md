litmus
======
A Helm chart to install litmus infra components on Kubernetes

Current chart version is `1.3.1`

Source code can be found [here](https://litmuschaos.io)



## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity for operator |
| exporter.affinity | object | `{}` | Affinity for exporter |
| exporter.enabled | bool | `false` | If metrics exporter enabled  |
| exporter.image.pullPolicy | string | `"Always"` | Image pill policy for exporter |
| exporter.image.repository | string | `"litmuschaos/chaos-exporter"` | Image repository for exporter |
| exporter.image.tag | string | `"latest"` | Image tag for exporter |
| exporter.nodeSelector | object | `{}` | Node selector for exporter |
| exporter.resources | object | `{}` | Resources requests and limits for exporter |
| exporter.service.annotations | object | `{}` | Annotations for exporter service |
| exporter.service.port | int | `8080` | Port for exporter service |
| exporter.service.type | string | `"ClusterIP"` | Type of exporter's service |
| exporter.serviceMonitor.additionalLabels | object | `{}` | Additional labels for exporter's serviceMonitor |
| exporter.serviceMonitor.enabled | bool | `false` | If serviceMonitor enabled |
| exporter.tolerations | list | `[]` | Tolerations for exporter |
| fullnameOverride | string | `"litmus"` | Full name override |
| image.\<operator\|runner\>.pullPolicy | string | `"Always"` | Image operator or runner pull policy |
| image.\<operator\|runner\>.repository | string | `"litmuschaos/chaos-operator"` | Image operator or runner repository |
| image.\<operator\|runner\>.tag | string | `"1.3.0"` | Image operator or runner tag |
| ingress.annotations | object | `{}` | Ingress annotations |
| ingress.enabled | bool | `false` | Ingress enabled |
| nameOverride | string | `"litmus"` | Name override |
| nodeSelector | object | `{}` | Node selector |
| operatorName | string | `"chaos-operator"` | Operator name |
| replicaCount | int | `1` | Replica count |
| resources | object | `{}` | Resources requests and limits |
| service.port | int | `80` | Service port |
| service.type | string | `"ClusterIP"` | Service type |
| tolerations | list | `[]` | Tolerations |