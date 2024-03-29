# Remove the duplicate resource declarations from ssh_key.tf

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "ssh_key_pair" {
  key_name   = "my_ssh_key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "local_file" "tf-key" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = "${path.module}/terraform_ssh_key.pem"
}
