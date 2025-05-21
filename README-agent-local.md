
Based on  https://litmuschaos.github.io/litmus/experiments/concepts/security/openshift-scc/


```
helm search repo litmus-agent
```
<pre>
NAME                            CHART VERSION   APP VERSION     DESCRIPTION
litmuschaos/litmus-agent        3.18.0          3.18.0          A Helm chart to install litmus agen
</pre>

```
helm search repo litmus-agent --versions
```
<pre>
NAME                            CHART VERSION   APP VERSION     DESCRIPTION
litmuschaos/litmus-agent        3.18.0          3.18.0          A Helm chart to install litmus agent
litmuschaos/litmus-agent        3.16.0          3.16.0          A Helm chart to install litmus agent
litmuschaos/litmus-agent        3.15.0          3.15.0          A Helm chart to install litmus agent
</pre>



### origin helm chart
```
helm template litmus charts/litmus-agent  --namespace litmus-system --version 3.18 --values charts/litmus-agent/values.yaml
helm template litmus charts/litmus-agent  --namespace litmus-system --version 3.18  --values charts/litmus-agent/values.yaml | grep "image: "
```

```
helm install litmus-agent litmuschaos/litmus-agent \
  --namespace litmus-system --create-namespace \
  --version 3.18 \
  --set "INFRA_NAME=helm-agent" \
  --set "INFRA_DESCRIPTION=My first agent deployed with helm !" \
  --set "LITMUS_URL=https://chaos-center.domain.com" \ # FOR REMOTE AGENT (INGRESS)
  --set "LITMUS_URL=http://litmusportal-frontend-service.litmus.svc.cluster.local:9091" \ # FOR SELF AGENT (SVC)
  --set "LITMUS_BACKEND_URL=http://litmusportal-server-service.litmus.svc.cluster.local:9002" \ # FOR SELF AGENT (SVC)
  --set "LITMUS_USERNAME=admin" \
  --set "LITMUS_PASSWORD=litmus" \
  --set "LITMUS_PROJECT_ID=69395cb3-0231-4262-8990-78056c8adb4c" \
  --set "LITMUS_ENVIRONMENT_ID=nameofenvironment"

```


### local checks
```
helm template litmus charts/litmus-agent  --namespace litmus-system   --version 3.18 --values values-agent-local-3-18-0.yaml
helm template litmus charts/litmus-agent  --namespace litmus-system   --version 3.18 --values values-agent-local-3-18-0.yaml > all-litmus-agent-3-18-0-manifests.yaml.out
helm template litmus charts/litmus-agent  --namespace litmus-system   --version 3.18 --values values-agent-local-3-18-0.yaml | grep "image: "
helm template litmus charts/litmus-agent  --namespace litmus-system   --version 3.18 --values values-agent-local-3-18-0.yaml | grep "runAsUser: " -C 10
helm template litmus charts/litmus-agent  --namespace litmus-system   --version 3.18 --values values-agent-local-3-18-0.yaml | grep "serviceAccountName:"
```


### spliting template manifest by the resource kind
```
yq -s '"split-agent-3-18-0"+(.kind | downcase) + "-" + .metadata.name +"-"+ $index' all-litmus-agent-3-18-0-manifests.yaml.out
```

### checking values file
```
yq eval . values-agent-local-3-18-0.yaml
```
### testing  with local cluster
```
kubectl apply -f all-litmus-agent-3-18-0-manifests.yaml.out -n litmus-system --dry-run=client
kubectl apply -f all-litmus-agent-3-18-0-manifests.yaml.out -n litmus-system --dry-run=server
```
### cleaniing up
```
rm all-litmus-*-manifests.yaml.out
rm split*.y*ml
```



