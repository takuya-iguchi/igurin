variable "option_setting" {
  type        = "list"
  default     = [
#####################################
# VPC Settings
#####################################
    {
      namespace = "aws:ec2:vpc"
      name = "VPCId"
      value = "vpc-xxxxx"
    },
    {
      namespace = "aws:ec2:vpc"
      name = "AssociatePublicIpAddress"
      value = "true"
    },
    {
      namespace = "aws:ec2:vpc"
      name = "Subnets"
      value = "subnet-xxxx,subnet-xxxx"
    },
    {
      namespace = "aws:ec2:vpc"
      name = "ELBSubnets"
      value = "subnet-xxxx,subnet-xxxx"
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
      value = "sg-****,sg-****"
    },
    {
      namespace = "aws:elb:loadbalancer"
      name = "ManagedSecurityGroup"
      value = "sg-****"
    },
#####################################
# Beanstalk Settings
#####################################
    {
      namespace = "aws:elasticbeanstalk:environment"
      name = "ServiceRole"
      value = "xxxx"
    },
    {
      namespace = "aws:elasticbeanstalk:healthreporting:system"
      name = "SystemType"
      value = "enhanced"
    },
#####################################
# CloudWatch Settings
#####################################
    {
      namespace = "AWSEBCloudwatchAlarmLow.aws:autoscaling:trigger"
      name = "CPUUtilization"
      value = "Percent"
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
      value = "sg-******"
    },
    {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "IamInstanceProfile"
      value = "aws-role"
    },
    {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "MonitoringInterval"
      value = "1 minute"
    },
    {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "InstanceType"
      value = "t2.medium"
    },
    {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "EC2KeyName"
      value = "****"
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
    },
#####################################
# Other Settings
#####################################
    {
      namespace = "EnvironmentTier"
      name = "Type"
      value = "Standard"
    },
    {
      namespace = "EnvironmentTier"
      name = "Name"
      value = "WebServer"
    },
    {
      namespace = "EnvironmentTier"
      name = "AWSConfigurationTemplateVersion"
      value = "1.1.0.0"
    }
  ]
}
