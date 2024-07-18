#!/bin/bash


# The namespace where the pod is located
NAMESPACE="auto-open5gs"

POD_NAME_POP=$(kubectl get pods -l "app.kubernetes.io/component=populate" -o jsonpath={.items[0].metadata.name})
echo $POD_NAME_POP

# # The path to the shell script file on your local machine
SCRIPT_PATH="/root/naas-discovery-open5gs/naas-discovery-open5gs/open5gs/values/scripts/users-dbctl-dnn22.sh"


# # Copy the shell script to the pod
kubectl cp $SCRIPT_PATH $POD_NAME_POP:/myscript.sh -n $NAMESPACE
echo 'Copied script into pod UE1....'


# # Execute the shell script in the pod
kubectl exec -it $POD_NAME_POP -n $NAMESPACE -- /bin/bash /myscript.sh
echo 'Executed script into pod'

