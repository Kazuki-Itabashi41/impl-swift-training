

Swift言語は、コンセプトとしてコードの安全性と可読性の高さを売りにしていますが、エラーハンドリングの記述方法からもこの思想が濃厚に伺えます。
エラーが発生する可能性のあるコードに対して、以下のキーワードを使用して明確に処理を記述します。

## throws
throwsは、関数やメソッドがエラーをスローする可能性があることを示します。エラーが発生する可能性がある関数には必ずthrowsを付ける必要があります。
```swift
func validateInput(_ input: String) throws -> Int {
    guard let number = Int(input) else {
        throw OperationError.invalidInput // エラーをスロー
    }
    return number
}
```

## do-catch
do-catchは、スローされたエラーをキャッチして処理するための構文です。doブロック内でエラーをスローする関数を呼び出し、catchブロックでエラーを処理します。
```swift
do {
    let number = try validateInput("42")
    print("入力値: \(number)")
} catch OperationError.invalidInput {
    print("無効な入力です")
} catch {
    print("予期しないエラー: \(error)")
}
```

## try
tryは、エラーをスローする可能性がある関数を呼び出す際に使用します。tryは以下の3つのバリエーションがあります。
・try: 通常のエラーハンドリングを行います。
・try?: エラーを無視してnilを返す。
・try!: エラーが発生しないと保証される場合に使用（エラー発生時にはクラッシュ）。
```swift
// 通常のエラーハンドリング
let number = try validateInput("42")

// エラーを無視してnilを返す
let numberOrNil = try? validateInput("invalid")

// エラーが発生しないと保証される場合
let numberGuaranteed = try! validateInput("42")
```

## rethrows
rethrowsは、エラーをスローする可能性のあるクロージャを引数に取る関数で使用されます。自分ではエラーをスローせず、渡されたクロージャのエラーをスローします。
適切なタイミングで使えると、かなりかっこいいやつです。
```swift
func performOperation(operation: () throws -> Void) rethrows {
    try operation()
}
```