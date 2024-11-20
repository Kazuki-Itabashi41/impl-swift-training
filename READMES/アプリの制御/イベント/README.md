# イベントを監視する

特定の画面から、別の画面にイベントを通知し、特定の処理を実行したい場合を考えてみます。
例えば、アプリ内の特定コンテンツをお気に入り登録した際、「お気に入り登録を行なった」というイベントを、複数の画面に通知し、それぞれの画面で「お気に入り登録を行なった」ことに対応して画面の UI を更新する必要があるとします。
swift では、上記の様なイベントを監視する(Observer パターンを実現する)ための仕組みとして、NotificationCenter があります。

・[Notifications](https://developer.apple.com/documentation/foundation/notifications)

## NotificationCenter

NotificationCenter を実装することで、特定の画面から(Sender)別の画面へ(Observer)イベントを通知することができます。
また、Observer は単一である必要はなく、一度に複数の画面にイベントを通知することができます。
NotificationCenter は Sender と Observer の仲介役として機能します。
Sender と Observer は互いに知る必要がありません。

また、予め用意されている Notification も存在します。
UIApplicationDelegate が NotificationCenter を経由して提供するイベントはいくつもあります。
※ NSNotification.Name を探してみましょう

◾️ 課題
Observer パターンを用いて、イベントを監視してください。
(画面 A で実装した処理を addObserver し、画面 B で post してみましょう。)
・[Observers の追加と削除](https://developer.apple.com/documentation/foundation/notificationcenter#1653684)
・[イベントの通知](https://developer.apple.com/documentation/foundation/notificationcenter#1653740)
