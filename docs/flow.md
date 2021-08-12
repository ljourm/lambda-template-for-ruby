# プログラムの流れ

1. `/src/main.rb`
    1. `#lambda_handler` が呼び出される。
1. `/src/lib/app/runner.rb`
    1. `Runner.run` が呼び出される。
1. `/src/lib/app/config.rb`
    1. `App::Config.config` が呼び出される
        1. `/src/config/**/*.yml` に記載された設定が読み込まれる。
        1. これは初回読み込み時にキャッシュされ、プログラム終了まで使用される。
1. `/src/app/executor_selector.rb`
    1. `ExecutorSelector.executor` が呼び出され、実行する実装が選択される。
1. `/src/app/executor/*.rb`
    1. `#execute` が呼び出され、メインとなる処理が開始される。
