//
//  CustomTextField.swift
//  trainingCalculator
//
//  Created by TakahashiKotomi on 2024/11/12.
import SwiftUI

// カスタムTextField
struct CustomTextField: View {
    @Binding var text: String
    @Binding var binaryResult: String
    @State private var isError: Bool = false
    var body: some View {
        VStack(spacing: 12, content: {
            TextField("好みの数字を入れてね💕", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: ScreenSize.width * 0.75)
                .keyboardType(.numberPad)
                .onChange(of: text, initial: false) {
                    print("isErrorは\(isError)")
                    isError = false
                    binaryResult = ""
                    print("isErrorは\(isError)")
                    do {
                        try validatImputNumber(inputValue: text)
                    } catch {
                        isError = true
                    }
                    print("isErrorは\(isError)")
                }

            Text("有効な値を入力してください")
                .foregroundColor(.white)
                .opacity(isError ? 1 : 0)
        })
    }
    // キャストに失敗した時はcastingrorを返す
    private func validatImputNumber(inputValue: String) throws -> Int32 {
        if let inputValue = Int32(inputValue) {
            print("inputValueは\(inputValue)")
            return inputValue
        } else {
            throw OperationError.castingError
        }
    }
}
