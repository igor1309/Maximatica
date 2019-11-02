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
    var scoresForLastWeek: [Double] {
        results
            .filter { $0.dateTime >= Date().startOfDay.addDays(-7) }
            .map { Score(testResult: $0).finalScore }.reversed()
    }
    
    var scoreForLastWeek: Double {
        results
            .filter { $0.dateTime >= Date().startOfDay.addDays(-7) }
            .map { Score(testResult: $0).finalScore }.reduce(0, { $0 + $1 })
    }

    var timeSpentForLastWeek: Double {
        results
            .filter { $0.dateTime >= Date().startOfDay.addDays(-7) }
            .reduce(0, { $0 + $1.timeSpent }) / 60
    }

    var score: Double {
        results.map { Score(testResult: $0).finalScore }.reduce(0, { $0 + $1 })
    }

}

extension History {
    var isListEmpty: Bool { results.isEmpty }
    
    enum HistoryDataType: String, CaseIterable, Codable, Hashable {
        case correct = "Доля правильных ответов, %"
        case total = "Количество задач, всего"
        case velocity = "Скорость, задач в минуту"
        case pace = "Темп, секунд на задачу"
        
        var id: String { rawValue }
    }
    
    func historySlice(period: Period) -> [TestResult] {
        let startDate: Date
        
        switch period {
        case .day:
            startDate = Date().startOfDay.addDays(-1)
        case .week:
            startDate = Date().startOfDay.addDays(-7)
        case .month:
            startDate = Date().startOfDay.addDays(-30)
        case .year:
            startDate = Date().startOfDay.addDays(-365)
        }
        
        return results.filter { $0.dateTime >= startDate }
    }
    
    func historySlice(_ type: HistoryDataType, for period: Period) -> [Double] {
        let slice = historySlice(period: period).reversed()
        
        switch type {
        case .correct:
            //  умножение на 100 чтобы использовать smartFormatted
            //  который 1 показывает как 1, а не 100%
            //  делать формат для 1 как 100% неправильно —
            //  тогда модет некорректно отображаться темп
            return slice.map { $0.correctAnswersShare * 100 }
        case .total:
            return slice.map { $0.totalAnswers }
        case .velocity:
            return slice.map { $0.velocity }
        case .pace:
            return slice.map { $0.pace }
        }
    }
    
    func histotyData(_ type: HistoryDataType, for period: Period) -> Double {
        let slice = historySlice(period: period)
        
        let totalAnswers = slice.reduce(0, { $0 + $1.totalAnswers })
        let timeSpent = slice.reduce(0, { $0 + $1.timeSpent })
        
        switch type {
        case .correct:
            //  умножение на 100 чтобы использовать smartFormatted
            //  который 1 показывает как 1, а не 100%
            //  делать формат для 1 как 100% неправильно —
            //  тогда модет некорректно отображаться темп
            let correctAnswers = slice.reduce(0, { $0 + $1.correctAnswers }) * 100
            return totalAnswers == 0 ? 0 : correctAnswers / totalAnswers
        case .total:
            return slice.reduce(0, { $0 + $1.totalAnswers })
        case .velocity:
            return totalAnswers == 0 ? 0 : totalAnswers / timeSpent * 60
        case .pace:
            return totalAnswers == 0 ? 0 : timeSpent / totalAnswers
        }
    }
}

extension History {
    mutating func add(_ item: TestResult) {
        results.insert(item, at: 0)
    }
    
    mutating func reset() {
        results.removeAll()
    }
}
