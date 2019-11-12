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
    var results: [TestResult] = []
    for _ in 0..<88 {
        let totalAnswers = Double(Int.random(in: 2...5)) * 10
        results.append(TestResult(dateTime: Date().addingTimeInterval(TimeInterval(Int.random(in: -15_000_000...0))),
                                  totalAnswers: totalAnswers,
                                  correctAnswers: Double(Int.random(in: 1...Int(totalAnswers / 10)-1) * 10),
                                  timeSpent: TimeInterval(Int.random(in: 30...400)),
                                  ageGroup: AgeGroup.allCases.randomElement()!,
                                  complexity: Complexity.allCases.randomElement()!,
                                  arithmetic: Arithmetic.allCases.randomElement()!))
    }
//    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\ngenerated \(results.count) records")
//    for res in results {
//        print("\(res.dateTime.toString()) \(res.correctAnswers) \(res.totalAnswers) \(res.correctAnswersShare.formattedPercentage)")
//    }
    
    return History(results: results.sorted(by: { $0.dateTime >= $1.dateTime }))
    #else
    return History(results: [])
    #endif
}
