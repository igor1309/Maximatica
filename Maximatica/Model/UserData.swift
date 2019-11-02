//
//  UserData.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Foundation
import Combine

final class UserData: ObservableObject {
    
    @Published var gameStatus: GameStatus = .score
    
    ///  `параметры миссии` (инициализация)
    
    @Published var ageGroup = AgeGroup(rawValue: UserDefaults.standard.string(forKey: "ageGroup") ?? AgeGroup.sevenToNine.id)! {
        didSet {
            UserDefaults.standard.set(ageGroup.rawValue, forKey: "ageGroup")
        }
    }
    
    @Published var complexity = Complexity(rawValue: UserDefaults.standard.string(forKey: "complexity") ?? Complexity.basic.id)! {
        didSet {
            UserDefaults.standard.set(complexity.rawValue, forKey: "complexity")
        }
    }
    
    var arithmetic: Arithmetic?
    
    @Published var missionMode = MissionMode(rawValue: UserDefaults.standard.string(forKey: "missionMode") ?? MissionMode.time.id)! {
        didSet {
            UserDefaults.standard.set(missionMode.rawValue, forKey: "missionMode")
        }
    }
    
    @Published var missionTime = TimeInterval(UserDefaults.standard.integer(forKey: "missionTime")) {
        didSet {
            UserDefaults.standard.set(missionTime, forKey: "missionTime")
        }
    }
    
    @Published var questionQty = UserDefaults.standard.integer(forKey: "questionQty") {
        didSet {
            UserDefaults.standard.set(questionQty, forKey: "questionQty")
        }
    }
    
    ///  `миссия`
    
    var missionStart = Date()

    @Published var missionTimeCount: TimeInterval = 0
    
    var question = Question()
    
    func nextQuestion() {
        question = Question(arithmetic: arithmetic, complexity: complexity, ageGroup: ageGroup)
    }
    
    
    
    ///  `история` и результаты
    @Published var history: History = historyData {
        didSet {    // save data to local JSON
            saveJSON(data: history, filename: "history.json")
        }
    }
    
}
