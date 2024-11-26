//
//  ConvertButton.swift
//  trainingCalculator
//
//  Created by TakahashiKotomi on 2024/11/12.
//

import SwiftUI

// ボタンをカスタムコンポーネント化
struct ConvertButton: View {
    let calculateBinary: () -> Void

    var body: some View {
        Button(action: calculateBinary) {
            Text("二進数に変換しちゃうぞ✨")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}
