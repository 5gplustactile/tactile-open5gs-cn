#!/bin/bash

# The name of the pod to execute the script in
POD_NAME="my-pod"

# The namespace where the pod is located
NAMESPACE="auto-open5gs"

POD_NAME_UE=$(kubectl get pods -l "app.kubernetes.io/component=ues" -o jsonpath={.items[0].metadata.name})
echo $POD_NAME_UE

POD_NAME_UE2=$(kubectl get pods -l "app.kubernetes.io/instance=ueransim-gnb-dnn2" -o jsonpath={.items[1].metadata.name})
#POD_NAME2=$(kubectl get pods -o jsonpath={.items[1].metadata.name})
echo $POD_NAME_UE2

#POD_NAME3='deployments/ueransim-gnb-ues'

# # The path to the shell script file on your local machine
SCRIPT_PATH="/root/naas-discovery-open5gs/naas-discovery-open5gs/open5gs/values/scripts/hitraffic20_gNB2.sh"



kubectl cp $SCRIPT_PATH $POD_NAME_UE2:/myscript.sh -n $NAMESPACE
echo 'Copied script into pod UE2....'

# # Execute the shell script in the pod
kubectl exec -it $POD_NAME_UE2 -n $NAMESPACE -- /bin/bash /myscript.sh
echo 'Executed script into pod'