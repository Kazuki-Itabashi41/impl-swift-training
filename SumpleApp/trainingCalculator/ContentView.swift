//
//  ContentView.swift
//  trainingCalculator
//
//  Created by TakahashiKotomi on 2024/11/11.
//

import SwiftUI

// デバイスの画面サイズを取得する構造体
struct ScreenSize {
    static let width: CGFloat = UIScreen.main.fixedCoordinateSpace.bounds.width
    static let height: CGFloat = UIScreen.main.fixedCoordinateSpace.bounds.height
}


struct ContentView: View {
    @State private var inputNumber: String = ""
    @State private var binaryResult: String = ""
    @State private var isError: Bool = false

    var body: some View {
        ZStack {
            // 背景とアニメーション
            backgroundTriangles()

            // UIレイアウト
            VStack(spacing: 12) {
                Spacer()

                // カスタムTextField
                CustomTextField(text: $inputNumber, binaryResult: $binaryResult)

                // エラーメッセージ
                if isError {
                    Text("有効な値を入力してください")
                        .foregroundColor(.red)
                }

                // 変換ボタン
                if binaryResult.isEmpty {
                    ConvertButton(calculateBinary: calculateBinary)
                }

                // 結果表示
                if !binaryResult.isEmpty {
                    ResultText(inputNumber: $inputNumber, binaryResult: $binaryResult)
                }

                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.black)
        .ignoresSafeArea()
    }

    // 二進数変換のロジック
    private func calculateBinary() {
        do {
            // 入力値を検証し、整数に変換
            let number = try BinaryCalculator.validateInput(inputNumber)

            // 整数を二進数に変換
            binaryResult = BinaryCalculator.convertToBinary(number)

            // エラーフラグをリセット（正常処理の場合）
            isError = false
        } catch {
            // 入力値が無効だった場合、結果をクリア
            binaryResult = ""
            // エラーフラグを設定
            isError = true
        }
    }


    // 背景アニメーションのためのヘルパー
    private func backgroundTriangles() -> some View {
        ZStack {
            RotatingTriangle(backgroudColor: Color.pink)
                .offset(x: .random(in: -100...1), y: .random(in: 1...150))
            RotatingTriangle(backgroudColor: Color.green)
                .offset(x: .random(in: 1...120), y: .random(in: 1...80))
            RotatingTriangle(backgroudColor: Color.red)
                .offset(x: .random(in: -100...1), y: .random(in: -150...1))
            RotatingTriangle(backgroudColor: Color.purple)
                .offset(x: .random(in: 1...60), y: .random(in: -80...1))
        }
    }
}

/// 二進数変換に関する機能を提供するユーティリティ構造体
struct BinaryCalculator {

    /// 入力文字列を検証し、整数に変換する
    static func validateInput(_ input: String) throws -> Int {
        // 入力文字列を整数に変換可能か確認
        guard let number = Int(input) else {
            // 変換失敗時にエラーをスロー
            throw OperationError.castingError
        }
        return number
    }

    /// 整数を二進数に変換する
    static func convertToBinary(_ number: Int) -> String {
        var number = number
        var binaryResult = "" // 二進数の結果を保持する文字列

        // 数値が0になるまで繰り返し処理を実行
        while number > 0 {
            // 2で割った余りを計算
            let remainder = number % 2
            // 二進数の各桁を先頭に追加
            binaryResult = String(remainder) + binaryResult
            // 数値を2で割った商を次のループに使用
            number /= 2
        }

        // 結果が空の場合（入力が0の場合）は "0" を返す
        return binaryResult.isEmpty ? "0" : binaryResult
    }
}


enum OperationError : Error {
    case castingError
}
