//
//  History.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Foundation

struct History: Codable {
    var results: [TestResult]
}

extension History {
    var isListEmpty: Bool { results.isEmpty }
}

extension History {
    mutating func add(_ item: TestResult) {
        results.insert(item, at: 0)
    }
    
    mutating func reset() {
        results.removeAll()
    }
}
