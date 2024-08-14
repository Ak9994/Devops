provider "aws"{
    region = "ap-south-1"
}

data "aws_vpc" "selected"{
    filter{
        name = "tag:name"
        values = ["project-vpc"]
    }
}

data "aws_subnets" "selected"{
    filter{
        name = "vpc-id"
        value = ["data.aws_vpc.selected.id"]
    }
}

data "aws_ami" "amazon_linux_2"{

    filter{
        name = "name"
        values = ["amzn2-ami-hvn-*-x86_64-gp2]
    }

    filter{
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["amazon"]
}

resource "aws_instance" "example"{
    ami = data.aws_ami.amazon_linux_2.id
    instance_type = "t2.micro"
    Subnet_ID = tolist(data.aws_subnets.selected.id)[0]
}


