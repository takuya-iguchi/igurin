resource "aws_elastic_beanstalk_application" "tftest" {
  name        = "tf-test-name"
  description = "tf-test-desc"
}

resource "aws_elastic_beanstalk_environment" "tfenvtest" {
  name                = "tf-test-name"
  application         = "${aws_elastic_beanstalk_application.tftest.name}"
  solution_stack_name = "64bit Amazon Linux 2017.09 v2.6.0 running PHP 7.1"
  cname_prefix        = "test-iguchi2"

  setting {
  namespace = "aws:ec2:vpc"
  name = "VPCId"
  value = "vpc-xxxxx"
}

setting {
  namespace = "aws:ec2:vpc"
  name = "AssociatePublicIpAddress"
  value = "true"
}

setting {
  namespace = "aws:ec2:vpc"
  name = "Subnets"
  value = "subnet-xxxx,subnet-xxxx,subnet-xxxxx"
}

setting {
  namespace = "aws:ec2:vpc"
  name = "ELBSubnets"
  value = "subnet-xxxx,subnet-xxxx,subnet-xxxx"
}

setting {
  namespace = "aws:ec2:vpc"
  name = "ELBScheme"
  value = "internal"
}

setting {
  namespace = "aws:autoscaling:launchconfiguration"
  name = "InstanceType"
  value = "t2.micro"
}

setting {
  namespace = "aws:autoscaling:asg"
  name = "Availability Zones"
  value = "Any 2"
}

setting {
  namespace = "aws:autoscaling:asg"
  name = "MinSize"
  value = "2"
}

setting {
  namespace = "aws:autoscaling:asg"
  name = "MaxSize"
  value = "3"
}

setting {
  namespace = "aws:elasticbeanstalk:environment"
  name = "ServiceRole"
  value = "xxxx"
}

setting {
  namespace = "aws:elasticbeanstalk:application:environment"
  name = "environment"
  value = "uat"
}

setting {
  namespace = "aws:elasticbeanstalk:application:environment"
  name = "LOGGING_APPENDER"
  value = "GRAYLOG"
}
setting {
  namespace = "aws:elasticbeanstalk:healthreporting:system"
  name = "SystemType"
  value = "enhanced"
}
setting {
  namespace = "aws:autoscaling:updatepolicy:rollingupdate"
  name = "RollingUpdateEnabled"
  value = "true"
}
setting {
  namespace = "aws:autoscaling:updatepolicy:rollingupdate"
  name = "RollingUpdateType"
  value = "Health"
}
setting {
  namespace = "aws:autoscaling:updatepolicy:rollingupdate"
  name = "MinInstancesInService"
  value = "2"
}
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name = "MaxBatchSize"
    value = "1"
  }
  setting {
    namespace = "aws:elb:loadbalancer"
    name = "CrossZone"
    value = "true"
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "BatchSizeType"
    value = "Fixed"
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "BatchSize"
    value = "1"
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "DeploymentPolicy"
    value = "Rolling"
  }
  setting {
    namespace = "aws:elb:policies"
    name = "ConnectionDrainingEnabled"
    value = "true"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "SecurityGroups"
    value = "sg-xxxx"
  }
  tags {
    Team = "OVO"
    Environment = "UAT"
  }
}
