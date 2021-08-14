# GitHub Actions AWS user

- GitHub Actionsによるデプロイで使用する。
- Lambda自体を登録/更新する権限を持つ。

## IAM policies

### `LambdaFunctionFunctionWriteAccess`

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

## IAM user

### `LambdaFunctionWriter`
以下を紐付け
- `LambdaFunctionFunctionWriteAccess`
