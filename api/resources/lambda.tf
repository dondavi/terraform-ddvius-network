resource "aws_lambda_function" "lambda_tf_api2" {
  filename      =  "${var.function_path}${var.function_name}.zip"
  function_name =   "${var.function_name}"
  role          = "${aws_iam_role.iam_for_lambda.arn}"
  #filename = lambda
  #function_name = lambda_handler  
  handler       =  "${var.function_handler}"
  runtime       = "dotnetcore2.1"
  timeout = 10
  memory_size = 128
  publish = false
  //vpc_config =  private subnets in a virtual private cloud (VPC) 
  //subnet_ids = 
  //security_group_ids =
  // variables =

tracing_config {
    mode = "Active" // "PassThrough" 
  }
environment {
    variables = {
      Secret1 = "XXXXXX"
    }
  }

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda.zip"))}"
  source_code_hash = "${filebase64sha256("${var.function_name}.zip")}"
  depends_on = ["aws_iam_role.iam_for_lambda"]
}


resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
       "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}


resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/${aws_lambda_function.lambda_tf_api2.function_name}"
  retention_in_days = 14
  depends_on = ["aws_lambda_function.lambda_tf_api2"]
}

resource "aws_iam_policy" "lambda_logging" {
  name = "lambda_logging"
  path = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    },
    {
      "Action": [
        "xray:PutTraceSegments",
        "xray:PutTelemetryRecords"
      ],
      "Resource": "*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role = "${aws_iam_role.iam_for_lambda.name}"
  policy_arn = "${aws_iam_policy.lambda_logging.arn}"
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.lambda_tf_api2.arn}"
  principal     = "apigateway.amazonaws.com"

  # The /*/*/* part allows invocation from any stage, method and resource path
  # within API Gateway REST API.
  source_arn = "${aws_api_gateway_rest_api.rest_api.execution_arn}/*/*/*"
  depends_on = ["aws_lambda_function.lambda_tf_api2","aws_api_gateway_rest_api.rest_api"]
}

