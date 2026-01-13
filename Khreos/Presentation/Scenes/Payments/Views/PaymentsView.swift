//
//  PaymentsView.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 13/1/26.
//

import SwiftUI

struct PaymentsView: View {
    // MARK: - Details
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .top) {
            HeaderView(page: HeaderViewContent(totalPrice: 11312, title: "Payments", date: "24 December", pageType: .paymentList)) {}
                .zIndex(1)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 19) {
                    PaymentCardView()
                    PaymentCardView()
                }
                .padding(.top, 130)
                .padding(.bottom, 70)
            }
        }
        .padding(.top, 17)
        .padding(.horizontal, 20)
        .background(.primaryDark)
    }
}

// MARK: - Preview
#Preview {
    PaymentsView()
}
