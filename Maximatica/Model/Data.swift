//
//  Data.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Foundation

let historyData = loadHistoryData()

func loadHistoryData() -> History {
    guard let data: History = loadFromDocDir("history.json") else { return loadHistory }
    return data
}

var loadHistory: History {
    
    #if DEBUG
    return History(results: [TestResult(dateTime: Date(),
                                        totalAnswers: 20,
                                        correctAnswers: 18,
                                        timeSpent: 77,
                                        ageGroup: .sevenToNine,
                                        complexity: .basic,
                                        arithmetic: nil)
    ])
    #else
    return History(results: [])
    #endif
}
