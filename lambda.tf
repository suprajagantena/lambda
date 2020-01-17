#resource "aws_lambda_function" "test_lambda" {
#function_name = "var.lambda_function_name"
  resource "aws_lambda_function" "test_lambda" {
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = ""
  handler       = "exports.test"
 
  #depends_on    = ["aws_iam_role_policy_attachment.lambda_logs", "aws_cloudwatch_log_group.example"]
}

resource "aws_cloudwatch_log_group" "example" {
  name              = "/aws/lambda/var.lambda_function_name"
  retention_in_days = 14
}


#}

#resource "aws_iam_role_policy_attachment" "lambda_logs" {
#role = "${aws_iam_role.iam_for_lambda.name}"
#policy_arn = "${aws_iam_policy.lambda_logging.arn}"
#}
