//
//  Triangle.swift
//  trainingCalculator
//
//  Created by TakahashiKotomi on 2024/11/12.
//

import SwiftUI

// 三角形シェイプの定義
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY)) // 上部頂点
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY)) // 左下頂点
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // 右下頂点
        path.closeSubpath()
        return path
    }
}

#Preview {
    Triangle()
}
