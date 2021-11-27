
data "aws_route53_zone" "zone_selected" {
  zone_id = var.zone_id
}

resource "aws_iam_policy" "external_dns" {
  name        = "external-dns-policy"
  path        = "/"
  description = "Allows access to resources needed to run external-dns."

  policy = <<JSON
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "route53:ChangeResourceRecordSets"
      ],
      "Resource": [
        "${data.aws_route53_zone.zone_selected.arn}"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "route53:ListHostedZones",
        "route53:ListResourceRecordSets"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
JSON
}

resource "aws_iam_role" "external_dns" {
  name = "external-dns-role"
  path = "/"

  assume_role_policy = <<JSON
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Effect": "Allow",
      "Principal": {
        "Federated": "${module.eks.oidc_provider_arn}"
      }
    }
  ]
}
JSON
}

resource "aws_iam_role_policy_attachment" "external_dns" {
  policy_arn = aws_iam_policy.external_dns.arn
  role       = aws_iam_role.external_dns.name
}
