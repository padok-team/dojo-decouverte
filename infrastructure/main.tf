# AMI to create public EC2 instance
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

# Add SSH Key for my EC2 Instances
resource "aws_key_pair" "deployer" {
  key_name   = "ec2-key"
  public_key = # To add
}

# Public EC2 instance
resource "aws_instance" "public" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "" # To add

  private_ip                  = "172.16.10.100"
  associate_public_ip_address = # To add
  key_name                    = aws_key_pair.deployer.key_name

  vpc_security_group_ids = [
    aws_security_group.allow_public_ssh.id
  ]
  subnet_id = # To add

  user_data                   = templatefile("./userdata.yaml.tpl", {})
  user_data_replace_on_change = true

  tags = {
    Name = "dojo-decouverte"
  }
}

# Security group
resource "aws_security_group" "allow_public_ssh" {
  name = "ec2-public-ssh"

  vpc_id      = var.vpc_id
  description = "Allows access to SSH Port"

  # Allow all outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "dojo-decouverte"
  }
}
