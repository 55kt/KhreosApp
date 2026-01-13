//
//  FullButton.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 12/1/26.
//

import SwiftUI

struct FullButton: View {
    // MARK: - Properties
    var text: String
    var textColor: Color
    var buttonBackground: Color
    
    // MARK: - Body
    var body: some View {
        Button {
            //
        } label: {
            Text(text)
                .font(.system(size: 18, weight: .regular))
                .foregroundStyle(textColor)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(buttonBackground)
                .clipShape(.capsule)

        }

    }
}

// MARK: - Preview
#Preview {
    FullButton(text: "Pay", textColor: .primaryDark, buttonBackground: .primaryLight)
}
