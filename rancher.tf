resource "helm_release" "rancher-stable" {
  name        = "rancher-stable"
  chart       = "rancher-stable.tgz"
  repository  = "/rancher"
  namespace   = "default"
  version     = "2.4.8"
  
  values = [
    "${file("rancher/values.yaml")}"
  ]
}