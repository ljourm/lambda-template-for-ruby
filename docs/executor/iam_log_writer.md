# IAM Log writer

- Lambdaの関数で使用するロールに必ず付与するポリシー。
- CloudWatchへの書き込み権限を持つ。

## IAM policies

### `LogWriteAccessForLambdaFunction`
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:{region}:{account-id}:log-group:/aws/lambda-template-for-ruby:*"
            ]
        }
    ]
}
```
