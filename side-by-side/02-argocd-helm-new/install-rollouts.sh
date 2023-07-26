
#!/bin/bash
export KUBECONFIG=/tmp/argocd-migration.config
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/download/v1.4.1/install.yaml
kubectl create namespace rollouts-demo
kubectl -n rollouts-demo apply -f https://raw.githubusercontent.com/argoproj/rollouts-demo/master/examples/canary/canary-preview-service.yaml
kubectl -n rollouts-demo apply -f https://raw.githubusercontent.com/argoproj/rollouts-demo/master/examples/canary/canary-service.yaml
kubectl -n rollouts-demo apply -f https://raw.githubusercontent.com/argoproj/rollouts-demo/master/examples/canary/canary-rollout.yaml