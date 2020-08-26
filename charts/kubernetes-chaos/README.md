kubernetes-chaos
================
A Helm chart to install litmus chaos experiments for kubernetes category (chaos-chart)

Current app version is `1.7.0`

## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `"k8s"` |  |
| image.litmus.pullPolicy | string | `"Always"` |  |
| image.litmus.repository | string | `"litmuschaos/ansible-runner"` |  |
| image.litmus.tag | string | `"1.7.0"` |  |
| image.litmusGO.pullPolicy | string | `"Always"` |  |
| image.litmusGO.repository | string | `"litmuschaos/go-runner"` |  |
| image.litmusGO.tag | string | `"1.7.0"` |  |
| image.pumba.libName | string | `"pumba"` |  |
| experiments.disabled | list | [] | List the experiments to disable based on their name |
| nameOverride | string | `"k8s"` |  |
