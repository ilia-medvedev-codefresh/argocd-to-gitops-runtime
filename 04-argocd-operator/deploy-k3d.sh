MYDIR=$(dirname $0)
rm -rf $MYDIR/argocd-operator
git clone https://github.com/argoproj-labs/argocd-operator.git
k3d cluster delete argocd-migration
k3d cluster create argocd-migration
k3d kubeconfig get argocd-migration > /tmp/argocd-migration.config
export KUBECONFIG=/tmp/argocd-migration.config
kustomize build $MYDIR/argocd-operator/config/default | kubectl apply -f -
rm -rf $MYDIR/argocd-operator
kubectl create namespace argocd
kubectl apply -n argocd -f $MYDIR/argocd-resource
kubectl -n argocd apply -f $MYDIR/../applications