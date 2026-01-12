//
//  Double+Extensions.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 12/1/26.
//

import Foundation

extension Double {
    func toCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
