resource "aws_launch_configuration" "prod-launchconfig" {
    name_prefix     = "prod-lunchconfig"
    image_id        = "ami-0f1cdafc14e3013c4"
    instance_type   = "t2.micro"
    key_name        = "abso"
    security_groups = ["${aws_security_group.prod-SG.id}"]
}

resource "aws_autoscaling_group" "prod-autoscaling" {
    name                 = "prod-autoscaling"
    vpc_zone_identifier  = ["${aws_subnet.prod-subnet-public-1.id}"]
    launch_configuration = aws_launch_configuration.prod-launchconfig.name
    min_size             = 1
    max_size             = 2
    health_check_grace_period = 300
    health_check_type         = "ELB"
    force_delete              = true

    tag {
      key = "Name"
      value = "prodASG-Image"
      propagate_at_launch = true  

    }
  
}

