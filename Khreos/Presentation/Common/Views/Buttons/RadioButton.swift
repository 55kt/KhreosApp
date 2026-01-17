//
//  RadioButton.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 13/1/26.
//

import SwiftUI

struct RadioButton: View {
    // MARK: - Properties
    @Binding var isSelected: Bool
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Circle()
                .stroke(.primaryLight, lineWidth: 2)
                .frame(width: 26, height: 26)
            if isSelected {
                Circle()
                    .fill(.primaryLight)
                    .frame(width: 12, height: 26)
            }
        }
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

// MARK: - Preview
#Preview {
    RadioButton(isSelected: .constant(true))
}
