//
//  Question.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Foundation

struct Question {
    var arithmetic: Arithmetic
    var complexity: Complexity
    var ageGroup: AgeGroup
    
    var left: Int
    var right: Int
    var result: Int
    
    var sign: String
    
    init(arithmetic: Arithmetic, complexity: Complexity, ageGroup: AgeGroup) {
        self.arithmetic = arithmetic
        self.complexity = complexity
        self.ageGroup = ageGroup
        
        //        switch complexity {
        //        case .basic:
        switch arithmetic {
        case .addition:
            self.left = Int.random(in: 1...9)
            self.right = Int.random(in: 1...9)
            self.result = left + right
        case .subtraction:
            self.left = Int.random(in: 2...9)
            self.right = Int.random(in: 1...left)
            self.result = left - right
        case .multiplication:
            self.left = Int.random(in: 1...9)
            self.right = Int.random(in: 1...9)
            self.result = left * right
        case .division:
            self.right = Int.random(in: 1...9)
            self.result = Int.random(in: 1...9)
            self.left = right * result
        }
        
        var sign: String
        switch arithmetic {
        case .addition:
            sign = "+"
        case .subtraction:
            sign = "-"
        case .multiplication:
            sign = "×"
        case .division:
            sign = "÷"
        }
        self.sign = sign
    }
    
    init(arithmetic: Arithmetic?, complexity: Complexity, ageGroup: AgeGroup) {
        if arithmetic == nil {
            self = Question(arithmetic: Arithmetic.allCases.randomElement()!, complexity: complexity, ageGroup: ageGroup)
        } else {
            self = Question(arithmetic: arithmetic!, complexity: complexity, ageGroup: ageGroup)
        }
    }
}

extension Question {
    init() {
        self = Question(arithmetic: Arithmetic.allCases.randomElement()!,
                        complexity: Complexity.allCases.randomElement()!,
                        ageGroup: AgeGroup.allCases.randomElement()!)
    }
}
