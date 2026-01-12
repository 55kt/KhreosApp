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
            HeaderView()
                .zIndex(1)
            ScrollView {
                VStack(alignment: .leading, spacing: 19) {
                    MainViewContentHeader()
                    
                    VStack(alignment: .leading, spacing: 19) {
                        PaymentCardView()
                    }
                }
                .padding(.top, 130)
            }
        }
        .padding(.horizontal, 20)
        .background(.primaryDark)
    }
}



// MARK: - Preview
#Preview {
    MainView()
}
