IFS=$'\n'
for crd in `kubectl api-resources |grep "litmuschaos.io" | awk '{print $1}'`
do
  kubectl delete crd  $crd.litmuschaos.io
done

for crd in `kubectl api-resources |grep "argoproj.io" | awk '{print $1}'`
do
  kubectl delete crd  $crd.argoproj.io
done
