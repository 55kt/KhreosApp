//
//  InfoTagView.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 13/1/26.
//

import SwiftUI

struct InfoTagView: View {
    // MARK: - Properties
    var text: String
    
    // MARK: - Body
    var body: some View {
        Text(text)
            .font(.system(size: 16, weight: .black))
            .foregroundStyle(.primaryLight)
            .padding(.horizontal, 17)
            .padding(.vertical, 10)
            .overlay {
                Capsule()
                    .stroke(.primaryLight, lineWidth: 1)
            }
    }
}

// MARK: - Preview
#Preview {
    InfoTagView(text: "213213")
        .padding(50)
        .background(.primaryDark)
}
