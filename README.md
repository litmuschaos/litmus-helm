# litmus-helm
Helm Charts for the Litmus Chaos Operator &amp; CRDs 


## PreRequisites

- Install [helm3](https://helm.sh/docs/intro/install/)  

**Note**: Litmus uses Kubernetes custom resource definitions (CRDs) to define chaos intent. Helm3 handles CRDs [better](https://helm.sh/docs/chart_best_practices/custom_resource_definitions/#helm) than helm2!!

## Installation Steps 

The following steps will help you install litmus via helm.

### Step-1: Add the litmus helm repository

```
root@demo:~# helm repo add litmuschaos https://litmuschaos.github.io/litmus-helm/
"litmuschaos" has been added to your repositories
```

```
root@demo:~# helm repo list
NAME            URL                                       
litmuschaos     https://litmuschaos.github.io/litmus-helm/
```

```
root@demo:~# helm search repo litmuschaos
NAME                    CHART VERSION   APP VERSION     DESCRIPTION                                       
litmuschaos/litmus      1.5.0           1.5.0           A Helm chart to install litmus infra components...
```

### Step-2: Create the litmus namespace 

- The litmus infra components will be placed in this namespace. 

**Note**: The chaos operator can be placed in any namespace, though it is typically placed in "litmus". 

```
root@demo:~# kubectl create ns litmus 
namespace/litmus created
```

### Step-3: Install the litmus chaos operator and CRDs 

```
root@demo:~# helm install chaos litmuschaos/litmus --namespace=litmus 
NAME: chaos
LAST DEPLOYED: Fri Apr  3 06:19:50 2020
NAMESPACE: litmus
STATUS: deployed
REVISION: 1
TEST SUITE: None
```

*With this, you are good to go!! Refer to the chaos experiment [documentation](https://docs.litmuschaos.io/docs/pod-delete/) to start executing your first experiment.* 

## Additional Steps (Verification)

You can run the following commands if you wish to verify if all desired components are installed successfully.

- Check if chaos CRDs are installed & the api-resources are created for the same

```
root@demo:~# kubectl get crds | grep litmus 
chaosengines.litmuschaos.io             2020-04-03T06:10:29Z
chaosexperiments.litmuschaos.io         2020-04-03T06:10:29Z
chaosresults.litmuschaos.io             2020-04-03T06:10:29Z
```

```
root@demo:~# kubectl api-resources | grep litmus 
chaosengines                                   litmuschaos.io                 true         ChaosEngine
chaosexperiments                               litmuschaos.io                 true         ChaosExperiment
chaosresults                                   litmuschaos.io                 true         ChaosResult
```

- Check if the litmus chaos operator deployment is running successfully 

```
root@demo:~# kubectl get pods -n litmus 
NAME                      READY   STATUS    RESTARTS   AGE
litmus-7d998b6568-nnlcd   1/1     Running   0          106s
```

- Check if the chaos operator RBAC is configured appropriately: 

```
root@demo:~# kubectl get serviceaccount -n litmus 
NAME      SECRETS   AGE
default   1         3m56s
litmus    1         3m34s
```

```
root@demo:~# kubectl get clusterrole,clusterrolebinding | grep litmus
clusterrole.rbac.authorization.k8s.io/litmus                                                        4m18s
clusterrolebinding.rbac.authorization.k8s.io/litmus                                                 4m18s
```


