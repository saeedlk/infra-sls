variable "region" {
  type    = string
  default = "ap-south-1"
}

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }


source "amazon-ebs" "ec2-instance" {
  ami_name      = "test-packer-terra-sls-${local.timestamp}"
  instance_type = "t2.micro"
  region        = var.region
  
  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-2.0.*-x86_64-ebs"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["amazon"]
  }
  ssh_username = "ec2-user"
}


build {
  sources = ["source.amazon-ebs.ec2-instance"]

//   provisioner "file" {
//     source      = "./tf_ssh.pub"
//     destination = "/tmp/tf_ssh.pub"
//   }
//   provisioner "shell" {
//     script = "./scripts/setup.sh"
//   }
}

// output "ami_id" {
//   value = source.amazon-ebs.ec2-instance.ami_id
// }