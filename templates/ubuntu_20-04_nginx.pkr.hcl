# Build an Ubuntu ami

variable "ami_name" {
  type    = string
  default = "my-custom-ami"
}

variable "AWS_PROFILE" {
  type = string
}

variable "AWS_REGION" {
  type    = string
  default = "us-west-2"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "my_ami" {
  ami_name      = "${var.ami_name}-${local.timestamp}"
  instance_type = "${var.instance_type}"
  region        = "${var.AWS_REGION}"
  profile       = "${var.AWS_PROFILE}"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  sources = ["source.amazon-ebs.my_ami"]

  provisioner "chef-solo" {
    cookbook_paths = ["cookbooks"]
    chef_license   = "accept-no-persist"
    run_list       = ["recipe[packer_build_nginx]"]
  }

  provisioner "inspec" {
    profile = "./test/packer_check_nginx"
  }
}

