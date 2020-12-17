kubernetes-chaos
================
A Helm chart to install litmus chaos experiments for kubernetes category (chaos-chart)

Current app version is `1.11.0`

## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `"k8s"` |  |
| image.litmus.pullPolicy | string | `"Always"` |  |
| image.litmus.repository | string | `"litmuschaos/ansible-runner"` |  |
| image.litmus.tag | string | `"1.11.1"` |  |
| image.litmusGO.pullPolicy | string | `"Always"` |  |
| image.litmusGO.repository | string | `"litmuschaos/go-runner"` |  |
| image.litmusGO.tag | string | `"1.11.1"` |  |
| image.networkChaos.tcImage | string | `"gaiadocker/iproute2"` |  |
| image.stressChaos.stressImage | string | `"gaiaadm/pumba"` |  |
| image.pumba.libName | string | `"pumba"` |  |
| environment.runtime | string | `"docker"` |  |
| environment.socketPath | string | `"/var/run/docker.sock"` |  |
| environment.containerPath | string | `"/var/lib/docker/containers"` |  |
| experiments.disabled | list | [] | List the experiments to disable based on their name |
| nameOverride | string | `"k8s"` |  |
