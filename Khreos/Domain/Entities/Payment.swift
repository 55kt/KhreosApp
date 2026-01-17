//
//  Payment.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 17/1/26.
//

import Foundation

struct Payment: Identifiable {
    let id: String
    let type: PayType
    var title: String
    var description: String
    var paymentAmount: Double
    var totalAmount: Double
    var dueDay: Int?
    var dueDate: Date?
    var isNotificationEnabled: Bool
    var createdAt: Date
}
