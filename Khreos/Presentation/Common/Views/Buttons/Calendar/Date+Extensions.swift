//
//  Date+Extensions.swift
//  Khreos
//
//  Created by Vladyslav Mavrodimaki on 16/1/26.
//

import Foundation
import SwiftUI

extension Date {
    var asString: String {
        self.formatted(.dateTime.day().month(.wide).year())
    }
}
