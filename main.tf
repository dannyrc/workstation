module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.vpc_name
  cidr = "10.0.0.0/23"
  azs  = [element(data.aws_availability_zones.available.names, 0)]

  public_subnets     = ["10.0.0.0/28"]
  private_subnets    = ["10.0.1.0/28"]
  enable_nat_gateway = true
  enable_vpn_gateway = false

  public_subnet_tags  = { "Tier" = "Public" }
  private_subnet_tags = { "Tier" = "Private" }
}

module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name          = local.instance_name
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = var.instance_type

  iam_instance_profile = aws_iam_instance_profile.instance_profile.name

  subnet_id = element(data.aws_subnets.private.ids, 0)
  user_data = file("env/setup.sh")
}
