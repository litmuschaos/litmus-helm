# litmus

![Version: 3.0.1](https://img.shields.io/badge/Version-3.0.1-informational?style=flat-square) ![AppVersion: 3.0.0](https://img.shields.io/badge/AppVersion-3.0.0-informational?style=flat-square)

A Helm chart to install ChaosCenter

**Homepage:** <https://litmuschaos.io>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| imrajdas | <raj.das@mayadata.io> |  |
| ispeakc0de | <shubham.chaudhary@mayadata.io> |  |
| jasstkn | <jasssstkn@yahoo.com> |  |

## Source Code

* <https://github.com/litmuschaos/litmus>

## Requirements

Kubernetes: `>=1.16.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://raw.githubusercontent.com/bitnami/charts/archive-full-index/bitnami | mongodb | 12.1.11 |

## Installing the Chart

To install this chart with the release name `litmus-portal`:

```console
$ helm repo add litmuschaos https://litmuschaos.github.io/litmus-helm/
$ helm install litmus-portal litmuschaos/litmus
```

## Upgrading Chart

### From 2.15.8 -> Above

We moved ingress path config from `ingress.host.paths.backend` to `ingress.host.backend.path` and from `ingress.host.paths.frontend` to `ingress.host.backend.frontend`. You need to move your values to the correspondent options and upgrade as usual.

### From 2.13.0 -> 2.13.1 or 2.13.0 -> Above

We separated service configuration from `portal.server.service` to `portal.server.graphqlServer.service` and `portal.server.authServer.service`. You need to move your values to the correspondent options and upgrade as usual.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| adminConfig.ADMIN_PASSWORD | string | `"litmus"` |  |
| adminConfig.ADMIN_USERNAME | string | `"admin"` |  |
| adminConfig.DBPASSWORD | string | `""` | leave empty if uses Mongo DB deployed by this chart |
| adminConfig.DBUSER | string | `""` |  |
| adminConfig.DB_PORT | string | `""` |  |
| adminConfig.DB_SERVER | string | `""` |  |
| adminConfig.JWTSecret | string | `"litmus-portal@123"` |  |
| adminConfig.SKIP_SSL_VERIFY | string | `"false"` |  |
| adminConfig.VERSION | string | `"3.0.0"` |  |
| customLabels | object | `{}` | Additional labels |
| existingSecret | string | `""` | Use existing secret (e.g., External Secrets) |
| image.imagePullSecrets | list | `[]` |  |
| image.imageRegistryName | string | `"litmuschaos"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.host.backend.path | string | `"/backend/(.*)"` | You may need adapt the path depending your ingress-controller |
| ingress.host.backend.pathType | string | `"ImplementationSpecific"` | Allow to set [pathType](https://kubernetes.io/docs/concepts/services-networking/ingress/#path-types) for the backend path |
| ingress.host.frontend.path | string | `"/(.*)"` | You may need adapt the path depending your ingress-controller |
| ingress.host.frontend.pathType | string | `"ImplementationSpecific"` | Allow to set [pathType](https://kubernetes.io/docs/concepts/services-networking/ingress/#path-types) for the frontend path |
| ingress.host.name | string | `""` | This is ingress hostname (ex: my-domain.com) |
| ingress.ingressClassName | string | `""` |  |
| ingress.name | string | `"litmus-ingress"` |  |
| ingress.tls | list | `[]` |  |
| mongodb | object | `{"architecture":"replicaset","auth":{"enabled":true,"existingSecret":"","rootPassword":"1234","rootUser":"root"},"enabled":true,"metrics":{"enabled":false,"prometheusRule":{"enabled":false}},"persistence":{"enabled":true},"replicaCount":3,"volumePermissions":{"enabled":true}}` | Configure the Bitnami MongoDB subchart see values at https://github.com/bitnami/charts/blob/master/bitnami/mongodb/values.yaml |
| mongodb.auth.existingSecret | string | `""` | existingSecret Existing secret with MongoDB(&reg;) credentials (keys: `mongodb-passwords`, `mongodb-root-password`, `mongodb-metrics-password`, ` mongodb-replica-set-key`) |
| nameOverride | string | `""` |  |
| openshift.route.annotations | object | `{}` |  |
| openshift.route.customLabels | object | `{}` |  |
| openshift.route.enabled | bool | `false` |  |
| openshift.route.host | string | `""` |  |
| openshift.route.name | string | `"litmus-portal"` |  |
| portal.frontend.affinity | object | `{}` |  |
| portal.frontend.automountServiceAccountToken | bool | `false` |  |
| portal.frontend.autoscaling.enabled | bool | `false` |  |
| portal.frontend.autoscaling.maxReplicas | int | `3` |  |
| portal.frontend.autoscaling.minReplicas | int | `2` |  |
| portal.frontend.autoscaling.targetCPUUtilizationPercentage | int | `50` |  |
| portal.frontend.autoscaling.targetMemoryUtilizationPercentage | int | `50` |  |
| portal.frontend.containerPort | int | `8185` |  |
| portal.frontend.customLabels | object | `{}` |  |
| portal.frontend.image.pullPolicy | string | `"Always"` |  |
| portal.frontend.image.repository | string | `"litmusportal-frontend"` |  |
| portal.frontend.image.tag | string | `"3.0.0"` |  |
| portal.frontend.livenessProbe.failureThreshold | int | `5` |  |
| portal.frontend.livenessProbe.initialDelaySeconds | int | `30` |  |
| portal.frontend.livenessProbe.periodSeconds | int | `10` |  |
| portal.frontend.livenessProbe.successThreshold | int | `1` |  |
| portal.frontend.livenessProbe.timeoutSeconds | int | `5` |  |
| portal.frontend.nodeSelector | object | `{}` |  |
| portal.frontend.readinessProbe.initialDelaySeconds | int | `5` |  |
| portal.frontend.readinessProbe.periodSeconds | int | `10` |  |
| portal.frontend.readinessProbe.successThreshold | int | `1` |  |
| portal.frontend.readinessProbe.timeoutSeconds | int | `1` |  |
| portal.frontend.replicas | int | `1` |  |
| portal.frontend.resources.limits.cpu | string | `"550m"` |  |
| portal.frontend.resources.limits.ephemeral-storage | string | `"1Gi"` |  |
| portal.frontend.resources.limits.memory | string | `"512Mi"` |  |
| portal.frontend.resources.requests.cpu | string | `"125m"` |  |
| portal.frontend.resources.requests.ephemeral-storage | string | `"500Mi"` |  |
| portal.frontend.resources.requests.memory | string | `"150Mi"` |  |
| portal.frontend.service.annotations | object | `{}` |  |
| portal.frontend.service.port | int | `9091` |  |
| portal.frontend.service.targetPort | int | `8185` |  |
| portal.frontend.service.type | string | `"ClusterIP"` |  |
| portal.frontend.tolerations | list | `[]` |  |
| portal.frontend.updateStrategy | object | `{}` |  |
| portal.frontend.virtualService.enabled | bool | `false` |  |
| portal.frontend.virtualService.gateways | list | `[]` |  |
| portal.frontend.virtualService.hosts | list | `[]` |  |
| portal.frontend.virtualService.pathPrefixEnabled | bool | `false` |  |
| portal.server.affinity | object | `{}` |  |
| portal.server.authServer.automountServiceAccountToken | bool | `false` |  |
| portal.server.authServer.autoscaling.enabled | bool | `false` |  |
| portal.server.authServer.autoscaling.maxReplicas | int | `3` |  |
| portal.server.authServer.autoscaling.minReplicas | int | `2` |  |
| portal.server.authServer.autoscaling.targetCPUUtilizationPercentage | int | `50` |  |
| portal.server.authServer.autoscaling.targetMemoryUtilizationPercentage | int | `50` |  |
| portal.server.authServer.env.LITMUS_GQL_GRPC_PORT | string | `":8000"` |  |
| portal.server.authServer.image.pullPolicy | string | `"Always"` |  |
| portal.server.authServer.image.repository | string | `"litmusportal-auth-server"` |  |
| portal.server.authServer.image.tag | string | `"3.0.0"` |  |
| portal.server.authServer.ports[0].containerPort | int | `3030` |  |
| portal.server.authServer.ports[0].name | string | `"auth-server"` |  |
| portal.server.authServer.ports[1].containerPort | int | `3000` |  |
| portal.server.authServer.ports[1].name | string | `"auth-rpc-server"` |  |
| portal.server.authServer.replicas | int | `1` |  |
| portal.server.authServer.resources.limits.cpu | string | `"550m"` |  |
| portal.server.authServer.resources.limits.ephemeral-storage | string | `"1Gi"` |  |
| portal.server.authServer.resources.limits.memory | string | `"712Mi"` |  |
| portal.server.authServer.resources.requests.cpu | string | `"225m"` |  |
| portal.server.authServer.resources.requests.ephemeral-storage | string | `"500Mi"` |  |
| portal.server.authServer.resources.requests.memory | string | `"250Mi"` |  |
| portal.server.authServer.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| portal.server.authServer.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| portal.server.authServer.securityContext.runAsNonRoot | bool | `true` |  |
| portal.server.authServer.securityContext.runAsUser | int | `2000` |  |
| portal.server.authServer.service.annotations | object | `{}` |  |
| portal.server.authServer.service.authRpcServer.port | int | `3030` |  |
| portal.server.authServer.service.authRpcServer.targetPort | int | `3030` |  |
| portal.server.authServer.service.authServer.port | int | `9003` |  |
| portal.server.authServer.service.authServer.targetPort | int | `3000` |  |
| portal.server.authServer.service.type | string | `"ClusterIP"` |  |
| portal.server.authServer.volumeMounts | list | `[]` |  |
| portal.server.authServer.volumes | list | `[]` |  |
| portal.server.customLabels | object | `{}` |  |
| portal.server.graphqlServer.genericEnv.CHAOS_CENTER_UI_ENDPOINT | string | `""` |  |
| portal.server.graphqlServer.genericEnv.CONTAINER_RUNTIME_EXECUTOR | string | `"k8sapi"` |  |
| portal.server.graphqlServer.genericEnv.DEFAULT_HUB_BRANCH_NAME | string | `"v3.0.x"` |  |
| portal.server.graphqlServer.genericEnv.INFRA_COMPATIBLE_VERSIONS | string | `"[\"3.0.0\"]"` |  |
| portal.server.graphqlServer.genericEnv.INFRA_DEPLOYMENTS | string | `"[\"app=chaos-exporter\", \"name=chaos-operator\", \"app=event-tracker\", \"app=workflow-controller\"]"` |  |
| portal.server.graphqlServer.genericEnv.LITMUS_AUTH_GRPC_PORT | string | `":3030"` |  |
| portal.server.graphqlServer.genericEnv.REMOTE_HUB_MAX_SIZE | string | `"5000000"` |  |
| portal.server.graphqlServer.genericEnv.TLS_CERT_64 | string | `""` |  |
| portal.server.graphqlServer.genericEnv.TLS_SECRET_NAME | string | `""` |  |
| portal.server.graphqlServer.genericEnv.WORKFLOW_HELPER_IMAGE_VERSION | string | `"3.0.0"` |  |
| portal.server.graphqlServer.image.pullPolicy | string | `"Always"` |  |
| portal.server.graphqlServer.image.repository | string | `"litmusportal-server"` |  |
| portal.server.graphqlServer.image.tag | string | `"3.0.0"` |  |
| portal.server.graphqlServer.imageEnv.ARGO_WORKFLOW_CONTROLLER_IMAGE | string | `"workflow-controller:v3.3.1"` |  |
| portal.server.graphqlServer.imageEnv.ARGO_WORKFLOW_EXECUTOR_IMAGE | string | `"argoexec:v3.3.1"` |  |
| portal.server.graphqlServer.imageEnv.EVENT_TRACKER_IMAGE | string | `"litmusportal-event-tracker:3.0.0"` |  |
| portal.server.graphqlServer.imageEnv.LITMUS_CHAOS_EXPORTER_IMAGE | string | `"chaos-exporter:3.0.0"` |  |
| portal.server.graphqlServer.imageEnv.LITMUS_CHAOS_OPERATOR_IMAGE | string | `"chaos-operator:3.0.0"` |  |
| portal.server.graphqlServer.imageEnv.LITMUS_CHAOS_RUNNER_IMAGE | string | `"chaos-runner:3.0.0"` |  |
| portal.server.graphqlServer.imageEnv.SUBSCRIBER_IMAGE | string | `"litmusportal-subscriber:3.0.0"` |  |
| portal.server.graphqlServer.livenessProbe.failureThreshold | int | `5` |  |
| portal.server.graphqlServer.livenessProbe.initialDelaySeconds | int | `30` |  |
| portal.server.graphqlServer.livenessProbe.periodSeconds | int | `10` |  |
| portal.server.graphqlServer.livenessProbe.successThreshold | int | `1` |  |
| portal.server.graphqlServer.livenessProbe.timeoutSeconds | int | `5` |  |
| portal.server.graphqlServer.ports[0].containerPort | int | `8080` |  |
| portal.server.graphqlServer.ports[0].name | string | `"gql-server"` |  |
| portal.server.graphqlServer.ports[1].containerPort | int | `8000` |  |
| portal.server.graphqlServer.ports[1].name | string | `"gql-rpc-server"` |  |
| portal.server.graphqlServer.readinessProbe.initialDelaySeconds | int | `5` |  |
| portal.server.graphqlServer.readinessProbe.periodSeconds | int | `10` |  |
| portal.server.graphqlServer.readinessProbe.successThreshold | int | `1` |  |
| portal.server.graphqlServer.readinessProbe.timeoutSeconds | int | `1` |  |
| portal.server.graphqlServer.resources.limits.cpu | string | `"550m"` |  |
| portal.server.graphqlServer.resources.limits.ephemeral-storage | string | `"1Gi"` |  |
| portal.server.graphqlServer.resources.limits.memory | string | `"712Mi"` |  |
| portal.server.graphqlServer.resources.requests.cpu | string | `"225m"` |  |
| portal.server.graphqlServer.resources.requests.ephemeral-storage | string | `"500Mi"` |  |
| portal.server.graphqlServer.resources.requests.memory | string | `"250Mi"` |  |
| portal.server.graphqlServer.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| portal.server.graphqlServer.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| portal.server.graphqlServer.securityContext.runAsNonRoot | bool | `true` |  |
| portal.server.graphqlServer.securityContext.runAsUser | int | `2000` |  |
| portal.server.graphqlServer.service.annotations | object | `{}` |  |
| portal.server.graphqlServer.service.graphqlRpcServer.port | int | `8000` |  |
| portal.server.graphqlServer.service.graphqlRpcServer.targetPort | int | `8000` |  |
| portal.server.graphqlServer.service.graphqlServer.port | int | `9002` |  |
| portal.server.graphqlServer.service.graphqlServer.targetPort | int | `8080` |  |
| portal.server.graphqlServer.service.type | string | `"ClusterIP"` |  |
| portal.server.graphqlServer.volumeMounts[0].mountPath | string | `"/tmp/"` |  |
| portal.server.graphqlServer.volumeMounts[0].name | string | `"gitops-storage"` |  |
| portal.server.graphqlServer.volumeMounts[1].mountPath | string | `"/tmp/version"` |  |
| portal.server.graphqlServer.volumeMounts[1].name | string | `"hub-storage"` |  |
| portal.server.graphqlServer.volumes[0].emptyDir | object | `{}` |  |
| portal.server.graphqlServer.volumes[0].name | string | `"gitops-storage"` |  |
| portal.server.graphqlServer.volumes[1].emptyDir | object | `{}` |  |
| portal.server.graphqlServer.volumes[1].name | string | `"hub-storage"` |  |
| portal.server.nodeSelector | object | `{}` |  |
| portal.server.replicas | int | `1` |  |
| portal.server.serviceAccountName | string | `"litmus-server-account"` |  |
| portal.server.tolerations | list | `[]` |  |
| portal.server.updateStrategy | object | `{}` |  |
| portal.server.waitForMongodb.image.pullPolicy | string | `"Always"` |  |
| portal.server.waitForMongodb.image.repository | string | `"mongo"` |  |
| portal.server.waitForMongodb.image.tag | int | `6` |  |
| portal.server.waitForMongodb.resources.limits.cpu | string | `"250m"` |  |
| portal.server.waitForMongodb.resources.limits.ephemeral-storage | string | `"1Gi"` |  |
| portal.server.waitForMongodb.resources.limits.memory | string | `"512Mi"` |  |
| portal.server.waitForMongodb.resources.requests.cpu | string | `"25m"` |  |
| portal.server.waitForMongodb.resources.requests.ephemeral-storage | string | `"500Mi"` |  |
| portal.server.waitForMongodb.resources.requests.memory | string | `"150Mi"` |  |
| portal.server.waitForMongodb.securityContext | object | `{}` |  |
| portalScope | string | `"cluster"` |  |
| upgradeAgent.affinity | object | `{}` |  |
| upgradeAgent.controlPlane.image.pullPolicy | string | `"Always"` |  |
| upgradeAgent.controlPlane.image.repository | string | `"upgrade-agent-cp"` |  |
| upgradeAgent.controlPlane.image.tag | string | `"3.0.0"` |  |
| upgradeAgent.controlPlane.restartPolicy | string | `"OnFailure"` |  |
| upgradeAgent.nodeSelector | object | `{}` |  |
| upgradeAgent.resources | object | `{}` |  |
| upgradeAgent.tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
