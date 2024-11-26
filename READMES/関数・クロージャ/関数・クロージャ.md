# 関数・クロージャ
関数とクロージャは、処理を1つにまとめて外部から実行可能にするものです。

## 関数
- 定義方法
```Swift
func 関数名(引数名1: 型, 引数名2: 型 ...) -> 戻り値の型 {
    実行する処理
    必要であればreturn文
}
```

- 実行方法  
関数名(引数名1: 引数1, 引数名2: 引数2 ...)  
と記述することで実行できます。
```Swift
func say(word: String) {
    print(word)
}

say(word: "こんにちは")
//実行結果　こんにちは
```

戻り値が定義されている関数を呼び出す場合、通常戻り値を変数や定数に代入します。
```Swift
func double(x: Int, y: Int) -> Int {
    return x * y
}

let res = double(x: 2, y: 3)
res // 6
```

### 引数

- 外部引数名の省略
外部引数名を省略したい場合は、外部引数名に_を使用します。
```Swift
func double(_ x: Int, _ y: Int) -> Int {
    return x * y
}

let res = double(2, 3)
res //6
```

- デフォルト引数
引数にはデフォルト値を指定でき、デフォルト値を持っている引数は関数呼び出し時に省略できます。
```Swift
func greet(to: String = "Anonymous") {
    print("Hello! \(user)")
}
greet() // Hello! Anonymous

greet(to: Tanaka) // Hello! Tanaka
```

## クロージャ
クロージャとは、スコープ内の変数や定数を保持した一まとまりの処理のことです。

- 定義方法

```Swift
{ (引数名1: 型, 引数名2: 型 ...) -> 戻り値の型 in
    実行する処理
    必要であればreturn文
}
```

- 実行方法

```Swift
let double = { (x: Int) -> Int in
    return x * 2
}

double(3) // 6
```

### 引数
クロージャの引数は関数の引数とだいたい同じですが、クロージャは外部引数名の指定とデフォルト引数の指定ができません。  
そのため、関数で外部引数名を_と指定しているのと同じ状態になります。

- 簡略引数名
クロージャでは引数名の定義を省略し、簡略引数名を使用することができます。  
簡略引数名では、$に引数のインデックスを付けた$0や$1となります。
```Swift
let isEqual: (Int, Int) -> Bool = {
    return $0 == $1
}

isEqual(1, 1) //true
```

簡略引数名を使用したクロージャでは、外部から型推論できない場合はコンパイルエラーとなります。
```Swift
// isEqualの型が不明のためエラー
let isEqual = {
    return $0 == $1
}
```

### 戻り値
戻り値がない関数を定義できるのと同様に、戻り値がないクロージャを定義することもできます。
```Swift
// 戻り値なし
let voidClosure: () -> Void = {}

// 戻り値あり
let notVoidClosure: () -> Int = {
    return 1
}
```

### クロージャによる変数と定数のキャプチャ
クロージャが参照している変数や定数は、クロージャが実行されるスコープが変数や定数が定義されたローカルスコープ以外であってもクロージャの実行時に利用できます。  
これは、クロージャ自身が定義されたスコープの変数や定数を保持しているためです。この機能をキャプチャといいます。
```Swift
let greeting: (String) -> String
do {
    let symbol = "!"
    greeting = { user in
        return "Hello, \(user)\(symbol)"
    }
}
greeting("Tanaka") // Hello, Tanaka!
symbol // スコープ外のためエラー
```

定数greetingはdo文のスコープ外で宣言されているためdo文の外で利用できますが、定数symbolはdo文の外からは利用できません。しかし、定数greetingに代入されたクロージャは、内部でsymbolを使用しているにも関わらず、do文の外で実行できています。  
これは、クロージャがキャプチャによって、自身が定義されたスコープの変数や定数への参照を保持することで実現されています。

```Swift
let counter: () -> Int
do {
    var count = 0
    counter = {
        count += 1
        return count
    }
}
counter() // 1
counter() // 2
```
変数countの初期値は0ですが、実行のたびにcountの値を1増やします。これは変数そのものをキャプチャしているため、変数に対する更新も保持されています。

### トレイリングクロージャ
トレイリングクロージャとは、関数の最後の引数がクロージャの場合に、クロージャを外に出して書くことができる記法です。
```Swift
func example(param: Int, handler: (String) -> Void) {
    handler("param is \(param)")
}

// トレイリングクロージャを使用しない場合
example(param: 1, handler: {string in
print(string) // param is 1
})

// トレイリングクロージャを使用する場合
example(param: 2) { string in 
    print(string) // param is 2
}
```
また、引数が1つのクロージャのみの関数に対してトレイリングクロージャを使用する場合、関数呼び出しの()も省略できます。
```Swift
func example(handler: (String) -> Void) {
    handler("exmple")
}

example { string in
print(string) // example
}
```