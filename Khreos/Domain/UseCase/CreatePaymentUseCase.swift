//
//  CreatePaymentUseCase.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 17/1/26.
//

import Foundation

protocol CreatePaymentUseCase: AnyObject {
    func execute(payment: Payment) throws
}

class CreatePaymentUseCaseImplementation: CreatePaymentUseCase {
    
    init(repository: CreatePaymentRepository) {
        self.repository = repository
    }
    
    private let repository: CreatePaymentRepository
    
    func execute(payment: Payment) throws {
        try repository.createPayment(payment: payment)
    }
}
