# Lambda template for ruby

AWS Lambda + Ruby を使用する際のテンプレート。

- GitHub ActionsによるLambdaへのデプロイ
- GitHub ActionsによるCI実行
- 各種テスト
  - rspec
  - rubocop
  - simplecov
- 環境変数 `APP_ENV` による環境の切り替え
  - production
  - staging
  - development
  - test
- Docker Composeによるローカル環境

## 環境

- AWS Lambda
- Ruby 2.7.4

## 使用方法

### Dockerの起動とアタッチ
```sh
$ docker-compose up
$ docker-compose exec app bash
```

### RSpecの実行
```sh
# 事前にDocker内に入っておく
$ bundle exec rspec

# 実行後、/src/coverageにカバレッジが出力される
```

### RuboCopの実行
```sh
# 事前にDocker内に入っておく
$ bundle exec rubocop
```

## 実装方針

- `/src/implements/*` に実装していく。
    - 必要に応じて `/src/config/*` に設定を記述する。
    - `/src/runner/*` や `/src/main.rb` は基本的に修正しない。
- `/src/spec/implements/*` にテストを記述する。

参考: [docs/flow](docs/flow)

## AWS IAM

### 必要な権限
- `LambdaCodeWriter`
    - ユーザー
    - Lambda自体を登録/更新する権限を持つ。
    - GitHub Actionsによるデプロイで使用する。
- `LambdaRunnerRole`
    - ロール
    - Lambdaを実行する権限を持つ。
    - Lambdaの関数に登録する。
    - 必要に応じてproduction用とstaging用を作成する。

参考: [docs/aws_iam](docs/aws_iam)

## デプロイ方法

1. GitHubのSecretsに登録する。
    - `AWS_ACCESS_KEY_ID `
        - `LambdaCodeWriter` のAccessKeyID
    - `AWS_SECRET_ACCESS_KEY`
        - `LambdaCodeWriter` のSecretAccessKey
    - `PRODUCTION_AWS_LAMBDA_ROLE_ARN`
        - `LambdaRunnerRole` のARN
    - `STAGING_AWS_LAMBDA_ROLE_ARN`
        - `LambdaRunnerRole` のARN
1. ブランチを変更(pushまたはPRをmerge)し、GitHub Actionsを発火する。
    - `master` ブランチが変更されるとproductionへのデプロイが発火
    - `develop` ブランチが変更されるとstagingへのデプロイが発火
