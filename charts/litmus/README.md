# litmus

 A Helm chart to install litmus infra components on Kubernetes

 Current chart version is `1.3.0`

 ## Chart Values

 | Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity |
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