//
//  CreatePaymentDataSource.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 17/1/26.
//

import Foundation

protocol CreatePaymentDataSource {
    func createNewPayment(payment: Payment) throws
}
