//
//  ResultText.swift
//  trainingCalculator
//
//  Created by TakahashiKotomi on 2024/11/12.
//

import SwiftUI

// 計算結果表示用のカスタムコンポーネント
struct ResultText: View {
    // TODO: 命名どうにかしたい
    @Binding var inputNumber: String
    @Binding var binaryResult: String

    var body: some View {
        Text("""
        \(inputNumber)を二進数に変換すると\(binaryResult)になります
        """)
        .frame(width: ScreenSize.width * 0.75)
        .padding(24)
        .background(Color.white)
        .cornerRadius(8)
    }
}
