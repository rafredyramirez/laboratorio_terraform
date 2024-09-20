####### tfstate #######
terraform {
  backend "s3" {
    bucket  = "terraform-laboratorio-udm"
    key     = "terraform-laboratorio/terraform.tfstate"
    region  = "us-east-1"
  }
}

####### Modulo Dev #######
module "nginx_server_dev"{
    source = "./nginx_server_module"
    
    ami_id          = "ami-0440d3b780d96b29d"
    instance_type   = "t3.micro"
    server_name     = "nginx-server-dev"
    environment     = "dev"
}

####### Modulo QA #######
module "nginx_server_qa"{
    source = "./nginx_server_module"
    
    ami_id          = "ami-0440d3b780d96b29d"
    instance_type   = "t2.micro"
    server_name     = "nginx-server-qa"
    environment     = "qa"
}

#######  output Dev ####### 
output "nginx_dev_ip" {
  description = "Dirección IP pública de la instancia EC2"
  value       = module.nginx_server_dev.server_public_ip
}

output "ngnix_dev_dns" {
  description = "DNS público de la instancia EC2"
  value       = module.nginx_server_dev.server_public_dns
}

#######  output QA ####### 
output "nginx_qa_ip" {
  description = "Dirección IP pública de la instancia EC2"
  value       = module.nginx_server_qa.server_public_ip
}

output "ngnix_qa_dns" {
  description = "DNS público de la instancia EC2"
  value       = module.nginx_server_qa.server_public_dns
}