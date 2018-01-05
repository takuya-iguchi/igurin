data "aws_iam_role" "this" {
  name = "${var.monitoring_role_name}"
}
