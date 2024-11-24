# アプリのライフサイクル

アプリケーションのライフサイクルイベント（フォアグラウンドやバックグラウンドへの移行など）に応答し、特定の処理を実行する方法を学びます。

アプリのライフサイクルとは、アプリ起動から終了までのプロセス全体を意味する言葉です。  
例えば、アプリがバックグラウンドからフォアグラウンドへ移行する際に、最新のデータを更新し、アプリの UI をリフレッシュしたい場合を考えてみます。

この場合、ライフサイクルにおいて**バックグラウンドからフォアグラウンドへ復帰する**際に呼ばれるメソッド、

```swift
func applicationDidBecomeActive(_ application: UIApplication)
```

を実装し、フォアグラウンドへ復帰した際にデータの更新を行う処理を実装することで実現できます。

下記のリファレンスを確認し、アプリのライフサイクルとそれぞれの遷移時に呼ばれるメソッドを確認しましょう。

・[ライフサイクルを管理する](https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle#3200035)

UIKit、SwiftUI のリファレンスをまとめています。それぞれの項を確認してみてください。

## UIKit のライフサイクル

Xcode16.1 以降、minimumDeploymentTarget(ビルドできる下限 OS)が iOS13~となる為、`AppDelegate`から`SceneDelegate`への移行が進んでいくことが予想されます。  
しかし、UIKit を用いたプロジェクトでは、アプリの最適化や移行が進んでいないケースも考えられます。  
また、より細かい粒度でライフサイクルイベントを監視したい場合、UIApplicationDelegate を用いるケースもあるでしょう。  
まずは、各コールバック関数で`print`を実装し、シュミレーターで動作とログを確認してください。

◾ 課題

AppDelegate.swift でライフサイクルイベントの何れかを実装し、動作を確認してください。　　
(ex.フォアグラウンド → バックグラウンド)

・[UIApplicationDelegate リファレンス](https://developer.apple.com/documentation/uikit/uiapplicationdelegate)

SceneDelegate.swift でライフサイクルイベントの何れかを実装し、動作を確認してください。

・[UISceneDelegate リファレンス](https://developer.apple.com/documentation/uikit/uiscenedelegate)

## SwiftUI のライフサイクル

・[SwiftUI のライフサイクルを監視する](https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle)

SwiftUI は scene ベースであり、appDelegate でライフサイクルイベントを監視することはできません。  
SceneDelegate を用いることもできますが、ここでは`ScenePhase`でライフサイクルイベントを監視してみましょう。

`print`を実装し、シュミレーターで動作とログを確認してください。

◾️ 課題

App.swift でライフサイクルイベントの何れかを実装し、動作を確認してください。

・[ScenePhase プロパティ](https://developer.apple.com/documentation/swiftui/environmentvalues/scenephase)  
・[ScenePhase](https://developer.apple.com/documentation/swiftui/scenephase)
