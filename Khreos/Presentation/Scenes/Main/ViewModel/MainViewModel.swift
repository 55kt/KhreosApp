//
//  MainViewModel.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 17/1/26.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    private let fetchUseCase: FetchPaymentUseCase
    init(fetchUseCase: FetchPaymentUseCase) {
        self.fetchUseCase = fetchUseCase
    }
    
    @Published var payments: [Payment] = []
    
    func fetchPayments() {
        do {
            try fetchUseCase.execute(from: nil) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let success):
                    DispatchQueue.main.async {
                        self.payments = success
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
