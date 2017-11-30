resource "aws_elastic_beanstalk_application" "tftest" {
  name        = "${var.app_name}"
}

resource "aws_elastic_beanstalk_environment" "tfenvtest" {
  name                = "${var.env_name}"
  application         = "${aws_elastic_beanstalk_application.tftest.name}"
  solution_stack_name = "${var.platform}"
  cname_prefix        = "${var.cname}"

  setting = ["${var.option_setting}"]
}
