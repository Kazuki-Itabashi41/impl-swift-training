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