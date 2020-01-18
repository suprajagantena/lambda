locals {
  lambda_zip_location ="outputs/lambda.zip"
  }
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda.py"
  output_path = "local.lambda_zip_location"
}

  resource "aws_lambda_function" "my_lambda67834521" {
  filename      = "local.lambda_zip_location"
  #s3_bucket = "lambdafunction234"
  #s3_key = "key"
  #s3_object_version = "disabled"
  function_name = "my_lambda67834521"
  role          = "aws_iam_role.jenkins.arn"
  handler       = "lambda.test"
  #source_code_hash = "${filebase64sha256("lambda_function_payload.zip")}"
  runtime = "python3.7"
    
    }
  #depends_on    = ["aws_iam_role_policy_attachment.lambda_logs", "aws_cloudwatch_log_group.example"
resource "aws_cloudwatch_log_group" "example" {
 name              = "/aws/lambda/var.lambda_function_name"
  retention_in_days = 14
}


#}

#resource "aws_iam_role_policy_attachment" "lambda_logs" {
#role = "${aws_iam_role.iam_for_lambda.name}"
#policy_arn = "${aws_iam_policy.lambda_logging.arn}"
#}
