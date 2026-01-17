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
    
    @Published var payment: Payment?
    
    func createNewPayment() {
        do {
            try createUserCase.execute(payment: Payment(id: UUID().uuidString, type: .monthly, title: "Mock", description: "Mcok", paymentAmount: 222, totalAmount: 1000, isNotificationEnabled: true, createdAt: .now))
            print("Payment is added !")
        } catch {
            print(error.localizedDescription)
        }
    }
}
