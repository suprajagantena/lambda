data "archive_file" "init" {
  type        = "zip"
  source_file = "${path.module}/init.tpl"
  output_path = "${path.module}/files/init.zip"
}

  resource "aws_lambda_function" "test_lambda" {
  filename      = "lambda.py.zip"
  #s3_bucket = "lambdafunction234"
  #s3_key = "key"
  #s3_object_version = "disabled"
  function_name = "lambda_function_name"
  role          = "aws_iam_role.jenkins.arn"
  handler       = "exports.test"
  source_code_hash = "${filebase64sha256("lambda_function_payload.zip")}"
  runtime = "nodejs8.10"
   environment {
    variables = {
      foo = "bar"
    }
  }
 
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
