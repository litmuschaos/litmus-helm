kubernetes-chaos
================
A Helm chart to install litmus chaos experiments for kubernetes category (chaos-chart)

Current chart version is `1.6.2`





## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `"k8s"` |  |
| image.litmus.pullPolicy | string | `"Always"` |  |
| image.litmus.repository | string | `"litmuschaos/ansible-runner"` |  |
| image.litmus.tag | string | `"1.6.2"` |  |
| image.litmusGO.pullPolicy | string | `"Always"` |  |
| image.litmusGO.repository | string | `"litmuschaos/go-runner"` |  |
| image.litmusGO.tag | string | `"1.6.2"` |  |
| image.pumba.libName | string | `"pumba"` |  |
| nameOverride | string | `"k8s"` |  |
