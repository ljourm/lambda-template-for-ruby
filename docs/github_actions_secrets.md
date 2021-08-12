# GitHub Actions secrets

## Lambda Writer

GitHub ActionsでLambdaに関数を登録する際に使用される。

- `AWS_ACCESS_KEY_ID `
  - `LambdaCodeWriter` のAccessKeyID
- `AWS_SECRET_ACCESS_KEY`
  - `LambdaCodeWriter` のSecretAccessKey

## Lambda Role ARN

Lambdaの各関数で使用される。

- `AWS_LAMBDA_ROLE_ARN_PRODUCTION`
  - `LambdaRunnerRole` のARN
- `AWS_LAMBDA_ROLE_ARN_STAGING`
  - `LambdaRunnerRole` のARN
