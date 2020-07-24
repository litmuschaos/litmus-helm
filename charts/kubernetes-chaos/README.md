kubernetes-chaos
================
A Helm chart to install litmus chaos experiments for kubernetes category (chaos-chart)

Current chart version is `1.6.0`





## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `"k8s"` |  |
| image.chaostoolkit.repository | string | `"litmuschaos/chaostoolkit"` |  |
| image.chaostoolkit.tag | string | `"latest"` |  |
| image.ddMemoryStress.repository | string | `"litmuschaos/app-memory-stress"` |  |
| image.ddMemoryStress.tag | string | `"latest"` |  |
| image.linuxStressNG.repository | string | `"alexeiled/stress-ng"` |  |
| image.linuxStressNG.tag | string | `"latest"` |  |
| image.litmus.pullPolicy | string | `"Always"` |  |
| image.litmus.repository | string | `"litmuschaos/ansible-runner"` |  |
| image.litmus.tag | string | `"1.6.0"` |  |
| image.litmusContainerKillHelper.libName | string | `"containerd"` |  |
| image.litmusContainerKillHelper.repository | string | `"litmuschaos/container-kill-helper"` |  |
| image.litmusContainerKillHelper.tag | string | `"latest"` |  |
| image.litmusGO.pullPolicy | string | `"Always"` |  |
| image.litmusGO.repository | string | `"litmuschaos/go-runner"` |  |
| image.litmusGO.tag | string | `"1.6.0"` |  |
| image.litmusPodDeleteHelper.repository | string | `"litmuschaos/pod-delete-helper"` |  |
| image.litmusPodDeleteHelper.tag | string | `"latest"` |  |
| image.litmusStressNG.repository | string | `"litmuschaos/stress-ng"` |  |
| image.litmusStressNG.tag | string | `"latest"` |  |
| image.md5sumCpuStress.repository | string | `"litmuschaos/app-cpu-stress"` |  |
| image.md5sumCpuStress.tag | string | `"latest"` |  |
| image.powerfulseal.repository | string | `"store/bloomberg/powerfulseal"` |  |
| image.powerfulseal.tag | string | `"2.8.0"` |  |
| image.pumba.libName | string | `"pumba"` |  |
| image.pumba.repository | string | `"gaiaadm/pumba"` |  |
| image.pumba.tag | string | `"0.6.5"` |  |
| nameOverride | string | `"k8s"` |  |
