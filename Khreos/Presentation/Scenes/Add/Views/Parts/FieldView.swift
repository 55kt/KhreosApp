//
//  FieldView.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 14/1/26.
//

import SwiftUI

struct FieldView: View {
    // MARK: - Properties
    var placeholder: String
    @Binding var text: String
    var isTextField: Bool = true
    @FocusState private var isFocused: Bool
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(placeholder)
                .font(.system(size: 14, weight: .light))
                .foregroundStyle(.primaryLight)
            if isTextField {
                TextField("", text: $text)
                    .frame(height: 48)
                    .padding(.horizontal, 10)
                    .background(.offWhite)
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .stroke(.primaryLight, lineWidth: 2)
                    }
            } else {
                TextEditor(text: $text)
                    .frame(height: 154)
                    .padding(.horizontal, 10)
                    .scrollContentBackground(.hidden)
                    .background(.offWhite)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.primaryLight, lineWidth: 2)
                    }
                    .focused($isFocused)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                isFocused = false
                            }
                        }
                    }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    FieldView(placeholder: "Placeholder", text: .constant("Text"))
}
