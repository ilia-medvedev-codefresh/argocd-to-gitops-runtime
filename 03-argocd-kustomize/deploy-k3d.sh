MYDIR=$(dirname $0)
k3d cluster delete argocd-migration
k3d cluster create argocd-migration
k3d kubeconfig get argocd-migration > /tmp/argocd-migration.config
export KUBECONFIG=/tmp/argocd-migration.config
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl -n argocd apply -f $MYDIR/../applications