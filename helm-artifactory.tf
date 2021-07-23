resource "artifactory_local_repository" "helm-local" {
  key             = "helm-demo" 
  package_type    = "helm" 
  repo_layout_ref = "simple-default" 
  description     = "" 
}
resource "artifactory_virtual_repository" "helm" {
  key          = "helm"
  package_type = "helm"
  repositories = [
    "${artifactory_local_repository.helm-local.key}"
  ]
}
