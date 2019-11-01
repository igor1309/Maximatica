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
}

final class UserData: ObservableObject {
    
    @Published var status: Status = .score
    
    var question: Question? = nil
    
    var questions: [Question] = QuestionGenerator(questionQty: 2,
                                                  arithmetic: .addition,
                                                  complexity: .basic,
                                                  ageGroup: .sevenToNine).questions
    
        
    @Published var missionTimeCount: TimeInterval = 0
    
    var isGameOver: AnyPublisher<Bool, Never> {
        $missionTimeCount
            .map { $0 == 0 && self.missionMode == .time }
            .eraseToAnyPublisher()
    }
    
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
    
    var arithmetic: Arithmetic?
    
    @Published var history: History = historyData {
        didSet {    // save data to local JSON
            saveJSON(data: history, filename: "history.json")
        }
    }
}
