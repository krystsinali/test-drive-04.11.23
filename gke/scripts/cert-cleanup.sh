read -p "Please enter a namespaces: " NAMESPACE 

kubectl delete secret $NAMESPACE-tls -n $NAMESPACE
kubectl delete certificate $NAMESPACE-tls -n $NAMESPACE