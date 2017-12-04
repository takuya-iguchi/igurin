module "beanstalk" {
  source = "../../module/aws/other/beanstalk"

  name = "sakura"
  environment_name = "sakura"
  platform = "64bit Amazon Linux 2017.09 v2.6.0 running Python 3.6"
  cname = "sakura"

  option_setting = [
#####################################
# VPC Settings
#####################################
    {
      namespace = "aws:ec2:vpc"
      name = "VPCId"
      value = "vpc-2311e344"
    },
    {
      namespace = "aws:ec2:vpc"
      name = "AssociatePublicIpAddress"
      value = "true"
    },
    {
      namespace = "aws:ec2:vpc"
      name = "Subnets"
      value = "subnet-8c30a6c5, subnet-0d0ac556"
    },
    {
      namespace = "aws:ec2:vpc"
      name = "ELBSubnets"
      value = "subnet-8c30a6c5, subnet-0d0ac556"
    },
    {
      namespace = "aws:ec2:vpc"
      name = "ELBScheme"
      value = "public"
    },
#####################################
# ELB Settings
#####################################
    {
      namespace = "aws:elb:loadbalancer"
      name = "CrossZone"
      value = "true"
    },
    {
      namespace = "aws:elb:loadbalancer"
      name = "SecurityGroups"
      value = "sg-cd2be9b4"
    },
    {
      namespace = "aws:elb:loadbalancer"
      name = "ManagedSecurityGroup"
      value = "sg-cd2be9b4"
    },
#####################################
# Beanstalk Settings
#####################################
    {
      namespace = "aws:elasticbeanstalk:environment"
      name = "ServiceRole"
      value = "aws-elasticbeanstalk-service-role"
    },
    {
      namespace = "aws:elasticbeanstalk:healthreporting:system"
      name = "SystemType"
      value = "enhanced"
    },

#####################################
# AutoScaling Settings
#####################################
    {
      namespace = "aws:autoscaling:trigger"
      name = "MeasureName"
      value = "CPUUtilization"
    },
    {
      namespace = "aws:autoscaling:trigger"
      name = "Period"
      value = "5"
    },
    {
      namespace = "aws:autoscaling:trigger"
      name = "Statistic"
      value = "Average"
    },
    {
      namespace = "aws:autoscaling:trigger"
      name = "Unit"
      value = "Percent"
    },
    {
      namespace = "aws:autoscaling:trigger"
      name = "LowerBreachScaleIncrement"
      value = "-2"
    },
    {
      namespace = "aws:autoscaling:trigger"
      name = "LowerThreshold"
      value = "30"
    },
    {
      namespace = "aws:autoscaling:trigger"
      name = "UpperBreachScaleIncrement"
      value = "2"
    },
    {
      namespace = "aws:autoscaling:trigger"
      name = "UpperThreshold"
      value = "90"
    },
    {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "SecurityGroups"
      value = "sg-cd2be9b4"
    },
    {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "IamInstanceProfile"
      value = "EC2"
    },
    {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "MonitoringInterval"
      value = "1 minute"
    },
    {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "InstanceType"
      value = "t2.micro"
    },
    {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "EC2KeyName"
      value = "WEB"
    },
    {
      namespace = "aws:autoscaling:asg"
      name = "MaxSize"
      value = "6"
    },
    {
      namespace = "aws:autoscaling:asg"
      name = "MinSize"
      value = "2"
    }
  ]
}
