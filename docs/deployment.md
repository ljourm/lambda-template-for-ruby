# デプロイ方法

1. AWS IAMを準備する
    1. GitHub Actionsのデプロイで使用するユーザを作成する。
        - [aws_iam/lambda_code_writer.md](./aws_iam/lambda_code_writer.md)
    1. 関数で使用するロールを作成する。
1. GitHubのSecretsに登録する。
    - [GitHub Actions secrets](./github_actions_secrets.md)
1. ブランチを変更(pushまたはPRをmerge)し、GitHub Actionsを発火する。
    - `master` ブランチが変更されるとproductionへのデプロイが発火
    - `develop` ブランチが変更されるとstagingへのデプロイが発火
