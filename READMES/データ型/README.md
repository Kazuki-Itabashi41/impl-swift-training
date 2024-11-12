# Swiftのデータ型

数値や文字列を扱えるようにするため、Swiftの標準ライブラリには基本的な値の種類に対応した型が用意されています。

## 基本的な型

- String：文字列
- Int：整数
- Double、Float：浮動小数点
- Bool：真理値

## Optinal&lt;Wrapped&gt;型
Optinal&lt;Wrapped&gt;型は、値があるか空かのどちらかを表す型です。
nilを許容する必要がある場合はOptinal&lt;Wrapped&gt;型を使用します。

Optinal&lt;Wrapped&gt;型にはWrapped?と表記するシンタックスシュガーが用意されているため、Optinal&lt;String&gt;はString?と書くことができます。

### Optinal&lt;Wrapped&gt;型のアンラップ
Optinal&lt;Wrapped&gt;型は値を持っていない可能性があるため(nilを許容しているため)、Wrapped型の変数などと同様に扱うことができません。
例えば、Int?型同士の四則演算はコンパイルエラーとなります。
```Swift
let a: Int? = 1
let b: Int? = 2
a + b  //コンパイルエラーとなる
```

そのため、Wrapped型の変数などと同様に扱うためにはOptinal&lt;Wrapped&gt;型からWrapped型の値を取り出す必要があります。このことをアンラップといいます。

アンラップには下記の3つの方法があります。

- オプショナルバインディング
- ??演算子
- 強制アンラップ

#### オプショナルバインディング

```Swift
if let hoge = Optinal<Wrapped&>型の値 {
    //ここに値が存在するときの処理を書く(Optinal<Wrapped&>型がnilではない)
}
```

このように、値がnilではないことが条件としてWrapped型の値を取り出し処理することができます。

- 例
```Swift
let hoge: String? = "test"
print(type(of: hoge))
// 実行結果 Optional<String>

if let unwrappedString = hoge {
    print(type(of: unwrappedString))
    //実行結果　String
}
```

上記では、String?型を定義し、if-letを用いてアンラップすることでString型を取り出しています。

また、類似の構文としてguard-let文があります。

```Swift
let hoge: String? = "test"
print(type(of: hoge))
// 実行結果 Optional<String>

guard let unwrappedString = hoge else {return}
print(type(of: unwrappedString))
//実行結果 String
```

こちらのguard-let文では、値がnilだったらreturn、存在するなら後続の処理を実行するという処理になっています。  
ケースによって使い分けてみてください。

#### ??演算子

中値演算子??を使用することで値が存在しない場合のデフォルトの値を指定することができます。
```Swift
let hoge: String? = "test"
let unwrappedString = hoge ?? "nilです" // hogeがnilの場合は"nilです"となる
print(unwrappedString)
//実行結果　"test"
```
nilの場合は右辺の値が入ります。
```Swift
let hoge: String? = nil
let unwrappedString = hoge ?? "nilです" // hogeがnilの場合は"nilです"となる
print(unwrappedString)
//実行結果　"nilです"
```

#### 強制アンラップ
強制アンラップを行うには、!を使用します。
```Swift
let a: Int? = 1
let b: Int? = 2
a! + b!  //3
```
強制アンラップは値がnilの場合エラーとなってしまうので、極力使用を避けるのがおすすめです。

## Any型
Any型はどのような型の値も代入できるため、代入する値の型が決まっていない場合に使用します。
```Swift
let string: Any = "aaa"
let int: Any = 123
```

Any型では元の型の情報は失われてしまうため、もとの型では可能であった操作ができなくなってしまいます。  
例)　Int型の四則演算
```Swift
let a: Any = 1
let b: Any = 2
a + b //コンパイルエラー
```

Any型は便利ですが操作の幅を狭めてしまうため、可能な限り型の情報を保つことが望ましいです。

## タプル型
