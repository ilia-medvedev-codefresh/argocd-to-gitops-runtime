MYDIR=$(dirname $0)
VALUESFILE=$1
export KUBECONFIG=/tmp/argocd-migration.config
helm upgrade --install --repo https://argoproj.github.io/argo-helm --create-namespace --namespace argocd2 argocd argo-cd --version 5.38.0 --wait --values $1
kubectl -n argocd2 apply -f $MYDIR/../applications