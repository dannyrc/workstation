data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [module.vpc.vpc_id]
  }
  tags = {
    Tier = "Public"
  }
  depends_on = [module.vpc]
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [module.vpc.vpc_id]
  }
  tags = {
    Tier = "Private"
  }
  depends_on = [module.vpc]
}