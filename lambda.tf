resource "aws_lambda_function" "test_lambda" {
  function_name = "${var.lambda_function_name}"
 
  depends_on    = ["aws_iam_role_policy_attachment.lambda_logs", "aws_cloudwatch_log_group.example"]
}

resource "aws_cloudwatch_log_group" "example" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = 14
}

resource "aws_iam_policy" "lambda_logging" {
  name = "lambda_logging"
  path = "/"
  description = "IAM policy for logging from a lambda"

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
}

#resource "aws_iam_role_policy_attachment" "lambda_logs" {
#role = "${aws_iam_role.iam_for_lambda.name}"
#policy_arn = "${aws_iam_policy.lambda_logging.arn}"
#}
