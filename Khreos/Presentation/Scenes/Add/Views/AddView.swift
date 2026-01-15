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
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 25) {
                        VStack(spacing: 25) {
                            Text("Add Payment")
                                .font(.system(size: 18, weight: .black))
                                .foregroundStyle(.primaryLight)
                            
                            HStack(spacing: 23) {
                                AppButton(text: "Every Month", textColor: .primaryLight, buttonBackground: .clear, strokeColor: .primaryLight, type: .monthly, selectedType: $payType) {
                                    // Action
                                }
                                
                                AppButton(text: "One Time", textColor: .primaryLight, buttonBackground: .clear, strokeColor: .primaryLight, type: .oneTime, selectedType: $payType) {
                                    // Action
                                }
                            }
                        }
                        CalendarButton(isShowCalendar: $isShowCalendar, date: $date)
                    }
                    
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
            .safeAreaInset(edge: .bottom) {
                AppButton(text: "Add Payment", textColor: .primaryDark, buttonBackground: .primaryLight) {
                    // Action
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

// MARK: - Page Type Enum
enum PayType {
    case monthly
    case oneTime
}

// MARK: - Preview
#Preview {
    AddView()
}
