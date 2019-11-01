//
//  QuestionGenerator.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Foundation

struct QuestionGenerator {
    var questionQty: Int
    var arithmetic: Arithmetic?
    var complexity: Complexity
    var ageGroup: AgeGroup
}

extension QuestionGenerator {
    var questions: [Question] {
        var questions: [Question] = []
        for _ in (0..<questionQty) {
            let question = Question(arithmetic: arithmetic, complexity: complexity, ageGroup: ageGroup)
            questions.append(question)
        }
        return questions
    }
}
