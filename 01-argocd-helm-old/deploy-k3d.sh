MYDIR=$(dirname $0)
k3d cluster delete argocd-migration
k3d cluster create argocd-migration
k3d kubeconfig get argocd-migration > /tmp/argocd-migration.config
export KUBECONFIG=/tmp/argocd-migration.config
helm install --repo https://argoproj.github.io/argo-helm --create-namespace --namespace argocd argocd argo-cd --version 4.3.1 --wait
kubectl -n argocd apply -f $MYDIR/../applications