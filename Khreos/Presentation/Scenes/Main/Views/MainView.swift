//
//  MainView.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 12/1/26.
//

import SwiftUI

struct MainView: View {
    // MARK: - Properties
    @State private var isShowAddView: Bool = false
    @State private var date: Date = .now
    @State private var payType: PayType = .monthly
    @Binding var path: NavigationPath
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .top) {
            HeaderView(page: HeaderViewContent(totalPrice: 14231, title: "Debt Amount", date: date.asString, pageType: .main), date: $date) {
                isShowAddView.toggle()
            }
                .zIndex(1)
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 19) {
                    MainViewContentHeader(payType: $payType)
                    
                    VStack(alignment: .leading, spacing: 19) {
                        switch payType {
                        case .monthly:
                            PaymentCardView(path: $path)
                        case .oneTime:
                            Text("One time")
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
        .sheet(isPresented: $isShowAddView) {
            AddView()
        }
    }
}



// MARK: - Preview
#Preview {
    MainView(path: .constant(.init()))
}
