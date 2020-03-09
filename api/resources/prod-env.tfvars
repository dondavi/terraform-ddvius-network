/*
>terraform init
>terraform plan -var-file="prod-env.tfvars" -out prod-api.tfplan
>terraform apply --auto-approve --var-file="prod-env.tfvars" 
*/
region="us-east-2"
availability_zone="us-east-2a"
credentials="C:\\Users\\username\\.aws\\credentials"
profile="ddvi-us"

function_name=  "TimeService"
function_handler= "TimeService::TimeService.Functions::Get"
function_path= "C:\\Users\\username\\source\\repos\\TimeService\\TimeService\\bin\\Release\\netcoreapp2.1\\"
//function_name=  "TimeServiceX"
//function_handler= "TimeServiceX::TimeServiceX.Function::FunctionHandler"
//function_path= "C:\\Users\\username\\source\\repos\\TimeServiceX\\TimeServiceX\\bin\\Release\\netcoreapp2.1\\"

stage_name= "prod"
service_name= "time-service"
vpc_id = "vpc-00000000"
zone_id ="ZXXXXXXXXXXXXX"
cert_arn="	arn:aws:acm:us-east-2:XXXXXXXXXXXX:certificate/XXXXX-XXX-XXX-XXX-XXXXXXXXXXXXX"
app_tag="api2.ddvi.us"
owner_tag="ddvi.us"
