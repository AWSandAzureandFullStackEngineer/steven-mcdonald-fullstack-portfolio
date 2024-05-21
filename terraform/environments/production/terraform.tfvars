region       = "us-west-2"
project_name = "myproject"
environment  = "production"

vpc_cider                    = "10.0.0.0/16"
public_subnet-az1-cider      = "10.0.1.0/24"
public_subnet-az2-cider      = "10.0.2.0/24"
private-app-subnet-az1-cider = "10.0.3.0/24"
private-app-subnet-az2-cider = "10.0.4.0/24"
private-db-subnet-az1-cider  = "10.0.5.0/24"
private-db-subnet-az2-cider  = "10.0.6.0/24"

cluster_name                 = "production-cluster"
service_name                 = "auth-service"
container_name               = "backend-container"
container_port               = 8080
image                        = "339713093076.dkr.ecr.us-east-1.amazonaws.com/golang:latest"

db_name           = "users"
username       = "engineer25"
password       = "thewordistheword"
instance_class = "db.t3.micro"
engine_version = "16.2"


domain_name       = "engineerscentralhub.tech"
alternative_names = "*.engineerscentralhub.tech"
zone_id   = "Z1234567890"

target_type    = "ip"
