######
# EC2 instance
######
resource "aws_instance" "this" {
  ami                    = "${var.ami_id}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${element(var.subnet_id, var.availability_zone == "ap-northeast-1a" ? 0:1)}"
  monitoring             = "${var.monitoring}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  iam_instance_profile   = "${var.iam_instance_profile}"

  ebs_optimized          = "${var.ebs_optimized}"
  root_block_device      = ["${var.root_block_device}"]

  availability_zone      = "${var.availability_zone}"

  volume_tags            = "${merge(var.tags, map("Name", format("%s", var.name)))}"
  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}

resource "aws_eip" "this" {
    count = "${var.enable_eip ? 1 : 0}"
    instance = "${aws_instance.this.id}"
    vpc = true
}

resource "aws_volume_attachment" "this" {
  count = "${length(var.ebs_block_device)}"
  device_name = "${lookup(var.ebs_block_device[count.index], "device_name")}"
  volume_id   = "${aws_ebs_volume.this.*.id[count.index]}"
  instance_id = "${aws_instance.this.id}"
}

resource "aws_ebs_volume" "this" {
  count = "${length(var.ebs_block_device)}"

  availability_zone = "${var.availability_zone}"
  size              = "${lookup(var.ebs_block_device[count.index], "volume_size")}"
  type              = "${lookup(var.ebs_block_device[count.index], "volume_type")}"
  encrypted         = "${lookup(var.ebs_block_device[count.index], "encrypted")}"
}
