//
//  CreatePaymentManager.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 17/1/26.
//

import Foundation
import CoreData

class CreatePaymentManager: CreatePaymentDataSource {
    let context = PersistentContainer.shared.persistentContainer.viewContext
    
    func createNewPayment(payment: Payment) throws {
        let _ = PaymentMapper.toEntitie(from: payment, context: context)
        try context.save()
    }
}
