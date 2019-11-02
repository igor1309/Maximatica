//
//  Score.swift
//  Maximatica
//
//  Created by Igor Malyarov on 02.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Foundation

struct Score: Codable, Identifiable {
    var id = UUID()
    
    var testResult: TestResult
}

extension Score {
    var finalScore: Double {
        //  Score = f(arithmetic, velocity or pace, correctAnswersShare, totalAnswers, complexity). But not age!!
        return arithmeticScore() * velocityScore() * correctnessScore() * totalAnswersScore() * complexityScore() / 6
    }
    
    func arithmeticScore() -> Double {
        switch testResult.arithmetic {
        case .addition:
            return 1
        case .subtraction:
            return 1.5
        case .multiplication:
            return 5
        case .division:
            return 7
        case .none:
            //  mix (random)
            return 4.5
        }
    }
    
    func velocityScore() -> Double {
        //  ученик полностью, до автоматизма усвоил тему, если решает пример и записывает в ответ за 4-7 секунд
        if testResult.pace < 5 {
            return 7
        } else if testResult.pace < 8 {
            return 5
        } else if testResult.pace < 12 {
            return 3
        } else {
            return 1
        }
    }
    
    func correctnessScore() -> Double {
        if testResult.correctAnswersShare > 0.9 {
            return 10
        }
        
        if testResult.correctAnswersShare > 0.75 {
            return 7
        }
        
        if testResult.correctAnswersShare > 0.4 {
            return 3
        } else {
            return 0
        }
    }
    
    func totalAnswersScore() -> Double {
        testResult.totalAnswers / 10
    }
    
    func complexityScore() -> Double {
        switch testResult.complexity {
        case .basic:
            return 1
        case .intermediate:
            return 3
        case .advanced:
            return 5
        }
    }
}
