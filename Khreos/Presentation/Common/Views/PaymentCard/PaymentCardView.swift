//
//  PaymentCardView.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 12/1/26.
//

import SwiftUI

struct PaymentCardView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 5) {
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Credit card debt")
                            .font(.system(size: 24, weight: .black))
                        HStack(spacing: 5) {
                            Text(415.11.toCurrency())
                                .font(.system(size: 12, weight: .black))
                            Text("/ Remaining amount")
                                .font(.system(size: 12, weight: .regular))
                        }
                    }
                    Text("This course will be your personal guide to be an UI")
                        .font(.system(size: 12, weight: .regular))
                }
                
                HStack {
                    HStack(spacing: 5){
                        Text(99.toCurrency())
                            .font(.system(size: 18, weight: .black))
                        Text("/ Mounth")
                            .font(.system(size: 18, weight: .regular))
                    }
                    Spacer()
                    HStack(spacing: 5) {
                        Text("Pay before")
                            .font(.system(size: 12, weight: .light))
                        Text("21.12")
                            .font(.system(size: 12, weight: .black))
                    }
                    .padding(.horizontal, 11)
                    .padding(.vertical, 4)
                    .background(.primaryDark)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                }
            }
            
            HStack(spacing: 4) {
                FullButton(text: "Pay", textColor: .white, buttonBackground: .primaryDark)
                SolidButton(text: "Details", textColor: .primaryDark, strokeColor: .primaryDark)
            }
        }
        .padding(.horizontal, 12)
        .padding(.top, 10)
        .padding(.bottom, 20)
        .background(.alertRed)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

// MARK: - Preview
#Preview {
    PaymentCardView()
}
