//
//  PaymentMapper.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 17/1/26.
//

import Foundation
import CoreData

struct PaymentMapper {
    static func toDomain(from entitie: PaymentEntity) -> Payment {
        let payment = Payment(id: entitie.id, type: PayType(rawValue: Int(entitie.type)) ?? .monthly, title: entitie.title, description: entitie.descriptionText, paymentAmount: entitie.paymentAmount, totalAmount: entitie.totalAmount, isNotificationEnabled: entitie.isNotificationEnable, createdAt: entitie.createdAt, lastPay: entitie.lastPay)
        
        return payment
    }
    
    static func toEntitie(from: Payment, context: NSManagedObjectContext) -> PaymentEntity {
        let entitite = PaymentEntity(context: context)
        
        entitite.id = from.id
        entitite.type = Int16(from.type.rawValue)
        entitite.title = from.title
        entitite.descriptionText = from.description
        entitite.paymentAmount = from.paymentAmount
        entitite.totalAmount = from.totalAmount
        entitite.dueDay = Int16(from.dueDay ?? 0)
        entitite.dueDate = from.dueDate
        entitite.isNotificationEnable = from.isNotificationEnabled
        entitite.createdAt = from.createdAt
        entitite.lastPay = from.lastPay
        return entitite
    }
}
