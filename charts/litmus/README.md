litmus
======
A Helm chart to install litmus infra components on Kubernetes.

Current chart version is `1.11.0`

## Architecture introduction

![litmus architecture](https://camo.githubusercontent.com/44801ffbcabc79d86867ea259c0a3046bd124987/68747470733a2f2f646f63732e6c69746d75736368616f732e696f2f646f63732f6173736574732f6172636869746563747572652e706e67)

### Chaos-Operator

Chaos-Operator watches for the ChaosEngine CRs across namespaces and executes the Chaos-Experiments mentioned in the CR. By default, it runs in litmus namespace. The Chaos-exporter is used to export chaos metrics about state of experiments listed in the ChaosEngine, to a Prometheus database.

### Chaos-CRDs

During installation, the following three CRDs are installed on the Kubernetes cluster.
```
chaosengines.litmuschaos.io
chaosexperiments.litmuschaos.io
chaosresults.litmuschaos.io
```

### Chaos-Experiments

Chaos Experiment is a CR and are available as YAML files on Chaos Hub. For more details visit ChaosHub [documentation](https://docs.litmuschaos.io/docs/chaoshub/). To view and install chaos charts visit [chaos-charts](https://github.com/litmuschaos/chaos-charts) repository.

### Chaos-Engine

ChaosEngine CR links application to experiments. User has to create ChaosEngine YAML by specifying the application label and experiments and create the CR. The CR is watched by Chaos-Operator and chaos-experiments are executed on a given application.

### Chaos-Exporter

Optionally metrics can be exported to a Prometheus database. Chaos-Exporter implements the Prometheus `/metrics` endpoint in port: `8080`.

Full documentation can be found [here](https://litmuschaos.io)

## Chart Values

The following table lists the configurable parameters of the Litmus chart and their default values.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| operatorMode | string | `standard` | Operational mode of the chaos operator. Supports: `standard`, `namespaced`, `admin` |
| affinity | object | `{}` | Affinity for operator |
| exporter.affinity | object | `{}` | Affinity for exporter |
| exporter.enabled | bool | `false` | If metrics exporter enabled  |
| exporter.image.pullPolicy | string | `"Always"` | Image pill policy for exporter |
| exporter.image.repository | string | `"litmuschaos/chaos-exporter"` | Image repository for exporter |
| exporter.image.tag | string | `"1.11.0"` | Image tag for exporter |
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
| \<operator\|runner\>.image.tag | string | `"1.11.0"` | Image operator or runner tag |
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
