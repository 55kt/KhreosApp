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
    @StateObject private var vm = Assembly.createMainViewModel()
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
                            ForEach(vm.payments.filter { $0.type == .monthly }) { item in
                                PaymentCardView(path: $path, payment: item)
                            }
                        case .oneTime:
                            ForEach(vm.payments.filter { $0.type == .oneTime }) { item in
                                PaymentCardView(path: $path, payment: item)
                            }
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
        .onAppear {
            vm.fetchPayments()
        }
    }
}



// MARK: - Preview
#Preview {
    MainView(path: .constant(.init()))
}
