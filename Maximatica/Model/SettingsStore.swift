//
//  SettingsStore.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Foundation
import Combine

final class SettingsStore: ObservableObject {
    @Published var gameInterval: TimeInterval = 0
    
    var isGameOver: AnyPublisher<Bool, Never> {
        $gameInterval
//            .debounce(for: 1.1, scheduler: RunLoop.main)
            .map { $0 == 0 }
            .eraseToAnyPublisher()
    }
    
    @Published var missionMode = MissionMode(rawValue: UserDefaults.standard.string(forKey: "missionMode") ?? MissionMode.time.id)! {
        didSet {
            UserDefaults.standard.set(missionMode.rawValue, forKey: "missionMode")
        }
    }
    
    @Published var ageGroup = AgeGroup(rawValue: UserDefaults.standard.string(forKey: "ageGroup") ?? AgeGroup.sevenToNine.id)! {
        didSet {
            UserDefaults.standard.set(ageGroup.rawValue, forKey: "ageGroup")
        }
    }
    
    @Published var сomplexity = Complexity(rawValue: UserDefaults.standard.string(forKey: "сomplexity") ?? Complexity.basic.id)!
        {
        didSet {
            UserDefaults.standard.set(сomplexity.rawValue, forKey: "сomplexity")
        }
    }
    
    @Published var period = Period(rawValue: UserDefaults.standard.string(forKey: "period") ?? Period.week.id)!
        {
        didSet {
            UserDefaults.standard.set(period.rawValue, forKey: "period")
        }
    }
    
    @Published var questionQty = UserDefaults.standard.integer(forKey: "questionQty") {
        didSet {
            UserDefaults.standard.set(questionQty, forKey: "questionQty")
        }
    }
    
    @Published var missionTime = TimeInterval(UserDefaults.standard.integer(forKey: "missionTime")) {
        didSet {
            UserDefaults.standard.set(missionTime, forKey: "missionTime")
        }
    }
    
    @Published var showCorrectAnswer = UserDefaults.standard.bool(forKey: "showCorrectAnswer") {
        didSet {
            UserDefaults.standard.set(showCorrectAnswer, forKey: "showCorrectAnswer")
        }
    }
    
    @Published var hideTimer = UserDefaults.standard.bool(forKey: "hideTimer") {
        didSet {
            UserDefaults.standard.set(hideTimer, forKey: "hideTimer")
        }
    }
}
