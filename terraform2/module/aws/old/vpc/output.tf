output "vpc_id"   { value = "${aws_vpc.mod.id}" }
output "vpc_cidr" { value = "${aws_vpc.mod.cidr_block}" }

output "db_subnet_id_prd"   { value = "${aws_db_subnet_group.database_prd.id}" }
output "db_subnet_id_stg"   { value = "${aws_db_subnet_group.database_stg.id}" }

output "private_subnet_id_prd"   { value = "${aws_subnet.private_prd.id}" }
output "private_subnet_id_stg"   { value = "${aws_subnet.private_stg.id}" }
output "private_subnet_id_other"   { value = "${aws_subnet.private_other.id}" }

output "public_subnet_id_prd"   { value = "${aws_subnet.public_prd.id}" }
output "public_subnet_id_stg"   { value = "${aws_subnet.public_prd.id}" }
output "public_subnet_id_other"   { value = "${aws_subnet.public_prd.id}" }
