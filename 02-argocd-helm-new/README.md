ArgoCd installed with newer Helm charts - when CRD's are in templates - this applies to chart version below 5.2.0

Procedure - 

Uninsatll:
- Make sure crds.keep=true in the values (can do helm -n <ns> get values and just verify it's not there - by default it is true). This is just a precaution since most likely the resources won't get removed before app controller is removed so nothing will follow up on the finalizer.
- Migrate CRD's with https://raw.githubusercontent.com/codefresh-io/gitops-runtime-helm/main/scripts/adopt-crds.sh
- Export all argocd application from old namespace to the gitsource (script to be created)
- Install runtime


