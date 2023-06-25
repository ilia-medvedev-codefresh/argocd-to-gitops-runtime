#!/bin/sh
MYDIR=$(dirname $0)
export KUBECONFIG=/tmp/argocd-migration.config
USER_TOKEN=$1
VERSION=0.2.13-alpha.1
REPO=https://chartmuseum.codefresh.io/gitops-runtime
helm upgrade --install codefresh-gitops-runtime --repo $REPO --version $VERSION --namespace codefresh-gitops-runtime --create-namespace  --values $MYDIR/gitops-runtime-values.yaml --set global.codefresh.userToken.token=$USER_TOKEN gitops-runtime