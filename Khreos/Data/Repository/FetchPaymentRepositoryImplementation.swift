//
//  FetchPaymentRepositoryImplementation.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 17/1/26.
//

import Foundation

class FetchPaymentRepositoryImplementation: FetchPaymentRepository {
    init(dataSource: FetchPaymentDataSource) {
        self.dataSource = dataSource
    }
    
    private let dataSource: FetchPaymentDataSource
    
    func fetchPayments(drom date: Date?, completion: (Result<[Payment], any Error>) -> Void) throws {
        try dataSource.fetchPayments(date: date, completion: completion)
    }
}
