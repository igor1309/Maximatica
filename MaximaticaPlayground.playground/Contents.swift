import Foundation

import Foundation

struct Question {
    var arithmetic: Arithmetic
    var complexity: Complexity
    
    var left: Int
    var right: Int
    var result: Int
    
    init(arithmetic: Arithmetic, complexity: Complexity) {
        self.arithmetic = arithmetic
        self.complexity = complexity
        
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
    }
}



struct QuestionGenerator {
    var questionQty: Int
    var arithmetic: Arithmetic
    var complexity: Complexity
}
extension QuestionGenerator {
    var questions: [Question] {
        var questions: [Question] = []
        for _ in (0..<questionQty) {
            let question = Question(arithmetic: arithmetic, complexity: complexity)
            questions.append(question)
        }
        return questions
    }
}

