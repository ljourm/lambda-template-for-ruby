# プログラムの流れ

1. `/src/main.rb`
    1. `#lambda_handler` が呼び出される。
1. `/src/runner/base.rb`
    1. `Runner.run` が呼び出される。
    1. `Runner.config` が呼び出される。
        1. `/src/config/**/*.yml` に記載された設定が読み込まれる。
1. `/src/implements/executor.rb`
    1. `Executor#execute` が呼び出され、メインとなる処理が開始される。
