output "vpc_id"               { value = "${aws_vpc.mod.id}" }
output "public_route_table"   { value = "${aws_route_table.public.*.id}" }
output "private_route_table"  { value = "${aws_route_table.private.*.id}" }

output "public_subnets"       { value = "${aws_subnet.public.*.id}" }
output "private_subnets"      { value = "${aws_subnet.private.*.id}" }
