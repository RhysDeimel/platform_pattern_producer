module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = var.name

  instance_type          = var.instance_type
  monitoring             = true
  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}