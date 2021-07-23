resource "artifactory_local_repository" "helm-local" {
  key             = "helm-demo" 
  package_type    = "helm" 
  repo_layout_ref = "simple-default" 
  description     = "" 
}
