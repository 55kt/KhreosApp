//
//  SolidButton.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 12/1/26.
//

import SwiftUI

struct SolidButton: View {
    // MARK: - Propeties
    var text: String
    var textColor: Color
    var strokeColor: Color
    
    // MARK: - Body
    var body: some View {
        Button {
            //
        } label: {
            Text(text)
                .font(.system(size: 18, weight: .regular))
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .foregroundStyle(textColor)
                .overlay {
                    Capsule()
                        .stroke(strokeColor, lineWidth: 1)
                }

        }
    }
}

// MARK: - Preview
#Preview {
    SolidButton(text: "Details", textColor: .primaryLight, strokeColor: .primaryDark)
}
