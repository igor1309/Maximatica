//
//  History.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Foundation
import SwiftPI

struct History: Codable {
    var results: [TestResult]
}

struct ResultForInterval: Codable, Identifiable {
    var id = UUID()
    
    var interval: DateInterval
    var sessions: Int
    var score: Double
    
    ///  `from TestResult`
    var totalAnswers: Double
    // Количество правильных ответов
    var correctAnswers: Double
    // Затраченное время
    var timeSpent: TimeInterval
    
    ///  `computed properties`
    // Скорость решения, вопросов в минуту
    var velocity: Double { timeSpent == 0 ? 0 : totalAnswers / timeSpent * 60 }
    
    // Тепм(?) решения: секунд на вопрос
    var pace: Double { totalAnswers == 0 ? 0 : timeSpent / totalAnswers }
    
    // Доля правильных ответов
    var correctAnswersShare: Double { totalAnswers == 0 ? 0 : correctAnswers / totalAnswers }
}

extension History {
    var resultsForInterval: [ResultForInterval] {
        //  MARK: - ПРИДУМАТЬ КАК ИЗМЕНЯТЬ
        let component = Calendar.Component.weekOfYear
        
        let firstDate = results.map { $0.dateTime }.min() ?? Date()
        let lastDate = results.map { $0.dateTime }.max() ?? Date()
        
        let intervals = dateIntervals(of: component, startDate: firstDate, endDate: lastDate)
        
        var ress = [ResultForInterval]()
        
        for interval in intervals {
            let slice = results.filter { interval.contains($0.dateTime) }
            
            let res = ResultForInterval(
                interval: interval,
                sessions: slice.count,
                score: slice.reduce(0, { $0 + Score(testResult: $1).finalScore }),
                totalAnswers: slice.reduce(0, { $0 + $1.totalAnswers }),
                correctAnswers: slice.reduce(0, { $0 + $1.correctAnswers }),
                timeSpent: slice.reduce(0, { $0 + $1.timeSpent }) / 60
            )
            
            ress.append(res)
        }
        
        return ress.reversed()
    }
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
        case timeSpent = "Время занятий, всего"
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
        case .timeSpent:
            return slice.map { $0.timeSpent / 60 }
        case .total:
            return slice.map { $0.totalAnswers }
        case .velocity:
            return slice.map { $0.velocity }
        case .pace:
            return slice.map { $0.pace }
        }
    }
    
    func historyData(_ type: HistoryDataType, for period: Period) -> Double {
        let slice = historySlice(period: period)
        
        let totalAnswers = slice.reduce(0, { $0 + $1.totalAnswers })
        let timeSpent = slice.reduce(0, { $0 + $1.timeSpent })
        
        switch type {
        case .correct:
            //  умножение на 100 чтобы использовать smartFormatted
            //  который 1 показывает как 1, а не 100%
            //  делать формат для 1 как 100% неправильно —
            //  тогда может некорректно отображаться темп
            let correctAnswers = slice.reduce(0, { $0 + $1.correctAnswers }) * 100
            return totalAnswers == 0 ? 0 : correctAnswers / totalAnswers
        case .timeSpent:
            return slice.reduce(0, { $0 + $1.timeSpent / 60 })
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
