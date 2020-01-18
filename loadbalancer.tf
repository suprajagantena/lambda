resource "aws_lb" "my_loadbalancer" {
  name               = "my_loadbalancer_tf"
  internal           = false
  load_balancer_type = "network"
  subnets            = ""

  enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}
