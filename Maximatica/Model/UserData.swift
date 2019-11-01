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
    
    @Published var gameInterval: TimeInterval = 0
    
    var isGameOver: AnyPublisher<Bool, Never> {
        $gameInterval
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
    
    @Published var history: History = historyData {
        didSet {    // save data to local JSON
            saveJSON(data: history, filename: "history.json")
        }
    }
}
