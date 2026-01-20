//
//  Assembly.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 17/1/26.
//

import Foundation

class Assembly {
    static func createMainViewModel() -> MainViewModel {
        let dataSource = FetchPaymentManager()
        let repo = FetchPaymentRepositoryImplementation(dataSource: dataSource)
        let useCase = FetchPaymentUseCaseImplementation(repository: repo)
        return MainViewModel(fetchUseCase: useCase)
    }
    
    static func createAddViewModel() -> AddViewModel {
        let manager = CreatePaymentManager()
        
        let repo = CreatePaymentRepositoryImplementation(dataSource: manager)
        let useCase = CreatePaymentUseCaseImplementation(repository: repo)
        return AddViewModel(createUserCase: useCase)
    }
}
