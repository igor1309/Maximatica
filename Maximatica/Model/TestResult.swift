//
//  TestResult.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Foundation

struct TestResult: Codable, Identifiable {
    var id = UUID()
    
    // Дата и время выполнения задания
    var dateTime: Date
    // Количество решённых задач
    var totalAnswers: Double
    // Количество правильных ответов
    var correctAnswers: Double
    // Затраченное время
    var timeSpent: TimeInterval
    // параметры
    var ageGroup: AgeGroup
    var complexity: Complexity
    var arithmetic: Arithmetic?
}

extension TestResult {
    // Скорость решения, вопросов в минуту
    var velocity: Double { timeSpent == 0 ? 0 : totalAnswers / timeSpent * 60 }
    
    // Тепм(?) решения: секунд на вопрос
    var pace: Double { totalAnswers == 0 ? 0 : timeSpent / totalAnswers }
    
    // Доля правильных ответов
    var correctAnswersShare: Double { totalAnswers == 0 ? 0 : correctAnswers / totalAnswers }
}
