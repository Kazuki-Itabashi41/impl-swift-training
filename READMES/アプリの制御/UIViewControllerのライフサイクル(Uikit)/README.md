# UIViewController のライフサイクル

UIViewController のライフサイクルイベント（View を表示する前の処理や View を表示した後の処理）に応答し、特定の処理を実行する方法を学びます。
公式のリファレンスをまとめています。各コールバック関数で`print`を実装し、シュミレーターで動作とログを確認してください。

◾️ 課題
画面 A にボタンを配置し、画面 B に遷移する処理を実装してください。
その後、画面 A、B それぞれにライフサイクルイベントの何れかを実装し、動作を確認してください。
(ex.`viewDidLoad()`と`viewWillAppear()`が実行されるタイミングを確認する)

・[view の通知を処理する](https://developer.apple.com/documentation/uikit/uiviewcontroller#1652793)
・[view イベントに応答する](https://developer.apple.com/documentation/uikit/uiviewcontroller#1653519)
