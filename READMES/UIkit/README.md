# UIKit

## はじめに

UIKit は ObjC ベースのフレームワークで、UI を構築することができます。

・・・もしあなたが iOS アプリに興味があり、業務とは関係なくこの文章を読んでいるのであれば、
**この章は読み飛ばし SwiftUI を学習することをオススメします。**

2019 年に SwiftUI がリリースされて以降、ios アプリのトレンドは SwiftUI になっていると考えて良いでしょう。
新たにプロジェクトを設計するのであれば、SwiftUI を選択すべきです。

ただ、UIKit ベースのプロジェクトが存在しないかというと、全くそんなことはなく、
規模が大きいプロジェクト程、UIKit から SwiftUI への移行は進んでいない印象を受けます。
まだまだ UIKit メインのプロジェクトも現役です。

2024 年現在、ios ネイティブアプリ開発に関心があるのであれば、必要なスキルと考えて良いでしょう。

## アーキテクチャ

UIKit フレームワークは、一般的な MVC の考え方を踏襲しています。
図解されている内容を確認してください。
[UIKit アプリのコード構造](https://developer.apple.com/documentation/uikit/about_app_development_with_uikit#2928569)
[^1]
![日本語版ドキュメント](https://developer.apple.com/jp/documentation/uikit/about_app_development_with_uikit/)

## ViewController

UIKit においては、ViewController が MVC の重要な役割を果たしています。
・Model と View を仲介する。
・ViewController は、自身が管理する View(UIView)を持つ。
・ViewController は管理下の View を更新したり、View で発生したイベント(ユーザがボタンをタップした、画面が更新された、など)を受け取り、処理をハンドリングする。
・model を変更、更新する。
・model の状態を取得し、View に反映する
・・・など、UIViewController は MVC の中核を担います。UI 構築の中心となるコンポーネントと言って良いでしょう。

[UIViewController](https://developer.apple.com/documentation/uikit/uiviewcontroller)

## View

View は画面の表示を担当するコンポーネントです。一つの View は複数の subview を内包することができます。
下記の図解で、UIView に相当します。

```
┌──────────UIWindow──────────┐
│ ┌─────────UIView───────────┴┐     ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
│ │                           │     ┃                            ┃
│ │                           │     ┃      UIViewController      ┃
│ │                           ◀─────┃   (root view controller)   ┃──┐
│ │                           │     ┃                            ┃  │
│ │                           │     ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛  │
│ │ ┌─────────UIView──────────┴─┐   ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓  │
│ │ │                           │   ┃                            ┃  │
│ │ │                           │   ┃      UIViewController      ┃  │
│ │ │ ┌───UILabel───┐           ◀───┃  (child view controller)   ┃◀─┘
│ │ │ └─────────────┘           │   ┃                            ┃
│ │ │ ┌─UIImageView─┐           │   ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
│ │ │ │             │           │
│ │ │ │             │           │
│ │ │ │             │           │
│ │ │ │             │           │
│ │ │ └─────────────┘           │
│ │ │                           │
│ │ │                           │
│ │ │                           │
│ │ │                           │
│ │ │                           │
│ │ │                           │
│ │ │                           │
│ │ │                           │
│ │ │                           │
│ │ │                           │
│ │ │                           │
└─┤ │                           │
  └─┤                           │
    └───────────────────────────┘
```

[UiView](https://developer.apple.com/documentation/uikit/uiview)

## Model

Model は、主にビジネスロジックを担当します。
Model の役割は広く、プロジェクトによって細分化して設計されていることでしょう。
View や ViewController に相当するもの以外は Model と理解しておき、プロジェクト単位でアーキテクチャを理解することが必要です。

注意すべきことは、**Model の責務を ViewController から適切に切り分け、ViewController を肥大化させない**ことです。
ビジネスロジックを ViewController に実装していくと、数千行の巨大な ViewController になってしまい兼ねません。
[^2]
!巨大化した ViewController を、FatViewController と呼びます

### 次章

[AutoLayout で UI を作成する](../UIkit/AutoLayout/README.md)
