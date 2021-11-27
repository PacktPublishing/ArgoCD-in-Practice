data "template_file" "bootstrap" {
  template = file("../k8s-bootstrap/base/master-utilities.yaml")
  vars = {
    iam_role   = aws_iam_role.external_dns.arn
    domain     = var.domain
    txtOwnerId = var.zone_id
  }
}

data "kustomization_build" "argocd" {
  path = "../k8s-bootstrap/bootstrap"
}

resource "kustomization_resource" "argocd" {
  for_each = data.kustomization_build.argocd.ids
  manifest = data.kustomization_build.argocd.manifests[each.value]
  depends_on = [
    data.template_file.bootstrap
  ]
}
