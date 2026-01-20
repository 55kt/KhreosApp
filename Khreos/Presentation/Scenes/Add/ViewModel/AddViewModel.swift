//
//  AddViewModel.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 17/1/26.
//

import Foundation
import Combine

class AddViewModel: ObservableObject {
    private let createUserCase: CreatePaymentUseCase
    init(createUserCase: CreatePaymentUseCase) {
        self.createUserCase = createUserCase
    }
    
    @Published var isNotification: Bool = false
    @Published var payType: PayType? = .monthly
    @Published var isShowCalendar: Bool = false
    @Published var isAdded: Bool = false
    
    // MARK: - Fields
    @Published var paymentName: String = ""
    @Published var descriptionText: String = ""
    @Published var paymentAmount: String = ""
    @Published var totalAmount: String = ""
    @Published var date: Date = .now
    
    func createNewPayment() {
        do {
            try createUserCase.execute(payment: Payment(id: UUID().uuidString,
                                                        type: payType ?? .monthly,
                                                        title: paymentName,
                                                        description: descriptionText,
                                                        paymentAmount: Double(paymentAmount) ?? 0,
                                                        totalAmount: Double(totalAmount) ?? 0,
                                                        dueDay: Int(date.asString),
                                                        dueDate: date,
                                                        isNotificationEnabled: isNotification,
                                                        createdAt: .now,
                                                        lastPay: nil))
            
            isAdded.toggle()
            print("Payment is added !")
        } catch {
            print(error.localizedDescription)
        }
    }
}
