#key pair

resource "aws_key_pair" "my_key" {
    key_name = "${var.key_pair_name}"
    public_key = file("./keys/terraform-ec2.pub")
    # public_key = "../keys/"

    tags = {
        Environment = var.env
    }
}

#default vpc

resource "aws_default_vpc" "default" {
  
}

# #security group
resource "aws_security_group" "ec2_SG" {
    name        = "${var.securiy_group_name}"
    description = "Allow TLS inbound traffic and all outbound traffic"
    vpc_id      = aws_default_vpc.default.id #interpolation

    tags = {
        Name = "${var.env}-infra-app-sg"
        Environment = var.env
    }

    #inbound rules
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH Open"
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Http Open"
    }

    #outbound rules

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "All access open outbound"
    }
}

# #ec2
resource "aws_instance" "my_instance" {
    count = var.instance_count
    
    depends_on = [ aws_security_group.ec2_SG, aws_key_pair.my_key ]
    key_name = aws_key_pair.my_key.key_name
    security_groups = [ aws_security_group.ec2_SG.name ]
    instance_type = var.instance_type
    ami = var.instance_ami_id
    
    root_block_device {
      volume_size = var.env == "dev" ? 10 : 20 
      volume_type = "gp2"
    }

    tags = {
        Name = "${var.env}-infra-app-instance"
        Environment = var.env
    }
}




