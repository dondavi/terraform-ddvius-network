/*
>terraform init


# Add NAT Gateway
>terraform import aws_route_table.defaultroutetable rtb-06dd8e4e1c293d50e
>terraform plan -var-file="prod-env.tfvars" -out prod-network-tmp.tfplan
>terraform apply -auto-approve -var-file="prod-env.tfvars"

# Remove NAT Gateway
>terraform state rm aws_route_table.defaultroutetable
>terraform destroy -auto-approve -var-file="prod-env.tfvars" 
#Move to network directory
apply

*/
region="us-east-2"
credentials="C:\\Users\\username\\.aws\\credentials"
profile="ddvi-us"
# reference resources from network state
vpc_id="vpc-000000"
public_subnet_id="subnet-000000"
private_subnet1_id="subnet-00000001"
private_subnet2_id="subnet-00000002"
private_subnet3_id="subnet-00000003"

app_tag="api.ddvi.us"
owner_tag="DDVIUS"

