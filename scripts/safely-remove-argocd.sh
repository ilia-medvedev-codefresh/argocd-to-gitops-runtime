#!/bin/bash
namespace=$1
kubectl -n $namespace scale --replicas 0 statefulset,deployment -l app.kubernetes.io/part-of=argocd
# Here we run some export mechanism for the ArgoCD applications to Codefresh gitsource
# Remove ArgoCD
# Install gitops runtime to a different namespace!!!
# Remove argocd applications from old namespace
