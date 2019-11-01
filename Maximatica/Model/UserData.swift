//
//  UserData.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Foundation
import Combine

struct Mission {
    var id = UUID()
    
    
    var missionMode = MissionMode(rawValue: UserDefaults.standard.string(forKey: "missionMode") ?? MissionMode.time.id)! {
        didSet {
            UserDefaults.standard.set(missionMode.rawValue, forKey: "missionMode")
        }
    }
    
    var missionTime = TimeInterval(UserDefaults.standard.integer(forKey: "missionTime")) {
        didSet {
            UserDefaults.standard.set(missionTime, forKey: "missionTime")
        }
    }
    
    var questionQty = UserDefaults.standard.integer(forKey: "questionQty") {
        didSet {
            UserDefaults.standard.set(questionQty, forKey: "questionQty")
        }
    }
    
    var arithmetic: Arithmetic?
    
    // или функция типа nextQuestion????
    var question: Question?
    
    var questions: [Question]
    
    init(arithmetic: Arithmetic?, question: Question?, missionMode: MissionMode, missionTime: TimeInterval, questionQty: Int) {
        
        
        self.questions = QuestionGenerator(questionQty: questionQty,
                                           arithmetic: .addition,
                                           complexity: .basic,
                                           ageGroup: .sevenToNine).questions
        
    }
    
}

final class UserData: ObservableObject {
    
    @Published var status: Status = .score
    
    @Published var mission = Mission()
    
    @Published var missionTimeCount: TimeInterval = 0
    
    var isGameOver: AnyPublisher<Bool, Never> {
        $missionTimeCount
            .map { $0 == 0 && self.mission.missionMode == .time }
            .eraseToAnyPublisher()
    }
    
    @Published var history: History = historyData {
        didSet {    // save data to local JSON
            saveJSON(data: history, filename: "history.json")
        }
    }
}
