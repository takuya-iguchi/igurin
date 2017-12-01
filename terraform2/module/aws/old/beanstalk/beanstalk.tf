resource "aws_elastic_beanstalk_application" "prd" {
  name        = "${var.name_prd}"
}

resource "aws_elastic_beanstalk_environment" "prd" {
  name                = "${var.environment_name_prd}"
  application         = "${aws_elastic_beanstalk_application.prd.name}"
  solution_stack_name = "${var.platform_prd}"
  cname_prefix        = "${var.cname_prd}"

  #setting = ["${var.option_setting_prd}"]
}
