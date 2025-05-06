

helm template litmus charts/litmus  --namespace litmus-system --version 3.16 --values charts/litmus/values.yaml
helm template litmus charts/litmus  --namespace litmus-system  --values charts/litmus/values.yaml | grep "image: "


helm template litmus charts/litmus  --namespace litmus-system   --version 3.16 --values values-local-3-16-0.yaml
helm template litmus charts/litmus  --namespace litmus-system   --version 3.16 --values values-local-3-16-0.yaml > all-litmus-manifests.yaml.out
helm template litmus charts/litmus  --namespace litmus-system   --version 3.16 --values values-local-3-16-0.yaml | grep "image: "
helm template litmus charts/litmus  --namespace litmus-system   --version 3.16 --values values-local-3-16-0.yaml | grep "runAsUser: " -C 10
helm template litmus charts/litmus  --namespace litmus-system   --version 3.16 --values values-local-3-16-0.yaml | grep "ServiceAccount: "


yq -s '"split-"+(.kind | downcase) + "-" + .metadata.name +"-"+ $index' all-litmus-manifests.yaml.out

# checking values file
yq eval . values-local-3-16-0.yaml

# checking  template files 
yq eval . all-litmus-manifests.yaml.out


kubectl apply -f all-litmus-manifests.yaml.out -n litmus-system --dry-run=client
kubectl apply -f all-litmus-manifests.yaml.out -n litmus-system --dry-run=server


rm all-litmus-manifests.yaml.out

rm split*.y*ml
