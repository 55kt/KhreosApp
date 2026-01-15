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
    
    // MARK: - Body
    var body: some View {
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
    }
}

// MARK: - Preview
#Preview {
    CalendarButton(isShowCalendar: .constant(false), date: .constant(Date.now))
}
