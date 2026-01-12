//
//  SolidButton.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 12/1/26.
//

import SwiftUI

struct SolidButton: View {
    var body: some View {
        Button {
            //
        } label: {
            Text("Details")
                .font(.system(size: 12, weight: .light))
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.primaryDark)
                .overlay {
                    Capsule()
                        .stroke(.primaryDark, lineWidth: 1)
                }

        }
    }
}

#Preview {
    SolidButton()
}
