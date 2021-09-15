# Litmus helm

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![<litmuschaos>](https://circleci.com/gh/litmuschaos/litmus-helm/tree/master.svg?style=svg)](https://circleci.com/gh/litmuschaos/litmus-helm/tree/master)

Helm Charts for the Litmus ChaosCenter

## Usage

### PreRequisites

- Install [helm3](https://helm.sh/docs/intro/install/)
- Kubernetes >= 1.17

### Installation Steps

The following steps will help you install litmus via helm.

#### Step-1: Add the litmus helm repository

```bash
helm repo add litmuschaos https://litmuschaos.github.io/litmus-helm/

helm repo list
```

Output:
```
NAME            URL
litmuschaos     https://litmuschaos.github.io/litmus-helm/
```

```bash
helm search repo litmuschaos
```

Output:
```
NAME                        	CHART VERSION	APP VERSION	DESCRIPTION                                       
litmuschaos/kube-aws        	1.15.0       	1.13.8     	A Helm chart to install litmus aws chaos experi...
litmuschaos/kubernetes-chaos	2.13.0       	1.13.8     	A Helm chart to install litmus chaos experiment...
litmuschaos/litmus          	2.1.0          	2.1.0      	A Helm chart to install ChaosCenter               
litmuschaos/litmus-1-x      	1.16.0       	1.13.8     	A Helm chart to install litmus infra components...
```

#### Step-2: Create the litmus namespace

- The litmus chaoscenter components will be placed in this namespace.

**Note**: The chaoscenter components can be placed in any namespace, though it is typically placed in "litmus".

```bash
kubectl create ns litmus
```

#### Step-3: Install the litmus chaos center

```bash
helm install chaos litmuschaos/litmus --namespace=litmus
```

Output:
```bash
NAME: chaos
LAST DEPLOYED: Sat Aug 14 15:47:35 2021
NAMESPACE: litmus
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
Thank you for installing litmus 😀

Your release is named chaos and it's installed to namespace: litmus.

Visit https://docs.litmuschaos.io to find more info.
```

*With this, you are good to go!! Refer to the [documentation](https://docs.litmuschaos.io/)

#### Step-3: Uninstall the litmus chaoscenter

```bash
helm uninstall chaos --namespace=litmus
```

Output:
```bash
release "chaos" uninstalled
```

### Additional Steps (Verification)

You can run the following commands if you wish to verify if all desired components are installed successfully.

- Check if the litmus chaoscenter components are running successfully

```bash
root@demo:~# kubectl get pods -n litmus
NAME                                     READY   STATUS             RESTARTS   AGE
chaos-litmus-frontend-775585bf8f-jblf2   1/1     Running            0          79s
chaos-litmus-mongo-0                     1/1     Running            0          79s
chaos-litmus-server-96b5f656-zqjt4       2/2     Running            0          79s
```

## Contributing

We'd love to have you contribute! Please refer to our [contribution guidelines](CONTRIBUTING.md) for details.

## License

[Apache 2.0 License](./LICENSE).
