//
//  RotatingSquare.swift
//  trainingCalculator
//
//  Created by TakahashiKotomi on 2024/11/12.
//

import SwiftUI

// 回転する四角形のビュー
struct RotatingSquare: View {
    @State private var rotationAngle: Double = 0 // 回転角度を保持

    var body: some View {
        Rectangle()
            .fill(Color.green)
            .frame(width: 100, height: 100) // 四角形の大きさを設定
            .rotationEffect(.degrees(rotationAngle), anchor: .center) // 中心を基準に回転
            .onAppear {
                withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                    rotationAngle = 360 // 回転角度を指定
                }
            }
    }
}

#Preview {
    RotatingSquare()
}
