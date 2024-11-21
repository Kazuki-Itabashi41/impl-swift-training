SwiftUIは、宣言的なUIフレームワークです。
なので、あたかもブロックを積み上げるかのような感覚でUIを構築することができます。

##  VStack, HStack, ZStack
SwiftUIで実装を行う上で、まず味方につけたい概念が「Stack」です。
SwiftUIにおいて、Stackは階層構造を提供するViewです。
VStack, HStack, ZStackは、それぞれ 縦・横・階層構造のビューのスタックを提供します。

### ZStack：
ZStackはビューを重ねて表示するためのスタックで、イラストを描く際のレイヤー的に使用することができます。
以下のコードをコピペして、実行してみてください。
テキストが重なって配置されるはずです。
```swift
import SwiftUI

struct ZStackDemoView: View {
    var body: some View {
        ZStack {
            // 一番後ろのテキスト（少し下にオフセット）
            Text("Hello, SwiftUI!")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .offset(x: -5, y: -5)

            // 真ん中のテキスト（中心に配置）
            Text("Hello, SwiftUI!")
                .font(.largeTitle)
                .foregroundColor(.purple)

            // 一番前のテキスト（少し上にオフセット）
            Text("Hello, SwiftUI!")
                .font(.largeTitle)
                .foregroundColor(.red)
                .offset(x: 5, y: 5)
        }
    }
}

#Preview {
    ZStackDemoView()
}

```

### HStack：
HStackは横方向にViewを並べます。
以下は名前ラベルの横にテキストフィールドを配置した例です。
```swift
import SwiftUI

struct HStackFormDemoView: View {
    @State private var name: String = ""

    var body: some View {
        HStack(spacing: 10) {
            // 「名前」ラベル
            Text("名前")
                .font(.headline)
                .foregroundColor(.primary)

            // テキストフィールド
            TextField("名前を入力してください", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200) // テキストフィールドの幅を指定
        }
        .padding()
    }
}

#Preview {
    HStackFormDemoView()
}

```

### VStack：
VStack は縦方向にビューを並べるスタックです。
下記の例ではテキストフィールドの下に送信ボタンを配置しています。
```swift
import SwiftUI

struct HStackFormDemoView: View {
    @State private var name: String = ""

    var body: some View {
        VStack(spacing: 20) {
            // 名前フィールドをHStackで横並びに配置
            HStack(spacing: 10) {
                Text("名前")
                    .font(.headline)
                    .foregroundColor(.primary)

                TextField("名前を入力してください", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200) // テキストフィールドの幅を指定
            }
            .padding()

            // ボタンをVStackで名前フィールドの下に配置
            Button(action: {
                print("名前が入力されました: \(name)")
            }) {
                Text("送信")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    HStackFormDemoView()
}
```

## 余白を表現する
余白の表現方法は3つあります。
- Stackに合わせて使用するspacing
- モディファイアとして付与するpadding
- 余白の調整をするViewであるSpacer()

spacingとSpacerは要素間の余白、paddingは対象物それ自体に付与する余白と、若干の性質の違いがあります。
詳細に確認していきましょう。

### spacing
先ほどのサンプルコード内には` VStack(spacing: 20)`という表現がありますね。
これがspacingです。HStack、VStack、ZStack などの Stack コンテナと合わせて使用するもので、コンテナ内の要素間に設ける余白を指定します。
spacing は各要素間の間隔を設定しますが、要素自体のサイズやレイアウト枠に影響を与えません。

例えば、spacing: 10 にすると、各要素間に10ポイントのスペースが追加され、要素の配置間隔を広げたり狭めたりできます。
```swift
VStack(spacing: 10) {
    Text("Item 1")
    Text("Item 2")
    Text("Item 3")
}
```

### padding
View 自体の内側に余白を追加して、コンテンツとその外側の境界にスペースを設けます。
padding を適用した View は、その View 自体が余白分だけ大きくなります。これは、対象 View の四辺または特定の辺に余白を追加する操作であり、例えば周囲のテキストやアイコンとの間隔を調整するために使用されます。

padding の値を指定することで、周囲に一定の空間を持たせて、見た目を調整したり視認性を高めることができます。
paddingの挙動は、ちょっと癖があります。
色々なViewにつけてみて、様子を確認してみると楽しいかもしれません。

### Spacer()
空白スペースを動的に拡張し、他の要素を押し出す（位置を調整する）ために使うViewです。
Spacer はその周りの要素を自動的に押し広げ、Stack 内の空きスペースを均等に分配します。
Spacer が占有するスペースは他の要素の位置によって変わります。
例えば以下のコードでは、Textは均等に３等分された空間内に配置されます。
```swift
VStack {
    Spacer() // 空きスペースを作成
    Text("Top")
    Spacer() // 空きスペースを作成
    Text("Bottom")
    Spacer() // 空きスペースを作成
}

```
SwiftUIの「宣言的」な性質が色濃く出ているViewだなと考えています。

### 余白　総括
spacing: 要素と要素の間に余白を作る（＝Webのマージンのようなイメージ）
padding: 要素の内側に余白を作り、要素自体を大きくする（＝Webのパディングのようなイメージ）

このように、spacing は 要素間の距離 を調整し、padding は 要素の内側の余白 を調整するものとして、それぞれ異なる用途で使います。
ちょっとややこしいですが、この意識を持って向き合うと、コードから受け取る情報が豊かになります。