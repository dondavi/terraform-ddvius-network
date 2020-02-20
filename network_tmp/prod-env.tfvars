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
vpc_id="vpc-0da26bcdcb7c7ee64"
public_subnet_id="subnet-038905d3806cf67f9"
private_subnet1_id="subnet-0c173cbcbfbc5cbcc"
private_subnet2_id="subnet-0364b305b8cabf04d"
private_subnet3_id="subnet-071eae8c00d3769f6"

app_tag="api.ddvi.us"
owner_tag="DDVIUS"

