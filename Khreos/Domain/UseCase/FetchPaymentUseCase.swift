//
//  FetchPaymentUseCase.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 17/1/26.
//

import Foundation

protocol FetchPaymentUseCase: AnyObject {
    func execute(from date: Date?, completion: (Result<[Payment], Error>) -> Void) throws
}

class FetchPaymentUseCaseImplementation: FetchPaymentUseCase {
    init(repository: FetchPaymentRepository) {
        self.repository = repository
    }
    
    private let repository: FetchPaymentRepository
    
    func execute(from date: Date?, completion: (Result<[Payment], any Error>) -> Void) throws {
        try repository.fetchPayments(drom: date, completion: completion)
    }
}
