//
//  FullButton.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 12/1/26.
//

import SwiftUI

struct FullButton: View {
    var body: some View {
        Button {
            //
        } label: {
            Text("Pay")
                .font(.system(size: 12, weight: .light))
                .foregroundStyle(.white)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(.primaryDark)
                .clipShape(.capsule)

        }

    }
}

#Preview {
    FullButton()
}
