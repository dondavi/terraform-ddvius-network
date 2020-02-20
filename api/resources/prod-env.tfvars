/*
>terraform init
>terraform plan -var-file="prod-env.tfvars" -out prod-api.tfplan
>terraform apply apply -auto-approve --var-file="prod-env.tfvars" 
*/
region="us-east-2"
availability_zone="us-east-2a"
credentials="C:\\Users\\e1208991\\.aws\\credentials"
profile="ddvi-us"

function_name=  "TimeService"
function_handler= "TimeService::TimeService.Functions::Get"
function_path= "C:\\Users\\e1208991\\source\\repos\\TimeService\\TimeService\\bin\\Release\\netcoreapp2.1\\"
//function_name=  "TimeServiceX"
//function_handler= "TimeServiceX::TimeServiceX.Function::FunctionHandler"
//function_path= "C:\\Users\\e1208991\\source\\repos\\TimeServiceX\\TimeServiceX\\bin\\Release\\netcoreapp2.1\\"

stage_name= "prod"
service_name= "time-service"
vpc_id = "vpc-05e843ccd55c7bb2e"
zone_id ="Z1KR7OA719ESMN"
cert_arn="arn:aws:acm:us-east-2:443311837601:certificate/0dcec993-e90e-443c-92e1-8bc2e6787b4a"
app_tag="api2.ddvi.us"
owner_tag="ddvi.us"