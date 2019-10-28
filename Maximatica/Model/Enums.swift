//
//  Enums.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

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
