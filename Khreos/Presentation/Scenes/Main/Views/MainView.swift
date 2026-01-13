//
//  MainView.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 12/1/26.
//

import SwiftUI

struct MainView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .top) {
            HeaderView(page: HeaderViewContent(totalPrice: 14231, title: "Debt Amount", date: "23 September", pageType: .main)) {}
                .zIndex(1)
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 19) {
                    MainViewContentHeader()
                    
                    VStack(alignment: .leading, spacing: 19) {
                        ForEach(0...4, id: \.self) { _ in
                            PaymentCardView()
                        }
                    }
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
    MainView()
}
