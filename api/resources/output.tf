
output "lambdafunction-details" {
  value = "${aws_lambda_function.lambda_tf_api2}"
}

output "deployment-url" {
  value = "${aws_api_gateway_deployment.timeservice.invoke_url}"
}

