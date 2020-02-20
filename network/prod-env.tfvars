/*
>terraform init
>terraform plan -var-file="prod-env.tfvars" -out prod-network.tfplan
>terraform apply -auto-aprove -var-file="prod-env.tfvars"
*/
region="us-east-2"
credentials="C:\\Users\\username\\.aws\\credentials"
profile="ddvi-us"
app_tag="api.ddvi.us"
owner_tag="DDVIUS"

cert_domain="*.ddvi.us"
domain = "ddvi.us"
vpc_cidr = "10.0.0.0/16"

availzone_1 = "us-east-2a"
availzone_2 = "us-east-2b"
availzone_3 = "us-east-2c"

public_subnet1_cidr ="10.0.128.0/19"
public_subnet2_cidr ="10.0.160.0/19"
public_subnet3_cidr ="10.0.192.0/19"

private_subnet1_cidr = "10.0.0.0/19"
private_subnet2_cidr ="10.0.32.0/19"
private_subnet3_cidr ="10.0.64.0/19"


