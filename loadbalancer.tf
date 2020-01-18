resource "aws_lb" "my_loadbalancer" {
  name               = "my_loadbalancer_tf"
  internal           = false
  load_balancer_type = "network"
  subnets            = "aws_subnet.public.subnet-0c29fb2e17e09b02b"

  enable_deletion_protection = true

  tags = {
    Environment = "dev"
  }
}
