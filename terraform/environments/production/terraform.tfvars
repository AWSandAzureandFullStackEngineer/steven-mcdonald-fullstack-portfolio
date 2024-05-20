region       = "us-east-1"
project_name = "steven-mcdonald-fullstack-portfolio"
environment  = "production"

vpc_cider                    = "10.0.0.0/16"
public_subnet-az1-cider      = "10.0.1.0/24"
public_subnet-az2-cider      = "10.0.2.0/24"
private-app-subnet-az1-cider = "10.0.3.0/24"
private-app-subnet-az2-cider = "10.0.4.0/24"
private-db-subnet-az1-cider  = "10.0.5.0/24"
private-db-subnet-az2-cider  = "10.0.6.0/24"

#ECS
cluster_name = "steven-mcdonald-fullstack-portfolio-cluster"

# ECS TASK 
family         = "portfolio-family"
cpu_size       = 256
memory_size    = 512
container_name = "backend-container"
image          = "339713093076.dkr.ecr.us-east-1.amazonaws.com/golang:latest"
container_port = 8080

# RDS
engine_version = "16.2"
instance_class = "db.t3.micro"
db_name        = "users"
username       = "engineers25"
password       = "thewordistheword"
