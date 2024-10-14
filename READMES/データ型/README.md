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
//委譲先クラス
let a: Int? = 1
let b: Int? = 2
a + b  //コンパイルエラーとなる
```
