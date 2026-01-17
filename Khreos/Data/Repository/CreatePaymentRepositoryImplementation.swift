//
//  CreatePaymentRepositoryImplementation.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 17/1/26.
//

import Foundation

class CreatePaymentRepositoryImplementation: CreatePaymentRepository {
    init(dataSource: CreatePaymentDataSource) {
        self.dataSource = dataSource
    }
    
    private let dataSource: CreatePaymentDataSource
    
    func createPayment(payment: Payment) throws {
        try dataSource.createNewPayment(payment: payment)
    }
}
