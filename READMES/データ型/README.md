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
タプル型とは、複数の型をまとめて一つの型として扱う型です。  
定義方法は、(型名1, 型名2, 型名3, ...)のように定義します。  
例) Int型とString型をまとめたもの
```Swift
var tuple: (Int, String)
```
値の代入
```Swift
var tuple: (Int, String)
tuple = (1, "hoge")
```

### 要素へのアクセス
- インデックスによるアクセス  
タプルの要素にはインデックスを通じてアクセスできます。
```Swift
let tuple = (1, "hoge")
let int = tuple.0 //1
let string = tuple.1 //"hoge"
```

- 要素名によるアクセス  
タプルの定義時に各要素に要素名をつけ、その名前を通じて要素にアクセスすることもできます。
```Swift
let tuple = (int: 1, string: "hoge")
let int = tuple.int //1
let string = tuple.string //"hoge"
```

- 代入によるアクセス  
  ()内に区切りで列挙された変数や定数に代入することができます。
```Swift
let int: Int
let string: String
(int, string) = (1, "hoge")
int //1
string //"hoge"
```
また、()内で複数の変数や定数を同時に宣言することもできます。
```Swift
let (int, string) = (1, "hoge")
int //1
string //"hoge"
```

## Array&lt;Element&gt;型
Array&lt;Element&gt;型は順序を持った配列で、[1,2,3]のように表現できます。
また、配列がString型しかないときは[String]型、Int型しかないときは[Int]型と推論されます。
```Swift
let a = [1,2,3] //[Int]型
let b = ["a", "b", "c"] //[String]型
```

空の配列の場合、要素が存在しないため型推論が行えません。そのため、明示してあげる必要があります。
```Swift
let array: [Int] = []
```
配列内に複数の型が含まれる場合はAny型として定義します。
```Swift
let array: [Any] = [1, "hoge"]
```
また、[[Int]]のように配列を要素に持つ配列を二次元配列と呼びます。
```Swift
let array: [[Int]] = [[1,2], [3,4], [5,6]]
```

### Array&lt;Element&gt;型の操作
- 要素へのアクセス  
  配列の先頭を0として、0番目,1番目といったようにアクセスします。  
  インデックスが範囲外の場合エラーとなるため気をつけてください。
```Swift
let array: [String] = ["a", "b", "c"]

let string1 = array[0] // "a"
let string2 = array[1] // "b"
let string3 = array[2] // "c"
let string4 = array[3] // 範囲外のためエラー
```

- 要素の更新、追加、結合、削除 
   
更新
```Swift
let array: [String] = ["a", "b", "c"]
array[0] = "d"
array // ["d", "b", "c"]
```

末尾への追加
```Swift
let array: [String] = ["a", "b", "c"]
array.append("d")
array // ["a", "b", "c", "d"]
```

任意の位置への追加
```Swift
let array: [String] = ["a", "b", "d"]
array.insert("c", at: 2) //2なのでcが3番目になるよう追加されている
array // ["a", "b", "c", "d"]
```

結合
型が一致する場合、+演算子で結合できます。
```Swift
let array1: [String] = ["a", "b", "c"]
let array2: [String] = ["d", "e", "f"]
let res = array1 + array2
res // ["a", "b", "c", "d", "e", "f"]
```

削除
```Swift
let array: [String] = ["a", "b", "c", "d", "e", "f"]
array.remove(at: 1) // 任意のインデックスを削除
array // ["a", "c", "d", "e", "f"]

array.removeLast() //末尾の要素を削除
array //["a", "c", "d", "e"]

array.removeAll() //すべての要素を削除
array // []

```
