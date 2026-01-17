//
//  MainViewContentHeader.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 12/1/26.
//

import SwiftUI

struct MainViewContentHeader: View {
    // MARK: - Properties
    @Binding var payType: PayType
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Debts")
                    .font(.system(size: 16, weight: .black))
                    .foregroundStyle(.primaryLight)
                
                Spacer()
                
                HStack(spacing: 16) {
                    Button {
                        payType = .monthly
                    } label: {
                        Text("Monthly")
                            .font(.system(size: 12, weight: payType == .monthly ? .black : .regular))
                            .foregroundStyle(.white)
                    }
                    Button {
                        payType = .oneTime
                    } label: {
                        Text("One-Time")
                            .font(.system(size: 12, weight: payType == .oneTime ? .black : .regular))
                            .foregroundStyle(.white)
                    }
                }
            }
            HStack(spacing: 4) {
                Text(399.44.toCurrency())
                    .font(.system(size: 14, weight: .black))
                Text("Every month")
                    .font(.system(size: 12, weight: .regular))
            }
            .foregroundStyle(.white)
        }
    }
}

// MARK: - Preview
#Preview {
    MainViewContentHeader(payType: .constant(.monthly))
}
