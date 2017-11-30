output "security_group_id_prd"   { value = "${aws_security_group.prd.id}" }
output "security_group_id_stg"   { value = "${aws_security_group.stg.id}" }
output "security_group_id_other"   { value = "${aws_security_group.other.id}" }
