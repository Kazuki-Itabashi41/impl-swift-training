# アプリのライフサイクル

アプリケーションのライフサイクルイベント（フォアグラウンドやバックグラウンドへの移行など）に応答し、特定の処理を実行する方法を学びます。
UIKit、SwiftUI のリファレンスをまとめています。それぞれの項を確認してみてください。

## UIKit のライフサイクル

・[ライフサイクルを管理する](https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle#3200035)

Xcode16.1 以降、minimumDeploymentTarget(ビルドできる下限 OS)が iOS13~となる為、`AppDelegate`から`SceneDelegate`への移行が進んでいくことが予想されます。
しかし、UIKit を用いたプロジェクトでは、アプリの最適化や移行が進んでいないケースも考えられます。
また、より細かい粒度でライフサイクルイベントを監視したい場合、UIApplicationDelegate を用いるケースもあるでしょう。
まずは、各コールバック関数で`print`を実装し、シュミレーターで動作とログを確認してください。

◾️ 課題
AppDelegate.swift でライフサイクルイベントの何れかを実装し、動作を確認してください。
(ex.フォアグラウンド → バックグラウンド)
・[UIApplicationDelegate](https://developer.apple.com/documentation/uikit/uiapplicationdelegate)

SceneDelegate.swift でライフサイクルイベントの何れかを実装し、動作を確認してください。
・[UISceneDelegate](https://developer.apple.com/documentation/uikit/uiscenedelegate)

## SwiftUI のライフサイクル

・[SwiftUI のライフサイクルを監視する](https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle)

SwiftUI は scene ベースであり、appDelegate でライフサイクルイベントを監視することはできません。
SceneDelegate を用いることもできますが、ここでは`ScenePhase`でライフサイクルイベントを監視してみましょう。
`print`を実装し、シュミレーターで動作とログを確認してください。

◾️ 課題
App.swift でライフサイクルイベントの何れかを実装し、動作を確認してください。

・[ScenePhase プロパティ](https://developer.apple.com/documentation/swiftui/environmentvalues/scenephase)
・[ScenePhase](https://developer.apple.com/documentation/swiftui/scenephase)
