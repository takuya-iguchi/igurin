######
# EC2 instance
######
resource "aws_instance" "this" {
  count = "${var.count}"

  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  user_data              = "${var.user_data}"
  subnet_id              = "${var.subnet_id}"
  key_name               = "${var.key_name}"
  monitoring             = "${var.monitoring}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  iam_instance_profile   = "${var.iam_instance_profile}"

  associate_public_ip_address = "${var.associate_public_ip_address}"
  private_ip                  = "${var.private_ip}"

  ebs_optimized          = "${var.ebs_optimized}"
  volume_tags            = "${var.volume_tags}"
  root_block_device      = "${var.root_block_device}"
  ebs_block_device       = "${var.ebs_block_device}"
  ephemeral_block_device = "${var.ephemeral_block_device}"

  source_dest_check                    = "${var.source_dest_check}"
  disable_api_termination              = "${var.disable_api_termination}"
  instance_initiated_shutdown_behavior = "${var.instance_initiated_shutdown_behavior}"
  availability_zone                    = "${var.availability_zone}"
  placement_group                      = "${var.placement_group}"
  tenancy                              = "${var.tenancy}"

  # Note: network_interface can't be specified together with associate_public_ip_address
  # network_interface = "${var.network_interface}"

  tags = "${merge(var.tags, map("Name", format("%s-%d", var.name, count.index+1)))}"
}
