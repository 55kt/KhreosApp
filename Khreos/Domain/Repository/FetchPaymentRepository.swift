//
//  FetchPaymentRepository.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 17/1/26.
//

import Foundation

protocol FetchPaymentRepository: AnyObject {
    func fetchPayments(drom date: Date?, completion: (Result<[Payment], Error>) -> Void) throws
}
