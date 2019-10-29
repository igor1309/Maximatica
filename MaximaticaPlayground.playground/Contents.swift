import Foundation

enum AgeGroup: String, CaseIterable, Codable, Hashable {
    case upToseven = "До семи лет"
    case sevenToNine = "7-9 лет"
    case nineAndMore = "От 9 лет"
    
    var id: String { rawValue }
}

enum Arithmetic: String, CaseIterable, Codable, Hashable {
    case addition = "Сложение"
    case subtraction = "Вычитание"
    case multiplication = "Умножение"
    case division = "Деление"
    
    var id: String { rawValue }
}

enum Complexity: String, CaseIterable, Codable, Hashable {
    case basic = "Начальный"
    case intermediate = "Средний"
    case advanced = "Продвинутый"
    
    var id: String { rawValue }
}

struct Question {
    var arithmetic: Arithmetic
    var complexity: Complexity
    
    var left: Int
    var right: Int
    var result: Int
    
    var sign: String
    
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
            self.right = Int.random(in: 1...9)
            self.result = Int.random(in: 1...9)
            self.left = right + result
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
            sign = "*"
        case .division:
            sign = "/"
        }
        self.sign = sign
    }
}


struct QuestionGenerator {
    var questionQty: Int
//    var arithmetic: Arithmetic
    var complexity: Complexity
}
extension QuestionGenerator {
    var questions: [Question] {
        var questions: [Question] = []
        for _ in (0..<questionQty) {
            let question = Question(arithmetic: Arithmetic.allCases.randomElement()!,
                                    complexity: complexity)
            questions.append(question)
        }
        return questions
    }
}

let arithmetic: Arithmetic = Arithmetic.allCases.randomElement()!
let questions = QuestionGenerator(questionQty: 10,
//                                  arithmetic: arithmetic,
                                  complexity: .basic).questions
for question in questions {
    print("\(question.left) \(question.sign) \(question.right) = \(question.result)")
}


