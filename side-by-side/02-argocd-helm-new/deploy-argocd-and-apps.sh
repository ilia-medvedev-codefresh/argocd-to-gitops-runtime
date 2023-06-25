MYDIR=$(dirname $0)
VALUESFILE=$1
export KUBECONFIG=/tmp/argocd-migration.config
helm upgrade --install --repo https://argoproj.github.io/argo-helm --create-namespace --namespace argocd argocd argo-cd --version 5.29.1 --values $1 --wait
kubectl -n argocd apply -f $MYDIR/../applications