//
//  HeaderView.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 12/1/26.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - Properties
    var page: HeaderViewContent
    var action: () -> Void
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(page.totalPrice.toCurrency())
                    .font(.system(size: 27, weight: .black))
                    .foregroundStyle(.white)
                    .offset(y: -2)
                
                Spacer()
                
                if page.pageType == .main {
                    Button {
                        action()
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
                
            }
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(page.title)
                        .font(.system(size: 32, weight: .black))
                    
                    Spacer()
                    
                    if page.pageType == .paymentList {
                        Button {
                            action()
                        } label: {
                            Image(systemName: "calendar")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 23, height: 23)
                                .padding(.top, 4)
                        }
                    }
                }
                
                Text(page.date)
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
    HeaderView(page: .init(totalPrice: 12.444, title: "Payments", date: "23 September", pageType: .paymentList)) {}
}
