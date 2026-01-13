//
//  DetailsViewHeader.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 13/1/26.
//

import SwiftUI

struct DetailsViewHeader: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        HStack {
            Button {
                //
            } label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.primaryLight)
                    .frame(width: 23, height: 23)
            }
            Spacer()
            Text("Payments Details")
                .font(.system(size: 20, weight: .black))
                .foregroundStyle(.primaryLight)
            Spacer()
            Button {
                //
            } label: {
                Image(systemName: "trash")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.primaryLight)
                    .frame(width: 23, height: 23)
            }
        }
        .padding(.top, 20)
        .padding(.bottom, 15)
        .background(
            Color.primaryDark
                .ignoresSafeArea(edges: .top)
        )
    }
}

// MARK: - Preview
#Preview {
    DetailsViewHeader()
}
