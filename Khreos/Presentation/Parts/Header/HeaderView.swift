//
//  HeaderView.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 12/1/26.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(1432.32.toCurrency())
                    .font(.system(size: 27, weight: .black))
                    .foregroundStyle(.white)
                    .offset(y: -2)
                
                Spacer()
                
                Button {
                    //
                } label: {
                    ZStack {
                        Circle()
                            .fill(.primaryLight)
                            .frame(width: 25)
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 11)
                            .foregroundStyle(.primaryDark)
                    }
                }

            }
            VStack(alignment: .leading) {
                Text("Debt amount")
                    .font(.system(size: 32, weight: .black))
                Text("15 December")
                    .font(.system(size: 16, weight: .light))
            }
            .foregroundStyle(.primaryLight)
        }
        .padding(.bottom, 20)
        .background(.primaryDark)
    }
}

// MARK: - Preview
#Preview {
    HeaderView()
}
