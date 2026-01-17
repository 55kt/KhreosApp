//
//  CreatePaymentRepository.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 17/1/26.
//

import Foundation

protocol CreatePaymentRepository: AnyObject {
    func createPayment(payment: Payment) throws
}
