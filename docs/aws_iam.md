# AWS IAM

最低限必要なIAM設定を記載します。

- ユーザ名/ロール名/ポリシー名は便宜上命名しました。
- `Resource` は環境毎に異なるため `*` (ワイルドカード) としました。
- それぞれ適宜変更してください。

## IAM policies

### `LambdaFunctionCodeWriteAccess`


```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "lambda:ListFunctions",
                "lambda:CreateFunction",
                "lambda:UpdateFunctionCode",
                "lambda:UpdateFunctionConfiguration",
                "iam:PassRole"
            ],
            "Resource": "*"
        }
    ]
}
```

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
                "*:log-group:/aws/lambda/lambda-template-for-ruby:*"
            ]
        }
    ]
}
```

## IAM roles
### `LambdaRunnerRole`
以下を紐付け
- `LambdaFunctionWriteAccess`

## IAM users

### `LambdaCodeWriter`
以下を紐付け
- `LambdaFunctionCodeWriteAccess`
