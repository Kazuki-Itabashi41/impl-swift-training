# delegate

デリゲート(委譲)とはデザインパターンの1つで、オブジェクトの処理を別のオブジェクトに代替させるパターンです。
UITabaleView等、基本的なライブラリで使用されています。

## delegateの使用方法

委譲元、委譲先、プロトコルを実装し、クラスインスタンス生成時に委譲処理を行います。
以下に例を示します。

・**委譲元、プロトコル**
```Swift
//プロトコル
protocol animalDelegate: AnyObject {
    func say()
}

//委譲元クラス
class Animal {

    weak var delegate: animalDelegate?

    func greeting() {
        delegate?.say() //実行される処理は委譲先によって変わる
    }
}
```

animalDelegateプロトコルに準拠するクラスにgreeting()の処理を委譲しています。 
委譲先の実装内容によってgreeting()の振る舞いは変わってきます。  

***注意***  
・変数delegateにつけている「weak」は必ずつけてください、メモリリークの原因となります。  
・またプロトコルに関しても「AnyObject」に準拠させてください。(弱参照を使用するためにクラス限定とする必要があります)  
上記に関して今はおまじないと思ってつけてください。  



・**委譲先**
```Swift
//委譲先クラス
class Cat: animalDelegate {
    func say() {
        print("にゃー")
    }
}
```
「animalDelegate」に準拠したCatクラスを作成しました。
プロトコルに準拠しているためsay()メソッドの中身を実装します。   

・**委譲処理**
```Swift
var animal = Animal()
var cat = Cat()
animal.delegate = cat //animalクラスの委譲先をCatクラスに指定

animal.greeting() //print("にゃー")
```

Animalクラス、Catクラスのインスタンスを生成します。  
AnimalクラスのdelegateをCatクラスに指定することで、「delegate?.say()」の処理がCatクラスに委譲されています。

このように委譲先のクラスによって処理を変えることができるため、柔軟に実装することができます。

## 練習

上記ソースを参考に、「Dog」クラスを実装し、「わん！」と出力させてください。
