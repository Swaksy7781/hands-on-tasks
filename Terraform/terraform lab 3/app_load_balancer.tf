#creating application load balancer
resource "aws_lb" "alb" {
  name               = "saurabh-first-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.load_balancer_security_group.id]
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]

  tags = { Name = "${var.project_name}_ALB" }
}

#creating target group for EC2 instances
resource "aws_lb_target_group" "EC2_tg" {
  name     = "saurabh-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.creating_VPC.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

#creating listener to check incoming traffic to application's backend
resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.EC2_tg.arn
  }
}

#creating target group attachments for servers
resource "aws_lb_target_group_attachment" "web1" {
  target_group_arn = aws_lb_target_group.EC2_tg.arn
  target_id        = aws_instance.web_server_1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "web2" {
  target_group_arn = aws_lb_target_group.EC2_tg.arn
  target_id        = aws_instance.web_server_2.id
  port             = 80
}