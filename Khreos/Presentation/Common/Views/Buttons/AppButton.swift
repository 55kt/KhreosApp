//
//  AppButton.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 14/1/26.
//

import SwiftUI

struct AppButton: View {
    // MARK: - Properties
    var text: String
    var textColor: Color
    var buttonBackground: Color
    var strokeColor: Color? = nil
    var type: PayType? = nil
    var selectedType: Binding<PayType?>? = nil
    var action: (() -> Void)? = nil
    
    private var isSelected: Bool {
        if let type = type, let selectedType = selectedType?.wrappedValue {
            return type == selectedType
        }
        return false
    }
    
    // MARK: - Body
    var body: some View {
        Button {
            if let type = type {
                selectedType?.wrappedValue = type
            }
            action?()
        } label: {
            Text(text)
                .font(.system(size: 18, weight: .regular))
                .foregroundStyle(isSelected ? .primaryDark : textColor)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(isSelected ? .primaryLight : buttonBackground)
                .clipShape(Capsule())
                .overlay {
                    if !isSelected {
                        Capsule()
                            .stroke(strokeColor ?? Color.clear, lineWidth: 1)
                    }
                }
        }
        .animation(.easeInOut(duration: 0.2), value: selectedType?.wrappedValue)
    }
}

// MARK: - Preview
#Preview {
    struct PreviewWrapper: View {
        @State private var payType: PayType? = .monthly
        
        var body: some View {
            VStack(spacing: 20) {
                HStack(spacing: 23) {
                    AppButton(
                        text: "Every Month",
                        textColor: .primaryLight,
                        buttonBackground: .clear,
                        strokeColor: .primaryLight,
                        type: .monthly,
                        selectedType: $payType
                    )
                    
                    AppButton(
                        text: "One Time",
                        textColor: .primaryLight,
                        buttonBackground: .clear,
                        strokeColor: .primaryLight,
                        type: .oneTime,
                        selectedType: $payType
                    )
                }
                
                Text("Selected: \(payType == .monthly ? "Monthly" : "One Time")")
                    .foregroundStyle(.primaryLight)
            }
            .padding()
            .background(.primaryDark)
        }
    }
    
    return PreviewWrapper()
}
