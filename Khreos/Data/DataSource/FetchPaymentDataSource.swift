//
//  FetchPaymentDataSource.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 17/1/26.
//

import Foundation

protocol FetchPaymentDataSource {
    func fetchPayments(date: Date?, completion: (Result<[Payment], Error>) -> Void) throws
}
