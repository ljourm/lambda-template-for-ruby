# Sample lambda function list

## 概要

Lambdaの関数一覧をログに出力するサンプル。

## IAM role

### `SampleLambdaRunnerRole`

以下を紐付け
- `LogWriteAccessForLambdaFunction`
  - [iam_log_writer](./iam_log_writer.md)
- `LambdaFunctionFunctionWriteAccess`
  - [github_actions_iam_user](../github_actions_iam_user.md)

## IAM policies

none
