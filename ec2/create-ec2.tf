#resource "resource_type" "resource_name"

resource "aws_instance" "web-serverr-1a" {
    ami = "ami-0c15e602d3d6c6c4a"
    vpc_security_group_ids = [aws_security_group.Allow_ssh.id] 
    #it will create a security group first and create a instance by using this sec group
    instance_type = "t3.micro"

    tags = {
        Name = "web-serverr-1a"
    }
}
resource "aws_security_group" "Allow_ssh"{
    name = "Allow_ssh"
    description = "Allow ssh access"
    vpc_id = "vpc-043717386db628d4b"

    #ingres means inbond
    ingress {
        from_port = 0   #here 0 means all ports
        to_port = 0     #here 0 means all ports
        protocol = "-1"     #here -1 means all protocalls
        cidr_blocks = ["0.0.0.0/0"]     # anywhare from ipv4
        ipv6_cidr_blocks = ["::/0"]     # anywhare from ipv6
    }

    #egress means outbond
    egress {

        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    
    tags = {
        Name = "Allow_ssh"
        createdby = "siva"
    }
}

#If you want to create a instance with a existing "security_group" use this code

# resource "aws_instance" "web-server-1a" {
#     ami = "ami-0c15e602d3d6c6c4a"
#     vpc_security_group_ids = ["sg-0ad79a6acdef4fb07"]
#     instance_type = "t3.micro"

#     tags={
#         name = "web-serverr-1a"
#     }
# }