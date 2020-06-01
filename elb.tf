resource "aws_alb" "prod-elb" {
    name                = "prod-elb"
    security_groups     = ["${aws_security_group.prod-SG.id}"]
    subnets             = ["${aws_subnet.prod-subnet-public-1.id}", "${aws_subnet.prod-subnet-public-2.id}"]

    tags = {
      Name = "prod-elb"
    }
}

resource "aws_alb_target_group" "prod-target-group" {
    name                = "prod-target-group"
    port                = "80"
    protocol            = "HTTP"
    vpc_id              = "${aws_vpc.prod-vpc.id}"

    health_check {
        healthy_threshold   = "5"
        unhealthy_threshold = "2"
        interval            = "30"
        matcher             = "200"
        path                = "/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = "5"
    }

    tags = {
      Name = "prod-target-group"
    }
}

resource "aws_alb_listener" "prod-alb-listener" {
    load_balancer_arn = "${aws_alb.prod-elb.arn}"
    port              = "80"
    protocol          = "HTTP"

    default_action {
        target_group_arn = "${aws_alb_target_group.prod-target-group.arn}"
        type             = "forward"
    }
}