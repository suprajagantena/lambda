resource "aws_lb" "my_loadbalancer" {
  name               = "my-loadbalancer-tf"
  internal           = false
  load_balancer_type = "network"
  subnets            = ["subnet-0c29fb2e17e09b02b"]

  enable_deletion_protection = true

  tags = {
    Environment = "dev"
  }
}
