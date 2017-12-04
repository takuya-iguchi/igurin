######
# EC2 instance
######
resource "aws_instance" "this" {
  count = "${length(var.name)}"
  ami                    = "${data.aws_ami.amazon_linux.id}"
  instance_type          = "${var.instance_type[count.index]}"
  subnet_id              = "${var.subnet_id[count.index]}"
  key_name               = "${var.key_name}"
  monitoring             = "${var.monitoring}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  iam_instance_profile   = "${var.iam_instance_profile}"

  private_ip                  = "${var.private_ip[count.index]}"

  ebs_optimized          = "${var.ebs_optimized}"
  root_block_device      = "${var.root_block_device}"
  ebs_block_device       = "${var.ebs_block_device}"

  availability_zone      = "${var.availability_zone[count.index]}"

  volume_tags            = "${merge(var.tags, map("Name", format("%s", var.name[count.index])))}"
  tags = "${merge(var.tags, map("Name", format("%s", var.name[count.index])))}"
}

resource "aws_eip" "this" {
    count = "${length(var.name)}"
    instance = "${element(aws_instance.this.*.id, count.index)}"
    vpc = true
}
