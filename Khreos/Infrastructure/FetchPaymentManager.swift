//
//  FetchPaymentManager.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 17/1/26.
//

import Foundation
import CoreData

class FetchPaymentManager: FetchPaymentDataSource {
    let context = PersistentContainer.shared.persistentContainer.viewContext
    
    func fetchPayments(date: Date?, completion: (Result<[Payment], any Error>) -> Void) throws {
        let req = PaymentEntity.fetchRequest()
        
        if let date {
            let predicate = NSPredicate(format: "lastPay >= %@ AND lastPay < %@", date as NSDate, date as NSDate)
            req.predicate = predicate
        }
        
        let payments = try context.fetch(req)
        
        let domainPayments = payments.map { item in
            PaymentMapper.toDomain(from: item)
        }
        
        completion(.success(domainPayments))
    }
}
