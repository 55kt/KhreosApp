//
//  AddView.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 14/1/26.
//

import SwiftUI

struct AddView: View {
    // MARK: - Properties
    @State private var nameText: String = ""
    @State private var isNotification: Bool = false
    @State private var payType: PayType? = .monthly
    @State private var date: Date = .now
    @State private var isShowCalendar: Bool = false
    @State private var isAdded: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    @State var vm: AddViewModel = Assembly.createAddViewModel()
    // MARK: - Body
    var body: some View {
        NavigationStack {
            // MARK: - Screens Switch - Condition
            Group {
                if !isAdded {
                    addViewContent
                } else {
                    isAddedSuccess
                }
            }
            // MARK: - Pay Button
            .safeAreaInset(edge: .bottom) {
                AppButton(text: !isAdded ? "Add Payment" : "Done", textColor: .primaryDark, buttonBackground: .primaryLight) {
                    vm.createNewPayment()
                    isAdded ? dismiss() : ()
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .background(Color.clear)
            }
            .background(.primaryDark)
            .ignoresSafeArea(.keyboard)
        }
    }
}

// MARK: - Add View Content
extension AddView {
    var addViewContent: some View {
        ScrollView(.vertical, showsIndicators: false) {
            // MARK: - Header
            Text("Add Payment")
                .font(.system(size: 18, weight: .black))
                .foregroundStyle(.primaryLight)
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 25) {
                    HStack(spacing: 23) {
                        // MARK: - Pay Type Buttons
                        AppButton(text: "Every Month", textColor: .primaryLight, buttonBackground: .clear, strokeColor: .primaryLight, type: .monthly, selectedType: $payType) {
                            // Every Month Pay Action
                        }
                        
                        AppButton(text: "One Time", textColor: .primaryLight, buttonBackground: .clear, strokeColor: .primaryLight, type: .oneTime, selectedType: $payType) {
                            // One Time Pay Action
                        }
                    }
                    // MARK: - Calendar Button
                    CalendarButton(isShowCalendar: $isShowCalendar, date: $date, buttonType: .addPayment)
                }
                
                // MARK: - Fields Area
                VStack(alignment: .leading, spacing: 12) {
                    FieldView(placeholder: "Name of payment", text: $nameText)
                    
                    switch payType {
                    case .monthly:
                        HStack(spacing: 20) {
                            FieldView(placeholder: "Total amount", text: $nameText)
                            FieldView(placeholder: "Monthly payment", text: $nameText)
                        }
                    case .oneTime:
                        FieldView(placeholder: "Total amount", text: $nameText)
                    default:
                        EmptyView()
                    }
                    
                    FieldView(placeholder: "Description", text: $nameText, isTextField: false)
                    
                    // MARK: - Notification Button
                    HStack {
                        Text("Payment notification")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundStyle(.primaryLight)
                            .offset(y: -3)
                        
                        Spacer()
                        
                        RadioButton(isSelected: $isNotification)
                    }
                    .padding(.horizontal, 10)
                }
            }
            .padding(.horizontal, 10)
            .padding(.top, 20)
        }
        .padding(.top, 30)
    }
}
// MARK: - Success Added Screen
extension AddView {
    var isAddedSuccess: some View {
        VStack(alignment: .center, spacing: 20) {
            Image(systemName: "checkmark.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundStyle(.primaryLight)
            Text("Payment is added sucessfully !")
                .font(.system(size: 20, weight: .black))
                .foregroundStyle(.primaryLight)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.primaryDark)
    }
    
}

// MARK: - Preview
#Preview {
    AddView()
}
