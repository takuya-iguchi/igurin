output "public_subnets"   { value = "${aws_subnet.public.*.id}" }
output "private_subnets"   { value = "${aws_subnet.private.*.id}" }

output "db_subnet_id"   { value = "${aws_db_subnet_group.database.0.id}" }
output "elasticache_subnet_id"   { value = "${aws_elasticache_subnet_group.elasticache.id}" }
