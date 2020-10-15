# Litmus helm

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![<litmuschaos>](https://circleci.com/gh/litmuschaos/litmus-helm/tree/master.svg?style=svg)](https://circleci.com/gh/litmuschaos/litmus-helm/tree/master)

Helm Charts for the Litmus Chaos Operator &amp; CRDs

## Usage

### PreRequisites

- Install [helm3](https://helm.sh/docs/intro/install/)

**Note**: Litmus uses Kubernetes custom resource definitions (CRDs) to define chaos intent. Helm3 handles CRDs [better](https://helm.sh/docs/chart_best_practices/custom_resource_definitions/#helm) than helm2!!

### Installation Steps

The following steps will help you install litmus via helm.

#### Step-1: Add the litmus helm repository

```bash
root@demo:~# helm repo add litmuschaos https://litmuschaos.github.io/litmus-helm/
"litmuschaos" has been added to your repositories
```

```bash
root@demo:~# helm repo list
NAME            URL
litmuschaos     https://litmuschaos.github.io/litmus-helm/
```

```bash
root@demo:~# helm search repo litmuschaos
NAME                    CHART VERSION   APP VERSION     DESCRIPTION
litmuschaos/litmus      1.9.0           1.9.0           A Helm chart to install litmus infra components...
```

#### Step-2: Create the litmus namespace

- The litmus infra components will be placed in this namespace.

**Note**: The chaos operator can be placed in any namespace, though it is typically placed in "litmus".

```bash
root@demo:~# kubectl create ns litmus
namespace/litmus created
```

#### Step-3: Install the litmus chaos operator and CRDs

```bash
root@demo:~# helm install chaos litmuschaos/litmus --namespace=litmus
NAME: chaos
LAST DEPLOYED: Fri Sep  29 06:19:50 2020
NAMESPACE: litmus
STATUS: deployed
REVISION: 1
TEST SUITE: None
```

*With this, you are good to go!! Refer to the chaos experiment [documentation](https://docs.litmuschaos.io/docs/pod-delete/) to start executing your first experiment.*

### Additional Steps (Verification)

You can run the following commands if you wish to verify if all desired components are installed successfully.

- Check if chaos CRDs are installed & the api-resources are created for the same

```bash
root@demo:~# kubectl get crds | grep litmus
chaosengines.litmuschaos.io             2020-09-29T06:10:29Z
chaosexperiments.litmuschaos.io         2020-09-29T06:10:29Z
chaosresults.litmuschaos.io             2020-09-29T06:10:29Z
```

```bash
root@demo:~# kubectl api-resources | grep litmus
chaosengines                                   litmuschaos.io                 true         ChaosEngine
chaosexperiments                               litmuschaos.io                 true         ChaosExperiment
chaosresults                                   litmuschaos.io                 true         ChaosResult
```

- Check if the litmus chaos operator deployment is running successfully

```bash
root@demo:~# kubectl get pods -n litmus
NAME                      READY   STATUS    RESTARTS   AGE
litmus-7d998b6568-nnlcd   1/1     Running   0          106s
```

- Check if the chaos operator RBAC is configured appropriately:

```bash
root@demo:~# kubectl get serviceaccount -n litmus
NAME      SECRETS   AGE
default   1         3m56s
litmus    1         3m34s
```

```bash
root@demo:~# kubectl get clusterrole,clusterrolebinding | grep litmus
clusterrole.rbac.authorization.k8s.io/litmus                                                        4m18s
clusterrolebinding.rbac.authorization.k8s.io/litmus                                                 4m18s
```

## Contributing

We'd love to have you contribute! Please refer to our [contribution guidelines](CONTRIBUTING.md) for details.

## License

[Apache 2.0 License](./LICENSE).
