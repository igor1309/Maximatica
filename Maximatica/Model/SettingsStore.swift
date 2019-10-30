//
//  SettingsStore.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Foundation

final class SettingsStore: ObservableObject {
    @Published var ageGroup = AgeGroup(rawValue: UserDefaults.standard.string(forKey: "ageGroup") ?? "7-9 лет")! {
        didSet {
            UserDefaults.standard.set(ageGroup.rawValue, forKey: "ageGroup")
        }
    }

    @Published var сomplexity = Complexity(rawValue: UserDefaults.standard.string(forKey: "сomplexity") ?? "Начальный")!
        {
        didSet {
            UserDefaults.standard.set(сomplexity.rawValue, forKey: "сomplexity")
        }
    }
    
    @Published var period = Period(rawValue: UserDefaults.standard.string(forKey: "period") ?? "Неделя")!
        {
        didSet {
            UserDefaults.standard.set(period.rawValue, forKey: "period")
        }
    }
    
    @Published var questionQty = UserDefaults.standard.integer(forKey: "questionQty") {
        didSet {
            print("questionQty \(questionQty)")
            UserDefaults.standard.set(questionQty, forKey: "questionQty")
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
