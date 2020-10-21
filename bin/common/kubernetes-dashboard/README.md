## Install dashboard

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
```

## Create dashboard admin user

```
kubectl create -f dashboard.admin-user.yml -f dashboard.admin-user-role.yml
```

## Show admin token

```
kubectl -n kubernetes-dashboard describe secret admin-user-token
```

## Access with `kubectl proxy`

- http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

## Links:

- https://rancher.com/docs/k3s/latest/en/installation/kube-dashboard/
- https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
- https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md
