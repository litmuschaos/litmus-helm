# litmus-2-0-0-beta

![Version: 2.0.20-Beta6](https://img.shields.io/badge/Version-2.0.20--Beta6-informational?style=flat-square) ![AppVersion: 2.0.0](https://img.shields.io/badge/AppVersion-2.0.0-informational?style=flat-square)

A Helm chart to install litmus portal

**Homepage:** <https://litmuschaos.io>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| rajdas98 | raj.das@mayadata.io |  |
| ispeakc0de | shubham.chaudhary@mayadata.io |  |
| jasstkn | jasssstkn@yahoo.com |  |

## Source Code

* <https://github.com/litmuschaos/litmus>

## Requirements

Kubernetes: `>=1.16.0-0`

## Installing the Chart

To install this chart with the release name `litmus-portal`:

```console
$ helm repo add litmuschaos https://litmuschaos.github.io/litmus-helm/
$ helm install litmus-portal litmuschaos/litmus-2-0-0-beta
```

***Note***: This chart is in its beta release. To find it using `helm search` add `--devel` option.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| adminConfig.DBPASSWORD | string | `"1234"` |  |
| adminConfig.DBUSER | string | `"admin"` |  |
| adminConfig.DB_PORT | string | `"27017"` |  |
| adminConfig.DB_SERVER | string | `""` | leave empty if uses Mongo DB deployed by this chart |
| adminConfig.JWTSecret | string | `"litmus-portal@123"` |  |
| customLabels | object | `{}` | Additional labels |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.host | string | `""` |  |
| ingress.name | string | `"litmus-ingress"` |  |
| ingress.tls | list | `[]` |  |
| mongo.containerPort | int | `27017` |  |
| mongo.image.pullPolicy | string | `"Always"` |  |
| mongo.image.repository | string | `"litmuschaos/mongo"` |  |
| mongo.image.tag | string | `"4.2.8"` |  |
| mongo.persistence.accessMode | string | `"ReadWriteOnce"` |  |
| mongo.persistence.size | string | `"20Gi"` |  |
| mongo.replicas | int | `1` |  |
| mongo.resources | object | `{}` |  |
| mongo.service.port | int | `27017` |  |
| mongo.service.targetPort | int | `27017` |  |
| mongo.service.type | string | `"ClusterIP"` |  |
| openshift.route.annotations | object | `{}` |  |
| openshift.route.enabled | bool | `false` |  |
| openshift.route.host | string | `""` |  |
| openshift.route.name | string | `"litmus-portal"` |  |
| portal.frontend.containerPort | int | `8080` |  |
| portal.frontend.image.pullPolicy | string | `"Always"` |  |
| portal.frontend.image.repository | string | `"litmuschaos/litmusportal-frontend"` |  |
| portal.frontend.image.tag | string | `"2.0.0-Beta6"` |  |
| portal.frontend.replicas | int | `1` |  |
| portal.frontend.resources | object | `{}` |  |
| portal.frontend.service.port | int | `9091` |  |
| portal.frontend.service.targetPort | int | `8080` |  |
| portal.frontend.service.type | string | `"NodePort"` |  |
| portal.server.authServer.containerPort | int | `3000` |  |
| portal.server.authServer.env.ADMIN_PASSWORD | string | `"litmus"` |  |
| portal.server.authServer.env.ADMIN_USERNAME | string | `"admin"` |  |
| portal.server.authServer.image.pullPolicy | string | `"Always"` |  |
| portal.server.authServer.image.repository | string | `"litmuschaos/litmusportal-auth-server"` |  |
| portal.server.authServer.image.tag | string | `"2.0.0-Beta6"` |  |
| portal.server.authServer.resources | object | `{}` |  |
| portal.server.graphqlServer.containerPort | int | `8080` |  |
| portal.server.graphqlServer.env.ARGO_SERVER_IMAGE | string | `"litmuschaos/argocli:v2.9.3"` |  |
| portal.server.graphqlServer.env.ARGO_WORKFLOW_CONTROLLER_IMAGE | string | `"litmuschaos/workflow-controller:v2.9.3"` |  |
| portal.server.graphqlServer.env.ARGO_WORKFLOW_EXECUTOR_IMAGE | string | `"litmuschaos/argoexec:v2.9.3"` |  |
| portal.server.graphqlServer.env.CONTAINER_RUNTIME_EXECUTOR | string | `"k8sapi"` |  |
| portal.server.graphqlServer.env.EVENT_TRACKER_IMAGE | string | `"litmuschaos/litmusportal-event-tracker:2.0.0-Beta6"` |  |
| portal.server.graphqlServer.env.HUB_BRANCH_NAME | string | `"v1.13.x"` |  |
| portal.server.graphqlServer.env.LITMUS_CHAOS_EXPORTER_IMAGE | string | `"litmuschaos/chaos-exporter:1.13.3"` |  |
| portal.server.graphqlServer.env.LITMUS_CHAOS_OPERATOR_IMAGE | string | `"litmuschaos/chaos-operator:1.13.3"` |  |
| portal.server.graphqlServer.env.LITMUS_CHAOS_RUNNER_IMAGE | string | `"litmuschaos/chaos-runner:1.13.3"` |  |
| portal.server.graphqlServer.env.PORTAL_ENDPOINT | string | `"http://litmusportal-server-service:9002"` |  |
| portal.server.graphqlServer.env.SELF_CLUSTER | string | `"true"` |  |
| portal.server.graphqlServer.env.SERVER_SERVICE_NAME | string | `"litmusportal-server-service"` |  |
| portal.server.graphqlServer.env.SUBSCRIBER_IMAGE | string | `"litmuschaos/litmusportal-subscriber:2.0.0-Beta6"` |  |
| portal.server.graphqlServer.image.pullPolicy | string | `"Always"` |  |
| portal.server.graphqlServer.image.repository | string | `"litmuschaos/litmusportal-server"` |  |
| portal.server.graphqlServer.image.tag | string | `"2.0.0-Beta6"` |  |
| portal.server.graphqlServer.resources | object | `{}` |  |
| portal.server.replicas | int | `1` |  |
| portal.server.service.authServer.port | int | `9003` |  |
| portal.server.service.authServer.targetPort | int | `3000` |  |
| portal.server.service.graphqlServer.port | int | `9002` |  |
| portal.server.service.graphqlServer.targetPort | int | `8080` |  |
| portal.server.service.type | string | `"NodePort"` |  |
| portal.server.serviceAccountName | string | `"litmus-server-account"` |  |
| portalScope | string | `"cluster"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
