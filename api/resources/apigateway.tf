resource "aws_api_gateway_rest_api" "rest_api" {
  name = "${var.service_name}"
}

#create a resource with name 'resource' in the gateway api , many resources can be created like this
resource "aws_api_gateway_resource" "api" {
  path_part   =  "${var.service_name}"
  parent_id   = "${aws_api_gateway_rest_api.rest_api.root_resource_id}"
  rest_api_id = "${aws_api_gateway_rest_api.rest_api.id}"
  
  depends_on = ["aws_api_gateway_rest_api.rest_api"]
}

resource "aws_api_gateway_method" "method" {
  rest_api_id   = "${aws_api_gateway_rest_api.rest_api.id}"
  resource_id   = "${aws_api_gateway_resource.api.id}"
  http_method   = "GET"
  authorization = "NONE"
  depends_on = ["aws_api_gateway_rest_api.rest_api","aws_api_gateway_resource.api"]
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = "${aws_api_gateway_rest_api.rest_api.id}"
  resource_id             = "${aws_api_gateway_resource.api.id}"
  http_method             = "${aws_api_gateway_method.method.http_method}"
  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = "${aws_lambda_function.lambda_tf_api2.invoke_arn}"
  depends_on = ["aws_api_gateway_rest_api.rest_api","aws_api_gateway_resource.api",
                "aws_api_gateway_method.method"]
  }


resource "aws_api_gateway_method_response" "response_200" {
  rest_api_id = "${aws_api_gateway_rest_api.rest_api.id}"
  resource_id = "${aws_api_gateway_resource.api.id}"
  http_method = "${aws_api_gateway_method.method.http_method}"
  status_code = "200"
  
  response_models = {
         "application/json" = "Empty"
    }
  depends_on = ["aws_api_gateway_resource.api","aws_api_gateway_rest_api.rest_api",
                "aws_api_gateway_method.method"]
}


resource "aws_api_gateway_integration_response" "IntegrationResponse" {
  rest_api_id = "${aws_api_gateway_rest_api.rest_api.id}"
  resource_id = "${aws_api_gateway_resource.api.id}"
  http_method = "${aws_api_gateway_method.method.http_method}"
  status_code = "${aws_api_gateway_method_response.response_200.status_code}"
   
  depends_on = ["aws_api_gateway_resource.api","aws_api_gateway_rest_api.rest_api",
                 "aws_api_gateway_method_response.response_200","aws_api_gateway_method.method",
                 "aws_api_gateway_integration.integration"]
}

resource "aws_api_gateway_deployment" "api_deployment" {
  
  rest_api_id = "${aws_api_gateway_rest_api.rest_api.id}"
  stage_name  = "${var.stage_name}"

  depends_on = ["aws_api_gateway_integration.integration"]
}



resource "aws_api_gateway_account" "api_account" {
  cloudwatch_role_arn = "${aws_iam_role.cloudwatch.arn}"
}

resource "aws_iam_role" "cloudwatch" {
  name = "api_gateway_cloudwatch_global"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "apigateway.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "cloudwatch" {
  name = "default"
  role = "${aws_iam_role.cloudwatch.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:DescribeLogGroups",
                "logs:DescribeLogStreams",
                "logs:PutLogEvents",
                "logs:GetLogEvents",
                "logs:FilterLogEvents"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_api_gateway_stage" "api_stage" {
  stage_name="${var.stage_name}"
  rest_api_id="${aws_api_gateway_rest_api.rest_api.id}"
  deployment_id = "${aws_api_gateway_deployment.api_deployment.id}"
  xray_tracing_enabled=true

}

resource "aws_api_gateway_method_settings" "method_settings" {
  rest_api_id = "${aws_api_gateway_rest_api.rest_api.id}"
  stage_name  = "${var.stage_name}"
  method_path = "${aws_api_gateway_resource.api.path}/${aws_api_gateway_method.method.http_method}"
  
  settings {
    metrics_enabled = true
    logging_level   = "INFO"  //OFF, ERROR, and INFO.
   

  }
}
/*
data "aws_api_gateway_vpc_link" "my_api_gateway_vpc_link" {
  name = "${var.vpc_id}"
}
*/
