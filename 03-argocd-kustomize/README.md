ArgoCd installed with plain manifests

This is the most hazardous scenario - as running kubectl delete -n <argocd-ns> -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
Will cause CRD removal and removal of apllicatio resources for applications with finalizers


1. Make sure applications don't have finalizers!
2. Migrate apps to gitsource
3. Uninstall (Will remove applicaitons) with kubectl delete ....
4. install runtime