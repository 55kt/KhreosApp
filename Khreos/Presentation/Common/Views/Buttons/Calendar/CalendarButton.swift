//
//  CalendarButton.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 15/1/26.
//

import SwiftUI

struct CalendarButton: View {
    // MARK: - Properties
    @Binding var isShowCalendar: Bool
    @Binding var date: Date
    var buttonType: CalendarButtonType
    
    // MARK: - Body
    var body: some View {
        switch buttonType {
        case .addPayment:
            Button {
                isShowCalendar.toggle()
            } label: {
                Text("Pay on \(date.formatted(.dateTime.day().month().year()))")
                    .underline()
                    .font(.system(size: 16, weight: .black))
                    .foregroundStyle(.primaryLight)
            }
            .popover(isPresented: $isShowCalendar) {
                DatePicker("Select Date", selection: $date, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                    .padding()
                    .presentationDetents([.medium])
            }
        case .paymentsList:
            Button {
                isShowCalendar.toggle()
            } label: {
                Image(systemName: "calendar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 23, height: 23)
                    .padding(.top, 4)
                    .foregroundStyle(.primaryLight)
            }
            .popover(isPresented: $isShowCalendar) {
                DatePicker("Select Date", selection: $date, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                    .padding()
                    .presentationDetents([.medium])
            }
        }
    }
}

enum CalendarButtonType {
    case addPayment
    case paymentsList
}

// MARK: - Preview
#Preview {
    CalendarButton(isShowCalendar: .constant(false), date: .constant(Date.now), buttonType: .paymentsList)
}
