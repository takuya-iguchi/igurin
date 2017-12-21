resource "aws_elastic_beanstalk_application" "this" {
  name        = "${var.name}"
}

resource "aws_elastic_beanstalk_environment" "this" {
  name                = "${var.environment_name}"
  application         = "${aws_elastic_beanstalk_application.this.name}"
  solution_stack_name = "${var.platform}"
  cname_prefix        = "${var.cname}"

  setting = ["${var.option_setting}"]
}
