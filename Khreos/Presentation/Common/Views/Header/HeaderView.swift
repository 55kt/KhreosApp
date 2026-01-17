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
    @Binding var date: Date
    var action: () -> Void
    
    @State private var isShowCalendar: Bool = false
    
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
                        CalendarButton(isShowCalendar: $isShowCalendar, date: $date, buttonType: .paymentsList)
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
    HeaderView(page: .init(totalPrice: 122.312, title: "Payments", date: "23 December", pageType: .paymentList), date: .constant(.now)) {}
}
